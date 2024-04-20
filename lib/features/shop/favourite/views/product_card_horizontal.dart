//import 'package:ekra/features/shop/models/product_model.dart';
import 'package:ekra/common/widgets/images/rounded_image.dart';
import 'package:ekra/features/shop/favourite/bloc/favourite_bloc.dart';
import 'package:ekra/features/shop/models/product_model.dart';
import 'package:ekra/features/shop/screens/product_detail/product_detail_screen.dart';
import 'package:flutter/cupertino.dart';
//import 'package:ekra/features/shop/screens/product_detail/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
//import 'package:get/get.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final FavouriteBloc favouriteBloc = context.watch<FavouriteBloc>();
    return GestureDetector(
      onTap: () => Get.to(
        () => ProductDetail(item: product),
      ),
      child: Container(
        width: 310,
        height: 120,
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: RoundedImage(
                width: 150,
                height: 120,
                isNetworkImage: true,
                applyImageRadius: false,
                imageUrl: product.images?.first ?? '',
                fit: BoxFit.cover,
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
                      Expanded(
                        child: Text(
                          product.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.favorite_sharp),
                        color: const Color(0xFF2C3B58),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog.adaptive(
                                title: const Text('Remove from Favourite'),
                                content: const Text('Are you sure you want to remove this item from your favourite list?'),
                                actions: [
                                  CupertinoDialogAction(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  CupertinoDialogAction(
                                    isDestructiveAction: true,
                                    onPressed: () {
                                      favouriteBloc.add(RemoveFromFavourite(product.id));
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Remove'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  const Row(
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
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        product.price.toString(),
                        style: const TextStyle(
                          color: Color(0xffFEBD59),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 80,
                        height: 25,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFFEBD59)),
                            foregroundColor: MaterialStateProperty.all<Color>(const Color(0xFF333333)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            // Implement functionality
                          },
                          child: const Text('Rent'),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
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
