import 'package:ekra/features/Authentication/bloc/auth_bloc.dart';
import 'package:ekra/features/Authentication/screens/signup/signup.dart';
import 'package:ekra/homebar.dart';
import 'package:ekra/utils/validators/validation.dart';
import 'package:ekra/widgets/app_default_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isSignInActive = true;
  bool _remeberMe = false;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      backgroundColor: const Color(0xffEDEDE9),
      body: SafeArea(
        child: Form(
          key: formKey,
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
                child:
                    Image.asset("assets/images/yellow.png", fit: BoxFit.cover),
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
                top: 37.h,
                left: 10.w,
                right: 10.w,
                child: AppDefaultTextfield(
                  controller: email,
                  validator: KValidator.validateEmail,
                  hintText: 'Email',
                ),
              ),
              Positioned(
                top: 48.h,
                left: 10.w,
                right: 10.w,
                child: AppDefaultTextfield(
                  controller: pass,
                  hintText: 'Password',
                  obscureText: true,
                  validator: KValidator.validatePassword,
                ),
              ),
              Positioned(
                top: 57.h,
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
                ),
              ),
              Positioned(
                top: 65.h,
                left: 10.w,
                right: 10.w,
                child: BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      Get.to(() => const Homebar());
                    } else if (state is LoginFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            state.errorMessage,
                          ),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          authBloc.add(
                            LoginEvent(
                              email: email.text,
                              password: pass.text,
                            ),
                          );
                        }
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
                              color: const Color(0xFF333333),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                  top: 77.h,
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
                  top: 81.h,
                  left: 10.w,
                  right: 10.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final FirebaseAuth auth = FirebaseAuth.instance;
                          final GoogleSignIn googleSignIn = GoogleSignIn();
                          // Trigger the authentication flow
                          final GoogleSignInAccount? googleUser =
                              await googleSignIn.signIn();

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
                              await auth.signInWithCredential(credential);
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
                          final FirebaseAuth auth = FirebaseAuth.instance;
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
                              await auth.signInWithCredential(credential);
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
      ),
    );
  }
}
