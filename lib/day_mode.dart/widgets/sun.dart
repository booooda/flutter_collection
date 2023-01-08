import 'package:flutter/material.dart';
import 'package:flutter_collection/day_mode.dart/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Sun extends StatelessWidget {
  final Duration duration;
  final bool isFullSun;
  const Sun({super.key, required this.duration, required this.isFullSun});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return AnimatedPositioned(
      duration: duration,
      curve: Curves.easeInOut,
      left: getProportionateScreenWidth(isFullSun ? 100 : 0),
      top: getProportionateScreenHeight(isFullSun ? -100 : height),
      child: SvgPicture.asset("assets/img/day_mode/Sun.svg"),
    );
  }
}
