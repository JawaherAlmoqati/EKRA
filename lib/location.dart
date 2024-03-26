import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyLoca());
}

class MyLoca extends StatelessWidget {
  const MyLoca({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: LocationPage(),
    );
  }
}

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(32),
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/notifi.png"),
            fit: BoxFit.cover,
          )),
          child: ListView(
            padding: EdgeInsets.all(24),
            children: [
              Text(
                "City",
                style: TextStyle(fontSize: 29),
              ),
              Text(
                "Please select your city.",
                style: TextStyle(fontSize: 20),
              ),
            ],
          )),
    );
  }
}
