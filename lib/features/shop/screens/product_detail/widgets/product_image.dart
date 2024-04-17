import 'package:ekra/common/widgets/images/rounded_image.dart';
import 'package:ekra/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatefulWidget {
  const ProductImage({
    super.key,
    required this.item,
  });

  final ProductModel item;

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  PageController? _pageController;
  @override
  void initState() {
    _pageController = PageController();
    _pageController!.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 400,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {});
            },
            itemCount: widget.item.images!.length,
            itemBuilder: (context, index) {
              return RoundedImage(
                imageUrl: widget.item.images![index],
                applyImageRadius: false,
                isNetworkImage: true,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        if (_pageController?.positions != null && _pageController!.positions.isNotEmpty)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.item.images!.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _pageController!.page == index ? 16 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: _pageController!.page == index ? const Color(0xffFEBD59) : const Color(0xffD8D8D8),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
