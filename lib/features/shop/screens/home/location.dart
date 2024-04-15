import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
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
            padding: const EdgeInsets.all(24),
            children: const [
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
