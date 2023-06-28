import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  String hintText;
  double height;
  TextEditingController controller;
  InputField(
      {super.key,
      required this.hintText,
      required this.height,
      required this.controller});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: widget.height,
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey, width: 1)),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 4),
          child: TextField(
            controller: widget.controller,
            maxLines: null, // Set maxLines to null to enable multiple lines
            keyboardType:
                TextInputType.multiline, // Set the keyboard type to multiline
            textInputAction: TextInputAction.newline,
            decoration: InputDecoration.collapsed(
              hintText: widget.hintText,
            ),
          ),
        ));
  }
}
