import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final double size;
  final String imagePath;
  const RoundedImage({super.key, required this.imagePath, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        image:
            DecorationImage(image: AssetImage(imagePath), fit: BoxFit.contain),
        borderRadius: BorderRadius.circular(size),
      ),
    );
  }
}
