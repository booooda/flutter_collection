import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  final String img;
  final double height;
  const CardImage({super.key, required this.img, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Colors.black,
                blurRadius: 10,
                blurStyle: BlurStyle.solid,
                spreadRadius: 3)
          ]),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(img, height: height)),
    );
  }
}
