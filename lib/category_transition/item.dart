import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final IconData iconData;
  const Item({super.key, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(5),
        child: Icon(
          iconData,
          color: Color.fromARGB(255, 45, 137, 123),
          size: 50,
        ));
  }
}
