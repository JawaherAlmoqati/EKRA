import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingSwitch extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool value;
  final Function(bool value) onTap;
  const SettingSwitch({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 50,
         width: 50,
         margin: const EdgeInsets.only(bottom:10 ),
         decoration: BoxDecoration(
           color: Color(0xffF1F2F7),
           borderRadius: BorderRadius.circular(15),
         ),
            child: Icon(
              icon,
              color: Color.fromARGB(255, 47, 46, 46),
            ),
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            value ? "On" : "Off",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 20),
          CupertinoSwitch(value: value, onChanged: onTap),
        ],
      ),
    );
  }
}