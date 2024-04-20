import 'package:ekra/features/shop/controllers/product_controller.dart';
import 'package:ekra/features/shop/favourite/bloc/favourite_bloc.dart';
import 'package:ekra/features/shop/screens/home/widgets/CategoriesList.dart';
import 'package:ekra/features/shop/screens/home/widgets/appbar.dart';
import 'package:ekra/features/shop/screens/home/widgets/hsearchbar.dart';
import 'package:ekra/features/shop/screens/home/widgets/productcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class HomeeScreen extends StatefulWidget {
  const HomeeScreen({super.key});
  static List<String> PreviousSearchs = [];

  @override
  State<HomeeScreen> createState() => _HomeeScreenState();
}

class _HomeeScreenState extends State<HomeeScreen> {
  late final FavouriteBloc _favouriteBloc;
  int selectedIndex = 0;
  late ProductController controller;
  @override
  void initState() {
    super.initState();
    _favouriteBloc = context.read<FavouriteBloc>();
    _favouriteBloc.add(const GetFavouriteItems());
    controller = Get.put(ProductController());
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFE7E6E1), Color(0xFFFAFAFA)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                //appbar
                const Happbar(),
                const SizedBox(height: 20),
                const HsearchBar(),
                const SizedBox(height: 25),

                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 24,
                          // ignore: use_full_hex_values_for_flutter_colors
                          color: Color(0xff81d1d21),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                //const SizedBox(height: 8),

                CategoriesList(
                    selectedIndex: selectedIndex,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    }),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 16,
                  ),
                  child: Row(
                    children: [
                      const Text(
                        "Popular choices",
                        style: TextStyle(
                          fontSize: 24,
                          // ignore: use_full_hex_values_for_flutter_colors
                          color: Color(0xff81d1d21),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "View all",
                          style: TextStyle(
                            color: Color(0xff6A6B6C),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                Obx(() {
                  // Here, you check if the products are still loading
                  if (controller.isLoading.value) {
                    // Assuming you have an isLoading RxBool in your controller
                    return const Center(child: CircularProgressIndicator());
                  }

                  // If there are no products and loading is complete
                  if (controller.featuredProducts.isEmpty) {
                    return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium));
                  } else {
                    // Else, render the GridView with products
                    return GridView.builder(
                      itemCount: controller.featuredProducts.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 16,
                      ),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        mainAxisExtent: 293,
                      ),
                      itemBuilder: (_, index) => ProductCard(
                        item: controller.featuredProducts[index],
                      ),
                    );
                  }
                }),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
