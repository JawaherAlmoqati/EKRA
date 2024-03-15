import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
 const FavouriteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: const Center(
        child: Text('This is the 2 screen'),
      ),
    );
  }
}