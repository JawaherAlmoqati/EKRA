import 'package:ekra/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.item,
  });
  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: const TextStyle(
                  color: Color(0xff3A3A3A),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                //  textAlign: TextAlign.left,
              ),
              const Spacer(),
              const Icon(
                Icons.star,
                color: Color(0xffFEBD59),
              ),
              const Text(
                "4.3",
                style: TextStyle(
                  color: Color(0xff5A5A5A),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          
        ],
      ),
    );
  }
}
