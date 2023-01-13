import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final double offset;
  final IconData iconData;
  const CustomIcon({super.key, required this.offset, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            offset > 30 ? const EdgeInsets.all(0) : const EdgeInsets.all(10),
        decoration: offset > 30
            ? const BoxDecoration()
            : BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Icon(
          iconData,
          color: offset > 30 ? Colors.white : Colors.red,
        ));
  }
}
