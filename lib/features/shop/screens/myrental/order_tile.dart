import 'package:ekra/common/widgets/images/rounded_image.dart';
import 'package:ekra/features/shop/bloc/product_bloc.dart';
import 'package:ekra/features/shop/models/order_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;

  OrderTile({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    bool isPending = order.status == OrderStatus.pending;
    bool isProductMine = order.item?.userId == FirebaseAuth.instance.currentUser?.uid;
    final ProductBloc productBloc = context.watch<ProductBloc>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (order.item!.images != null && order.item!.images!.isNotEmpty)
              SizedBox(
                width: 100,
                height: isPending ? 170 : 120,
                child: RoundedImage(
                  imageUrl: order.item!.images!.first,
                  isNetworkImage: true,
                  fit: BoxFit.cover,
                ),
              ),
            if (order.item!.images != null && order.item!.images!.isNotEmpty)
              const SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          order.item!.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: isPending
                                ? const Color(0xffFFD700)
                                : Colors.green,
                            borderRadius: BorderRadius.circular(99),
                          ),
                          child: Text(
                            '${extractFirstLetter(order.status.toString().split('.').last)}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Total Amount: ${order.totalAmount}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Quantity: ${order.quantity}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Order Date: ${convertDateFromString(order.orderDate.toString())}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    if (isPending && isProductMine) ...[
                      const SizedBox(height: 5),
                      BlocConsumer<ProductBloc, ProductState>(
                        listener: (context, state) {
                          if (state is UpdateOrderStatusSuccess) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content:
                                  Text('Order status updated successfully'),
                            ));
                          }
                          if (state is UpdateOrderStatusFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(state.errorMessage),
                            ));
                          }
                        },
                        builder: (context, state) {
                          if (state is UpdateOrderStatusInProgress) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return Row(
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                ),
                                onPressed: () {
                                  confirmActionPopup(
                                    context,
                                    'Reject Order',
                                    'Are you sure you want to reject this order?',
                                    () {
                                      productBloc.add(
                                        UpdateOrderStatus(
                                          orderId: order.orderId ?? '',
                                          status: OrderStatus.cancelled,
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: const Text('Reject',
                                    style: TextStyle(color: Colors.white)),
                              ),
                              const Spacer(),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.green),
                                ),
                                onPressed: () {
                                  confirmActionPopup(
                                    context,
                                    'Accept Order',
                                    'Are you sure you want to accept this order?',
                                    () {
                                      productBloc.add(
                                        UpdateOrderStatus(
                                          orderId: order.orderId ?? '',
                                          status: OrderStatus.onRent,
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: const Text('Accept',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  confirmActionPopup(
      BuildContext context, String title, String message, Function onConfirm) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                onConfirm();
                Navigator.pop(context);
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  convertDateFromString(String strDate) {
    DateTime todayDate = DateTime.parse(strDate);
    return "${todayDate.day} ${months![todayDate.month - 1]} ${todayDate.year}";
  }

  // write a function to make first letter capital
  extractFirstLetter(String name) {
    return name[0].toUpperCase() + name.substring(1);
  }

  final List<String>? months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
}
