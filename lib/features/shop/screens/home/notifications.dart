import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

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
              Center(
                child: Text(
                  "My Notifications",
                  style: TextStyle(fontSize: 29),
                ),
              ),
            ],
          )),
    );
  }
}
