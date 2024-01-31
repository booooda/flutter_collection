import 'package:flutter/material.dart';
import 'package:flutter_collection/shared_data.dart';

class IngWidget extends StatelessWidget {
  final bool selected;
  final String size;
  final String image;
  const IngWidget(
      {super.key,
      required this.selected,
      required this.image,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 500),
      scale: selected
          ? size == 'S'
              ? .9
              : size == 'M'
                  ? .95
                  : 1
          : 1.5,
      child: AnimatedOpacity(
          duration: const Duration(milliseconds: 0),
          opacity: selected ? 1 : 0,
          child: Image.asset(
            image,
            width: size == 'S'
                ? width(context) * .35
                : size == 'M'
                    ? width(context) * .4
                    : width(context) * .45,
          )),
    );
  }
}
