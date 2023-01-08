import 'package:flutter/material.dart';
import 'package:flutter_collection/day_mode.dart/size_config.dart';

class Land extends StatelessWidget {
  const Land({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: getProportionateScreenWidth(-65),
      left: 0,
      right: 0,
      child: Image.asset(
        "assets/img/day_mode/land_tree_light.png",
        height: getProportionateScreenWidth(430),
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
