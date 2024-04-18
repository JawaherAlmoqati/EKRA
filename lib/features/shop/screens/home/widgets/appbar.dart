import 'package:ekra/features/shop/screens/home/Notifications.dart';
import 'package:ekra/features/shop/screens/home/location.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Happbar extends StatelessWidget {
  const Happbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => const LocationPage());
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
              Get.to(() => const NotificationPage());
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
