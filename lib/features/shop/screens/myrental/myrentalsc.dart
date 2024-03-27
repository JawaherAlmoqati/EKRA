import 'package:flutter/material.dart';

class MyrentalScreen extends StatelessWidget {
  const MyrentalScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFE7E6E1), Color(0xFFFAFAFA)],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('3 Screen'),
        ),
        body: const Center(
          child: Text('This is the 3 screen'),
        ),
      ),
    );
  }
}
