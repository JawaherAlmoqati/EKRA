import 'package:ekra/common/widgets/custom_shapes/rounded_container.dart';
import 'package:ekra/common/widgets/images/rounded_image.dart';
import 'package:ekra/features/shop/models/product_model.dart';
import 'package:ekra/features/shop/screens/product_detail/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.item});

  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetail(item: item)),
      child: Container(
        width: 216,
        height: 293,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 50,
                spreadRadius: 7,
                offset: const Offset(0, 2)),
          ],
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundedContainer(
              //  height: 180,
              width: 216,
              padding: EdgeInsets.zero,
              backgroundColor: Colors.white,
              child: Stack(
                children: [
                  RoundedImage(
                    imageUrl: item.image,
                    applyImageRadius: false,
                    isNetworkImage: true,
                    // height: 199,
                  ),
                ],
              ),
            ),

            //details
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                        color: Color(0xff3A3A3A),
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                  //SizedBox(height: 4),
                  const Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Color(0xff3F3F3F),
                        size: 20,
                      ),
                      Text(
                        "6 km away",
                        style: TextStyle(
                          color: Color(0xff3A3A3A),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),

                  Row(
                    children: [
                      Text(
                        item.price.toString(),
                        style: const TextStyle(
                          color: Color(0xffFEBD59),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 20),
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
