import 'package:ekra/features/Authentication/screens/login/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});
  @override
  Widget build(BuildContext context) {
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
          if (FirebaseAuth.instance.currentUser != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Get.offAll(() => const SignIn());
                  },
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
