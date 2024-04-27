import 'package:ekra/features/shop/favourite/bloc/favourite_bloc.dart';
import 'package:ekra/features/shop/models/product_model.dart';
import 'package:ekra/features/shop/screens/product_detail/checkout/select_quantity_duration_screen.dart';
import 'package:ekra/features/shop/screens/product_detail/widgets/price_container.dart';
import 'package:ekra/features/shop/screens/product_detail/widgets/product_description.dart';
import 'package:ekra/features/shop/screens/product_detail/widgets/product_details.dart';
import 'package:ekra/features/shop/screens/product_detail/widgets/product_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, required this.item});

  final ProductModel item;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late final FavouriteBloc _favouriteBloc;
  @override
  void initState() {
    _favouriteBloc = context.read<FavouriteBloc>();
    _favouriteBloc.add(CheckIfFavourite(widget.item.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final FavouriteBloc favouriteBloc = context.watch<FavouriteBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 200), // Adjust padding to avoid overlap
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProductImage(item: widget.item),
                    ProductDetails(item: widget.item),
                    PriceContainer(item: widget.item),
                    ProductDescription(item: widget.item),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xffFEBD59),
                    ),
                    child: BlocBuilder<FavouriteBloc, FavouriteState>(
                      builder: (context, state) {
                        if (state is AddToFavouriteInProgress || state is RemoveFromFavouriteInProgress || state is CheckIfFavouriteInProgress) {
                          return const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is AddToFavouriteSuccess || (state is CheckIfFavouriteSuccess && state.isFavourite == true)) {
                          return IconButton(
                            icon: const Icon(Icons.favorite),
                            color: Colors.white,
                            onPressed: () {
                              favouriteBloc.add(RemoveFromFavourite(widget.item.id));
                            },
                          );
                        }
                        return IconButton(
                          icon: const Icon(Icons.favorite_border),
                          color: Colors.white,
                          onPressed: () {
                            if (FirebaseAuth.instance.currentUser != null) {
                              favouriteBloc.add(AddToFavourite(widget.item.id));
                            } else {
                              Get.snackbar(
                                'Error',
                                'Please login to add this product to your favourite list',
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 229,
                    height: 52,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFFEBD59)),
                        foregroundColor: MaterialStateProperty.all<Color>(const Color(0xFF333333)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (FirebaseAuth.instance.currentUser != null) {
                          if (widget.item.userId != FirebaseAuth.instance.currentUser?.uid) {
                            Get.to(
                              SelectQuantityandDurationScreen(item: widget.item),
                            );
                          } else {
                            Get.snackbar('Error', 'You can not rent your own product', snackPosition: SnackPosition.BOTTOM);
                          }
                        } else {
                          Get.snackbar(
                            'Error',
                            'Please login to rent this product',
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        }
                      },
                      child: const Text('Check for Available'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
