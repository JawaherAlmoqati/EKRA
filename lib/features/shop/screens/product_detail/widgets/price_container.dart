//import 'package:ekra/features/shop/controllers/product_controller.dart';
import 'package:ekra/features/shop/models/product_model.dart';
import 'package:ekra/features/shop/screens/product_detail/user_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PriceContainer extends StatelessWidget {
  const PriceContainer({super.key, required this.item});

  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    //final controller = ProductController.instance;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10), // Adjust spacing as needed
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        //border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(child: PriceItem(amount: '${item.price.toStringAsFixed(0)} SAR', period: 'a day')),
          verticalDivider(),
          // PriceItem(amount: '${item.weeklyRate.toStringAsFixed(0)} SAR', period: 'a week'),
          // verticalDivider(),
          // PriceItem(amount: '${item.monthlyRate.toStringAsFixed(0)} SAR', period: 'a month'),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  Get.to(
                    () => UserDetailsScreen(
                      user: item.user!,
                      userId: item.userId ?? '',
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  // width: 120,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFFD9E61),
                        Color.fromARGB(255, 246, 230, 200),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Owner',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        item.user!.fullName ?? '',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget verticalDivider() {
  return Container(
    height: 30,
    width: 1,
    color: Colors.grey[300],
    margin: const EdgeInsets.symmetric(horizontal: 0),
  );
}

class PriceItem extends StatelessWidget {
  final String amount;
  final String period;

  const PriceItem({super.key, required this.amount, required this.period});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(amount, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4.0),
        Text(period, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
