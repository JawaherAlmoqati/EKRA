import 'package:flutter/material.dart';

class MyrentalScreen extends StatelessWidget {
 const MyrentalScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: const Center(
        child: Text('This is the 3 screen'),
      ),
    );
  }
}