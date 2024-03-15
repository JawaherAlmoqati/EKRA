import 'package:ekra/routes/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     
      debugShowCheckedModeBanner: false,
   
      getPages: AppRoutes.pages,

     
    );
  }
}
