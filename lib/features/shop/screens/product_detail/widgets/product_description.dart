import 'package:flutter/material.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({
    super.key,
  });

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  List<bool> isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
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
            constraints: const BoxConstraints(minHeight: 30, minWidth: 190),
            onPressed: (int index) {
              setState(() {
                for (int buttonIndex = 0;
                    buttonIndex < isSelected.length;
                    buttonIndex++) {
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
          isSelected[0] ? const OverviewContent() : const ReviewsContent(),
          const SizedBox(height: 10),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class OverviewContent extends StatelessWidget {
  const OverviewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Our tractors are precision-crafted, durable, and engineered with top-grade materials and advanced technology, offering unmatched reliability and performance for various projects and tasks.',
              style: TextStyle(
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
