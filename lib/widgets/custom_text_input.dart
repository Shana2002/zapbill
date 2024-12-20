import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final Function(String) onSaved;
  final bool obscureText;
  final String hintText;
  final String regEx;
  const CustomTextInput(
      {super.key,
      required this.hintText,
      required this.regEx,
      required this.obscureText,
      required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (_value) => onSaved(_value!),
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.black),
      obscureText: obscureText,
      validator: (_value) {
        return RegExp(regEx).hasMatch(_value!) ? null : "Enter a valid value";
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black54),
      ),
    );
  }
}

class CustomeSizedTextInput extends CustomTextInput {
  final double width;
  final double height;
  CustomeSizedTextInput({
    required Function(String) onSaved,
    required bool obscureText,
    required String hintText,
    required String regEx,
    required this.height,
    required this.width,
  }) : super(
            hintText: hintText,
            regEx: regEx,
            obscureText: obscureText,
            onSaved: onSaved);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Center(child: super.build(context)),
    );
  }
}
