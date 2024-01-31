import 'package:flutter/material.dart';

class SizeWidget extends StatelessWidget {
  final String size;
  final bool selected;
  const SizeWidget({super.key, required this.size, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: selected ? Colors.amber : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1)),
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 200),
        style: TextStyle(
          color: Colors.black87,
          fontSize: selected ? 40 : 25,
        ),
        child: Text(size),
      ),
    );
  }
}
