import 'package:ekra/common/widgets/images/rounded_image.dart';
import 'package:ekra/features/shop/bloc/product_bloc.dart';
import 'package:ekra/features/shop/models/order_model.dart';
import 'package:ekra/features/shop/models/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SelectQuantityandDurationScreen extends StatefulWidget {
  const SelectQuantityandDurationScreen({
    super.key,
    required this.item,
  });

  final ProductModel item;

  @override
  State<SelectQuantityandDurationScreen> createState() => _SelectQuantityandDurationScreenState();
}

class _SelectQuantityandDurationScreenState extends State<SelectQuantityandDurationScreen> {
  int quantity = 1;

  PickerDateRange? _range;
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = args.value as PickerDateRange;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ProductBloc productBloc = context.watch<ProductBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.name),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.item.images != null && widget.item.images!.isNotEmpty)
                    RoundedImage(
                      imageUrl: widget.item.images!.first,
                      isNetworkImage: true,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  const SizedBox(
                    width: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.item.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: DropdownButton(
                            underline: const SizedBox(),
                            value: quantity.toString(),
                            borderRadius: BorderRadius.circular(16),
                            isDense: true,
                            items: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'].map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                quantity = int.tryParse(value.toString()) ?? 1;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Select Duration',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            // Date Range picker
            SfDateRangePicker(
              backgroundColor: Colors.transparent,
              selectionColor: const Color(0xffFFD700),
              headerStyle: const DateRangePickerHeaderStyle(
                textAlign: TextAlign.center,
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Colors.transparent,
              ),
              rangeSelectionColor: const Color(0xffFFD700).withOpacity(0.1),
              todayHighlightColor: const Color(0xffFFD700),
              endRangeSelectionColor: const Color(0xffFFD700),
              startRangeSelectionColor: const Color(0xffFFD700),
              onSelectionChanged: _onSelectionChanged,
              enablePastDates: false,
              selectionMode: DateRangePickerSelectionMode.range,
              initialSelectedRange: PickerDateRange(
                DateTime.now(),
                DateTime.now().add(
                  const Duration(
                    days: 2,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Text(
                    'Total: ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '${widget.item.price * quantity} SAR',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  BlocConsumer<ProductBloc, ProductState>(
                    listener: (context, state) {
                      if (state is BookProductSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Product Booked Successfully'),
                          ),
                        );
                        Navigator.of(context).pop();
                      } else if (state is BookProductFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.errorMessage),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is BookProductInProgress) {
                        return const CircularProgressIndicator();
                      }
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffFFD700),
                        ),
                        onPressed: () {
                          if (_range != null && _range!.startDate != null && _range!.endDate != null) {
                            productBloc.add(
                              BookProduct(
                                order: OrderModel(
                                  orderDate: DateTime.now(),
                                  item: widget.item,
                                  quantity: quantity,
                                  totalAmount: widget.item.price * quantity,
                                  customerName: FirebaseAuth.instance.currentUser?.displayName ?? '',
                                  rangeValues: _range != null
                                      ? RangeValues(
                                          _range!.startDate!.millisecondsSinceEpoch.toDouble(),
                                          _range!.endDate!.millisecondsSinceEpoch.toDouble(),
                                        )
                                      : null,
                                  customerId: FirebaseAuth.instance.currentUser?.uid,
                                  status: OrderStatus.pending,
                                  orderId: '',
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please select a date range'),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'Book Now',
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
