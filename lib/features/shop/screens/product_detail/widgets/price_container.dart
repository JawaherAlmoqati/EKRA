import 'package:flutter/material.dart';

class PriceContainer extends StatelessWidget {
  const PriceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.symmetric(vertical: 10), // Adjust spacing as needed
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        //border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const PriceItem(amount: '640 SAR', period: 'a day'),
          verticalDivider(),
          const PriceItem(amount: '3,200 SAR', period: 'a week'),
          verticalDivider(),
          const PriceItem(amount: '14,000 SAR', period: 'a month'),
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
        Text(amount,
            style:
                const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4.0),
        Text(period, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
