import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  String hintText;
  TextEditingController controller;
  InputField({super.key, required this.hintText, required this.controller});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.07,
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey, width: 1)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextField(
              controller: widget.controller,
              decoration: InputDecoration.collapsed(
                hintText: widget.hintText,
              ),
            ),
          ),
        ));
  }
}
