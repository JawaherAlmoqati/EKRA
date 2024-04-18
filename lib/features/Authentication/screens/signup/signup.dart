import 'package:ekra/features/Authentication/bloc/auth_bloc.dart';
import 'package:ekra/homebar.dart';
import 'package:ekra/utils/validators/validation.dart';
import 'package:ekra/widgets/app_default_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../login/signin.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _RegisterState();
}

class _RegisterState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isSignInActive = false;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      backgroundColor: const Color(0xffEDEDE9),
      body: SafeArea(
        child: Form(
          key: _formKey,
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
                child: AppDefaultTextfield(
                  hintText: 'Full Name',
                  controller: fullName,
                  validator: (value) {
                    KValidator.validateEmptyText('Full Name', value);
                    return null;
                  },
                ),
              ),
              Positioned(
                top: 47.h,
                left: 10.w,
                right: 10.w,
                child: AppDefaultTextfield(
                  hintText: 'Email',
                  controller: email,
                  validator: KValidator.validateEmail,
                ),
              ),
              Positioned(
                top: 56.h,
                left: 10.w,
                right: 10.w,
                child: AppDefaultTextfield(
                  hintText: 'Phone Number',
                  controller: phoneNumber,
                  validator: KValidator.validatePhoneNumber,
                ),
              ),
              Positioned(
                top: 65.h,
                left: 10.w,
                right: 10.w,
                child: AppDefaultTextfield(
                  hintText: 'Password',
                  controller: pass,
                  obscureText: true,
                  validator: KValidator.validatePassword,
                ),
              ),
              Positioned(
                top: 75.h,
                left: 10.w,
                right: 10.w,
                child: BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is SignUpSuccess) {
                      Get.offAll(() => const Homebar());
                    } else if (state is SignUpFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.errorMessage),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is SignUpInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          authBloc.add(SignUpEvent(
                            email: email.text,
                            password: pass.text,
                            fullName: fullName.text,
                            phoneNumber: phoneNumber.text,
                          ));
                        }
                      },
                      child: Container(
                        height: 8.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xffFDBF61),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
