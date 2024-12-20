import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String name;
  final double height;
  final double width;
  final Function onPressed;
  const RoundedButton(
      {super.key,
      required this.height,
      required this.width,
      required this.name,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Color.fromRGBO(192, 232, 99, 1.0),
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextButton(
          onPressed: () => onPressed(),
          child: Text(
            name,
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.w800),
          )),
    );
  }
}
