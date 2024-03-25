// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ekra/features/shop/models/CategoryModel.dart'; // Import your CategoryModel class

class CategoriesList extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CategoriesList({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: categoryData.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onTap(index), // Notify parent widget of tap event
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Container(
                    width: 64,
                    height: 64,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: index == selectedIndex
                          ? Colors.amber
                          : Colors
                              .transparent, // Change color based on selection
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Image(
                        image: AssetImage(categoryData[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    categoryData[index].name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
