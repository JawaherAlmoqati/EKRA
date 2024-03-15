import 'package:flutter/material.dart';

class HomeeScreen extends StatelessWidget {
 const HomeeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: const Center(
        child: Text('This is the 1 screen'),
      ),
    );
  }
}