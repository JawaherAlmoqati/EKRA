import 'package:flutter/material.dart';

class HomeeScreen extends StatelessWidget {
  const HomeeScreen({super.key});

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 55, left: 40),
                child: GestureDetector(
                  onTap: () {
                    // Handle tap event here
                    // Navigate to another place or perform any action
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Color(0xFFE74C3C),
                        size: 24,
                      ),
                      SizedBox(width: 3), // Adding some space
                      Text(
                        "Buraydah",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF333333),
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
