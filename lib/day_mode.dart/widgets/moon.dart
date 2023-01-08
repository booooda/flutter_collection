import 'package:flutter/material.dart';
import 'package:flutter_collection/day_mode.dart/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Moon extends StatelessWidget {
  final Duration duration;
  final bool isFullSun;
  const Moon({super.key, required this.duration, required this.isFullSun});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return AnimatedPositioned(
      duration: duration,
      curve: Curves.easeInOut,
      left: getProportionateScreenWidth(isFullSun ? 0 : 100),
      top: getProportionateScreenHeight(isFullSun ? height : -100),
      child: SvgPicture.asset("assets/img/day_mode/moon.svg"),
    );
  }
}
