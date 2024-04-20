import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            Positioned(
              top:1500.w,
              left: -10.w,
              width: 20.w,
              height: 10.h,
              child: Image.asset("assets/images/yellow.png", fit: BoxFit.cover),
            ),
     ),
    );
  }
}
