import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;

  final String hintText;
  final bool obscuretxt;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscuretxt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        controller: controller,
        obscureText: obscuretxt,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade600)
          ),
          hintText: hintText,

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),

          ),
          hintStyle: TextStyle(color: Colors.grey.shade600)


        ),
      ),
    );
  }
}
