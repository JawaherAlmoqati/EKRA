import 'package:ekra/features/shop/screens/home/widgets/CategoriesList.dart';
import 'package:ekra/features/shop/screens/home/widgets/appbar.dart';
import 'package:ekra/features/shop/screens/home/widgets/hsearchbar.dart';
import 'package:ekra/features/shop/screens/home/widgets/productcard.dart';
import 'package:flutter/material.dart';

class HomeeScreen extends StatefulWidget {
  const HomeeScreen({super.key});

  @override
  State<HomeeScreen> createState() => _HomeeScreenState();
}

class _HomeeScreenState extends State<HomeeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFE7E6E1), Color(0xFFFAFAFA)],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //appbar
              const Happbar(),
              const SizedBox(height: 20),
              const HsearchBar(),
              const SizedBox(height: 25),

              const Padding(
                padding: EdgeInsets.only(left: 30),
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
              GridView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                //scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  mainAxisExtent: 293,
                ),
                itemBuilder: (_, index) => const ProductCard(),
              )

              //const ProductCard(),
            ],
          ),
        ),
      ),
    );
  }
}
