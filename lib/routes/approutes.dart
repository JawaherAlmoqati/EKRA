import 'package:ekra/features/shop/favourite/views/favourite_screen.dart';
import 'package:ekra/features/shop/screens/account/accountsc.dart';
import 'package:ekra/features/shop/screens/addproduct/addproduct.dart';
import 'package:ekra/features/shop/screens/home/homesc.dart';
import 'package:ekra/features/shop/screens/myrental/myrentalsc.dart';
import 'package:ekra/homebar.dart';
import 'package:ekra/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.homebar, page: () => const Homebar()),
    GetPage(name: TRoutes.home, page: () => const HomeeScreen()),
    GetPage(name: TRoutes.favourite, page: () => const FavouriteScreen()),
    GetPage(name: TRoutes.myrental, page: () => const MyRentalSc()),
    GetPage(name: TRoutes.account, page: () => const AccountScreen()),
    GetPage(name: TRoutes.addproduct, page: () => const AddProductScreen()),
  ];
}
