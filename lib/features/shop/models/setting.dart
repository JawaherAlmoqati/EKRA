import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting {

  final String title;
  final String route;
  final IconData icon;
  final String detail;

  Setting({
    required this.title,
    required this.route,
    required this.icon,
    required this.detail
    });
}
final List<Setting> settings = [
  Setting(
    title: "Edit Account",
    route: "/",
    icon: CupertinoIcons.person_fill,
    detail: "",
  ),
  Setting(
    title: "Edit Profile",
    route: "/",
    icon: Icons.edit, detail: " ",
  ),
];

final List<Setting> settings2 = [
  Setting(
    title: "Language ",
    route: "/",
    icon: Icons.language, detail: "English",
  ),
];


final List<Setting> settings3 = [
  Setting(
    title: "Privacy Policy",
    route: "/",
    icon: CupertinoIcons.lock_fill, detail: " ",
  ),
  Setting(
    title: "Terms and Conditions",
    route: "/",
    icon: CupertinoIcons.doc_fill, detail: " ",
  ),
  Setting(
    title: "Cookies Policy",
    route: "/",
    icon: Icons.cookie, detail: " ",
  ),
  Setting(
    title: "Contact",
    route: "",
    icon: CupertinoIcons.envelope_fill, detail: " ",
  ),
];
