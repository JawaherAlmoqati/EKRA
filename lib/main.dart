import 'package:ekra/features/Authentication/bloc/auth_bloc.dart';
import 'package:ekra/features/shop/bloc/product_bloc.dart';
import 'package:ekra/features/shop/favourite/bloc/favourite_bloc.dart';
import 'package:ekra/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:ekra/app.dart';
//import 'package:ekra/features/Authentication/screens/login/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp(
    title: 'edda',
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required String title});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
              create: (context) => AuthBloc(),
            ),
            BlocProvider<ProductBloc>(
              create: (context) => ProductBloc(),
            ),
            BlocProvider<FavouriteBloc>(
              create: (context) => FavouriteBloc(),
            ),
          ],
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Sizer',
            theme: ThemeData.light().copyWith(
              primaryColor: const Color(0xffFFD700),
              primaryColorLight: const Color(0xffFFD700),
              datePickerTheme: const DatePickerThemeData(
                surfaceTintColor: Color(0xffFFD700),
                backgroundColor: Colors.white,
              ),
              progressIndicatorTheme: const ProgressIndicatorThemeData(
                color: Color(0xffFFD700),
              ),
            ),
            home: const SplashScreen(),
          ),
        );
      },
    );
  }
}
