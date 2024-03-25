import 'package:ekra/features/Authentication/screens/signup/signup.dart';
import 'package:ekra/homebar.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'package:sizer/sizer.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isSignInActive = true;
  bool _isObscure = true;
  bool _remeberMe = false;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _errorMessage = '';

  Future<void> _signInWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
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
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const Homebar());
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
                left: 10.w,
                top: 15.h,
                child: Text(
                  "Welcome\nBack",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
            Positioned(
              top: 30.h,
              left: 10.w,
              child: Container(
                height: 6.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color(0xffE2E2E0),
                    borderRadius: BorderRadius.circular(10)),
                width: 80.w,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignInActive = true;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 2.w),
                          height: 5.h,
                          decoration: BoxDecoration(
                              color: isSignInActive
                                  ? Colors.white
                                  : const Color(0xffE2E2E0),
                              borderRadius: BorderRadius.circular(10)),
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
                        onTap: () {
                          setState(() {
                            isSignInActive = false;
                            Get.to(() => const SignUp());
                          });
                        },
                        child: Container(
                          height: 5.h,
                          margin: EdgeInsets.only(right: 2.w),
                          decoration: BoxDecoration(
                              color: !isSignInActive
                                  ? Colors.white
                                  : const Color(0xffE2E2E0),
                              borderRadius: BorderRadius.circular(10)),
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
              top: 47.h,
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
                top: 54.h,
                left: 10.w,
                right: 10.w,
                child: Row(
                  children: [
                    Checkbox(
                        value: _remeberMe,
                        onChanged: (value) {
                          setState(() {
                            _remeberMe = value!;
                          });
                        }),
                    const Text(
                      'Remember Me',
                      style: TextStyle(color: Colors.black12),
                    ),
                    const Spacer(),
                    const Text(
                      "Forget Password?",
                      style: TextStyle(color: Colors.black26),
                    )
                  ],
                )),
            Positioned(
              top: 64.h,
              left: 10.w,
              right: 10.w,
              child: GestureDetector(
                onTap: () {
                  _signInWithEmailAndPassword();
                },
                child: Container(
                  height: 8.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color(0xffFDBF61),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 74.h,
                left: 10.w,
                right: 10.w,
                child: const Row(
                  children: [
                    Expanded(
                        child: Divider(
                      color: Colors.black,
                      thickness: 1,
                    )),
                    Text(
                      "  Or Sign In with  ",
                      style: TextStyle(color: Colors.black26),
                    ),
                    Expanded(
                        child: Divider(
                      color: Colors.black,
                      thickness: 1,
                    )),
                  ],
                )),
            Positioned(
                top: 77.h,
                left: 10.w,
                right: 10.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final FirebaseAuth _auth = FirebaseAuth.instance;
                        final GoogleSignIn _googleSignIn = GoogleSignIn();
                        // Trigger the authentication flow
                        final GoogleSignInAccount? googleUser =
                            await _googleSignIn.signIn();

                        // Obtain the auth details from the request
                        final GoogleSignInAuthentication googleAuth =
                            await googleUser!.authentication;

                        // Create a new credential
                        final OAuthCredential credential =
                            GoogleAuthProvider.credential(
                          accessToken: googleAuth.accessToken,
                          idToken: googleAuth.idToken,
                        );

                        // Sign in to Firebase with the credential
                        final UserCredential userCredential =
                            await _auth.signInWithCredential(credential);
                        print(userCredential);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 8.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset("assets/images/google.png"),
                            Text(
                              "Google",
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.black26),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final FirebaseAuth _auth = FirebaseAuth.instance;
                        // Create an `AuthorizationCredentialAppleID` instance
                        final AuthorizationCredentialAppleID appleCredential =
                            await SignInWithApple.getAppleIDCredential(
                          scopes: [
                            AppleIDAuthorizationScopes.email,
                            AppleIDAuthorizationScopes.fullName,
                          ],
                          webAuthenticationOptions: WebAuthenticationOptions(
                            clientId: 'your_client_id',
                            redirectUri:
                                Uri.parse('https://your-redirect-uri.com'),
                          ),
                        );

                        // Create a new `OAuthProvider` credential
                        final OAuthProvider oAuthProvider =
                            OAuthProvider('apple.com');

                        // Create `AuthCredential` using the `AuthorizationCredentialAppleID`
                        final AuthCredential credential =
                            oAuthProvider.credential(
                          idToken: appleCredential.identityToken,
                          accessToken: appleCredential.authorizationCode,
                        );

                        // Sign in to Firebase with the credential
                        final UserCredential userCredential =
                            await _auth.signInWithCredential(credential);
                        print(userCredential);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 8.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset("assets/images/apple.png"),
                            Text(
                              "Apple",
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.black26),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
