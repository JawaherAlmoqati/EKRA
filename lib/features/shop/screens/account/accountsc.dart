import 'package:ekra/features/Authentication/bloc/auth_bloc.dart';
import 'package:ekra/features/Authentication/screens/login/signin.dart';
import 'package:ekra/features/shop/bloc/product_bloc.dart';
import 'package:ekra/features/shop/controllers/product_controller.dart';
import 'package:ekra/features/shop/screens/account/settings.dart';
import 'package:ekra/features/shop/screens/home/notifications.dart';
import 'package:ekra/widgets/user_products_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final controller = Get.find<ProductController>();
  // final ProductModel item;

  late final ProductBloc productBloc;
  @override
  void initState() {
    productBloc = context.read<ProductBloc>();
    if (FirebaseAuth.instance.currentUser != null) {
      productBloc.add(GetProductOfSpecificUser(userId: FirebaseAuth.instance.currentUser!.uid));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = context.watch<AuthBloc>();
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 20.w,
            child: Image.asset(
              "assets/images/blue.png",
              fit: BoxFit.cover,
              height: 40.h,
              // width: 100.w,
            ),
          ),
          Positioned(
            top: -22.w,
            left: -10.w,
            // width: 40.w,
            height: 80.h,
            child: Image.asset(
              "assets/images/yellow.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 5.w,
            top: 9.h,
            child: GestureDetector(
              onTap: () {
                Get.to(() => const NotificationPage());
              },
              child: const Icon(
                Icons.notifications,
                size: 32,
                color:  Color(0xFF2C3B58),
              ),
            ),
          ),
          Positioned(
            right: 5.w,
            top: 9.h,
            child: GestureDetector(
              onTap: () {
                Get.to(() => const settingsscreen());
              },
              child: const Icon(
                Icons.settings,
                size: 32,
                color:  Color(0xFF2C3B58),
              ),
            ),
          ),
          Positioned(
            top: 14.h,
            left: 5.w,
            right: 5.w,
            child: Column(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60,
                  child: CircleAvatar(
                    backgroundColor: Colors.black54,
                    radius: 60,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Color(0xffCCCCCC),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  authBloc.user?.fullName ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 12.w,
            top: 33.h,
            child: const Row(
              children: [
                Icon(
                  Icons.star,
                  color:Color(0xffFEBD59),
                  size: 32,
                ),
                SizedBox(width: 4),
                Text(
                  "0.0",
                  style: TextStyle(
                    color: Color(0xff5A5A5A),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 11.w,
            top: 36.5.h,
            child: const Text(
              "Review",
              style: TextStyle(
                color: Color(0xff5A5A5A),
                fontSize: 14,
              ),
            ),
          ),
          Positioned(
              left: 12.w,
              top: 33.h,
              child: const Column(
                children: [
                  Icon(
                    Icons.message,
                    color:  Color(0xFF2C3B58),
                    size: 32,
                  ),
                  SizedBox(width: 4),
                  Text(
                    "Message",
                    style: TextStyle(
                      color: Color(0xff5A5A5A),
                      fontSize: 14,
                    ),
                  ),
                ],
              )),
          Positioned(
              top: 40.h,
              left: 5.w,
              right: 5.w,
              child: const Column(
                children: [
                  Center(
                    child: Text(
                      "Experienced construction equipment rental specialist",
                      style: TextStyle(
                        color: Color(0xff5A5A5A),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    "Saudi Arabia, Qassim , Buraydah",
                    style: TextStyle(
                      color: Color(0xff5A5A5A),
                      fontSize: 14,
                    ),
                  ),
                     Divider(
              color: Color(0xffE5E5E5),
            ),
                ],
              )),
              
              
          if (FirebaseAuth.instance.currentUser != null)
            Positioned(
              top: 48.h,
              left: 5.w,
              right: 5.w,
              bottom: 8,
              child: const UserProductsList(),
              // child: SingleChildScrollView(
              //   child: ListView.builder(
              //     itemCount: controller.featuredProducts.length,
              //     shrinkWrap: true,
              //     itemBuilder: (BuildContext context, int index) {
              //       return Padding(
              //         padding: const EdgeInsets.all(15),
              //         child: InkWell(
              //           onTap: () {},
              //           child: Container(
              //             height: 200,
              //             decoration: BoxDecoration(
              //               color: Colors.black54,
              //               borderRadius: BorderRadius.circular(15),
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
            )
          else ...[
            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const SignIn());
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
