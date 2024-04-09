import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../login/signin.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _RegisterState();
}

class _RegisterState extends State<SignUp> {
  bool isSignInActive = false;
  bool _isObscure = true;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _errorMessage = '';

  Future<void> _signUpWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.text,
        password: pass.text,
      );
      // Navigate to your home screen or next screen
      print('User: ${userCredential.user}');
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
      print('Error: $_errorMessage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDEDE9),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: -10.w,
              width: 80.w,
              height: 20.h,
              child: Image.asset(
                "assets/images/blue.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: -2.h,
              left: -10.w,
              width: 70.w,
              height: 30.h,
              child: Image.asset("assets/images/yellow.png", fit: BoxFit.cover),
            ),
            Positioned(
                right: 5.w,
                top: 6.h,
                child: Text(
                  "Skip",
                  style: TextStyle(fontSize: 12.sp, color: Colors.black, fontWeight: FontWeight.w400),
                )),
            Positioned(
                left: 10.w,
                top: 15.h,
                child: Text(
                  "Welcome",
                  style: TextStyle(fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.bold),
                )),
            Positioned(
              top: 30.h,
              left: 10.w,
              child: Container(
                height: 6.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: const Color(0xffE2E2E0), borderRadius: BorderRadius.circular(10)),
                width: 80.w,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            Get.offAll(() => const SignIn());
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 2.w),
                          height: 5.h,
                          decoration: BoxDecoration(color: isSignInActive ? Colors.white : const Color(0xffE2E2E0), borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 5.h,
                          margin: EdgeInsets.only(right: 2.w),
                          decoration: BoxDecoration(color: !isSignInActive ? Colors.white : const Color(0xffE2E2E0), borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 38.h,
              left: 10.w,
              right: 10.w,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  hintStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white, width: 0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white, width: 0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white, width: 0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            Positioned(
              top: 47.h,
              left: 10.w,
              right: 10.w,
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white, width: 0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white, width: 0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white, width: 0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            Positioned(
              top: 56.h,
              left: 10.w,
              right: 10.w,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  hintStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white, width: 0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white, width: 0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white, width: 0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            Positioned(
              top: 65.h,
              left: 10.w,
              right: 10.w,
              child: TextField(
                controller: pass,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white, width: 0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white, width: 0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white, width: 0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    child: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  ),
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            Positioned(
              top: 75.h,
              left: 10.w,
              right: 10.w,
              child: GestureDetector(
                onTap: _signUpWithEmailAndPassword,
                child: Container(
                  height: 8.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: const Color(0xffFDBF61), borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Continue",
                    style: TextStyle(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
