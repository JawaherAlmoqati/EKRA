import 'package:ekra/features/shop/screens/Favourite/favouritesc.dart';
import 'package:ekra/features/shop/screens/account/accountsc.dart';
import 'package:ekra/features/shop/screens/addproduct/addproduct.dart';
import 'package:ekra/features/shop/screens/home/homesc.dart';
import 'package:ekra/features/shop/screens/myrental/myrentalsc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class Homebar extends StatelessWidget {
  const Homebar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppScreenController());
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Obx(
        () => NavigationBar(
          indicatorColor: const Color.fromARGB(255, 220, 218, 230),
          shadowColor: Colors.white,
          height: 80,
          animationDuration: const Duration(seconds: 3),
          selectedIndex: controller.selectedMenu.value,
          backgroundColor: Colors.white,
          elevation: 0,
          onDestinationSelected: (index) =>
              controller.selectedMenu.value = index,
          destinations: const [
            NavigationDestination(
                icon: Icon(
                  Icons.home,
                  color: Color(0xFF2C3B58),
                ),
                label: 'Home'),
            NavigationDestination(
                icon: Icon(Ionicons.heart, color: Color(0xFF2C3B58)),
                label: 'Favourite'),
            NavigationDestination(
                icon: Icon(
                  Ionicons.add,
                  color: Color(0xFF2C3B58),
                  size: 48,
                ),
                label: ''),
            NavigationDestination(
                icon: Icon(Ionicons.briefcase, color: Color(0xFF2C3B58)),
                label: 'Myrental'),
            NavigationDestination(
                icon: Icon(Ionicons.person, color: Color(0xFF2C3B58)),
                label: 'Account'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedMenu.value]),
    );
  }
}

class AppScreenController extends GetxController {
  static AppScreenController get instance => Get.find();

  final Rx<int> selectedMenu = 0.obs;

  final screens = [
    const HomeeScreen(),
    const FavouriteScreen(),
    const addproductScreen(),
    const MyrentalScreen(),
    const AccountScreen()
  ];
}
