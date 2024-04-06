//import 'package:ekra/common/widgets/custom_shapes/curved_edges_widget.dart';

import 'package:ekra/features/shop/screens/product_detail/widgets/price_container.dart';
import 'package:ekra/features/shop/screens/product_detail/widgets/product_description.dart';
import 'package:ekra/features/shop/screens/product_detail/widgets/product_details.dart';
import 'package:ekra/features/shop/screens/product_detail/widgets/product_image.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFE7E6E1), Color(0xFFFAFAFA)],
      )),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProductImage(),
              ProductDetails(),
              PriceContainer(),
              ProductDescription(),
            ],
          ),
        ),
      ),
    );
  }
}
