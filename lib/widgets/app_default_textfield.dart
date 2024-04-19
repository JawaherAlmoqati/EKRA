import 'package:flutter/material.dart';

class AppDefaultTextfield extends StatefulWidget {
  const AppDefaultTextfield({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.obscureText = false,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
  });

  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final int maxLines;
  final TextInputType keyboardType;

  @override
  State<AppDefaultTextfield> createState() => _AppDefaultTextfieldState();
}

class _AppDefaultTextfieldState extends State<AppDefaultTextfield> {
  bool _obscureText = false;
  @override
  void initState() {
    _obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white, width: 0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black45, width: 1),
        ),
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
      obscureText: _obscureText,
      controller: widget.controller,
      validator: widget.validator,
      style: const TextStyle(color: Colors.black),
    );
  }
}
