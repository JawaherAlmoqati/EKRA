import 'package:flutter/material.dart';

class Happbar extends StatelessWidget {
  const Happbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 55, left: 40),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              // Handle tap event
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
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              // Handle icon button tap event here
            },
            icon: const Icon(
              Icons.notifications_none,
              size: 24,
              color: Color(0xFF2C3B58),
            ),
          ),
        ],
      ),
    );
  }
}
