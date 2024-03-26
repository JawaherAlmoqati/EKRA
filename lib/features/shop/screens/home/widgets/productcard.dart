import 'package:ekra/common/widgets/custom_shapes/rounded_container.dart';
import 'package:ekra/common/widgets/images/RoundedImage.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
        child: const Column(
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
                    imageUrl: "assets/images/Compactor.png",
                    applyImageRadius: false,
                    // height: 199,
                  ),
                ],
              ),
            ),
            // SizedBox(height: 8),
            //details
            Padding(
              padding: EdgeInsets.only(left: 4),
              child: Column(
                //  mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Compactor",
                    style: TextStyle(
                        color: Color(0xff3A3A3A),
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                  //SizedBox(height: 4),
                  Row(
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
                  SizedBox(height: 15),

                  Row(
                    children: [
                      Text(
                        "\$170 SAR/day",
                        style: TextStyle(
                          color: Color(0xffFEBD59),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 20),
                      Icon(
                        Icons.star,
                        color: Color(0xffFEBD59),
                      ),
                      Text(
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
