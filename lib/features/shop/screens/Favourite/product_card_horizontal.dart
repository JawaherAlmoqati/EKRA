//import 'package:ekra/features/shop/models/product_model.dart';
import 'package:ekra/common/widgets/custom_shapes/rounded_container.dart';
import 'package:ekra/common/widgets/images/rounded_image.dart';

//import 'package:ekra/features/shop/screens/product_detail/product_detail_screen.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({
    super.key,
  });

  //final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        //  onTap: () => Get.to(() => ProductDetail(item: item)),
        child: Container(
            width: 310,
            height: 150,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const RoundedContainer(
                height: 150,
                width: 150,
                padding: EdgeInsets.all(6),
                backgroundColor: Colors.white,
                child: RoundedImage(
                  //  width: 120,
                  // height: 150,
                  imageUrl: "assets/images/Compactor.png",
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: Text(
                            "Compacter",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.favorite_sharp),
                          color: const Color(0xFF2C3B58),
                          onPressed: () {}, // Add your onPressed function here
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0xffFEBD59),
                          ),
                          SizedBox(width: 4),
                          Text(
                            "0.0",
                            style: TextStyle(
                              color: Color(0xff5A5A5A),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        const Text(
                          "650SRA",
                          style: TextStyle(
                            color: Color(0xffFEBD59),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 70),
                        SizedBox(
                          width: 80,
                          height: 25,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xFFFEBD59)),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xFF333333)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              // Implement functionality
                            },
                            child: const Text('Rent Now'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ])));
  }
}
