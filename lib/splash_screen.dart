import 'package:ekra/main.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';


class splash_screen extends StatelessWidget {
  const splash_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
            splashIconSize: 540, 
            backgroundColor: Colors.white,
            pageTransitionType: PageTransitionType.leftToRight,
            splash: const CircleAvatar(
              radius: 300, 
                backgroundImage: AssetImage("assets/images/eddalogo.png"),)
            ,nextScreen: const MyApp(title: 'edda',),
        );

    
  }
}