import 'package:ekra/features/shop/bloc/product_bloc.dart';
import 'package:ekra/features/shop/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectPaymentMethod extends StatefulWidget {
  const SelectPaymentMethod({super.key, required this.item});
  final OrderModel item;

  @override
  State<SelectPaymentMethod> createState() => _SelectPaymentMethodState();
}

class _SelectPaymentMethodState extends State<SelectPaymentMethod> {
  @override
  Widget build(BuildContext context) {
    final ProductBloc productBloc = context.watch<ProductBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Payment Method'),
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
            const SizedBox(height: 20),
            const Opacity(
              opacity: 0.4,
              child: ListTile(
                leading: Icon(Icons.check_circle),
                title: Text('Credit Card'),
                onTap: null,
              ),
            ),
            const Divider(),
            const Opacity(
              opacity: 0.4,
              child: ListTile(
                leading: Icon(Icons.check_circle),
                title: Text('Paypal'),
                onTap: null,
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.check_circle, color: Colors.green),
              title: const Text('Cash on Delivery'),
              onTap: () {
                // Navigate to cash on delivery screen
              },
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
                    productBloc.add(
                      BookProduct(order: widget.item),
                    );
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
    );
  }
}
