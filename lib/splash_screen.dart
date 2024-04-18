import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ekra/features/Authentication/bloc/auth_bloc.dart';
import 'package:ekra/features/Authentication/screens/login/signin.dart';
import 'package:ekra/homebar.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:ekra/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final AuthBloc authBloc;
  @override
  void initState() {
    authBloc = context.read<AuthBloc>();
    if (FirebaseAuth.instance.currentUser != null) {
      authBloc.add(const GetCurrentUserEvent());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 540,
      backgroundColor: Colors.white,
      pageTransitionType: PageTransitionType.leftToRight,
      splash: const CircleAvatar(
        radius: 300,
        backgroundImage: AssetImage("assets/images/eddalogo.png"),
      ),
      nextScreen: FirebaseAuth.instance.currentUser == null ? const SignIn() : const Homebar(),
    );
  }
}
