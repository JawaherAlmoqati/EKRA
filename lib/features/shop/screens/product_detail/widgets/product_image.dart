import 'package:ekra/common/widgets/images/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
            height: 400,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: RoundedImage(
                    applyImageRadius: true,
                    imageUrl: "assets/images/Compactorpic.jpg"),
              ),
            )),
        Positioned(
          right: 0,
          bottom: 30,
          left: 24,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                  3,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: AnimatedContainer(
                          curve: Curves.easeIn,
                          duration: const Duration(milliseconds: 500),
                          width: index == 0 ? 40 : 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ))
            ],
          ),
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
      ],
    );
  }
}
