//import 'package:ekra/features/shop/controllers/product_controller.dart';
import 'package:ekra/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({super.key, required this.item});

  final ProductModel item;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  List<bool> isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ToggleButtons(
            selectedColor: const Color(0xffFEBD59),
            fillColor: const Color(0xFFFAFAFA),
            constraints: BoxConstraints(minHeight: 30, minWidth: width / 2.2, maxWidth: width),
            onPressed: (int index) {
              setState(() {
                for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                  isSelected[buttonIndex] = false;
                }
                isSelected[index] = true;
              });
            },
            isSelected: isSelected,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('OVERVIEW'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('REVIEWS'),
              ),
            ],
          ),
          isSelected[0] ? OverviewContent(item: widget.item) : const ReviewsContent(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class OverviewContent extends StatelessWidget {
  const OverviewContent({super.key, required this.item});
  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    //final controller = ProductController.instance;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              item.description ?? 'No description available',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ),
          // Add more content if needed
        ],
      ),
    );
  }
}

class ReviewsContent extends StatelessWidget {
  const ReviewsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Reviews will be shown here.',
              // Add more content or build a list of reviews
            ),
          ),
        ],
      ),
    );
  }
}
