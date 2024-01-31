import 'package:flutter/material.dart';
import 'package:flutter_collection/shared_data.dart';

class IngButton extends StatelessWidget {
  final bool selected;
  final Color color;
  final String text;
  const IngButton(
      {super.key,
      required this.selected,
      required this.color,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        width: width(context) * .3,
        decoration: BoxDecoration(
            color: selected ? color : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: color)),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
