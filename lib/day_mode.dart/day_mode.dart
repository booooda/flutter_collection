import 'package:flutter/material.dart';
import 'package:flutter_collection/day_mode.dart/widgets/land.dart';
import 'package:flutter_collection/day_mode.dart/widgets/moon.dart';
import 'package:flutter_collection/day_mode.dart/size_config.dart';
import 'package:flutter_collection/day_mode.dart/widgets/sun.dart';
import 'package:flutter_collection/day_mode.dart/widgets/tab.dart';
import 'package:flutter_collection/shared_data.dart';

class DayMode extends StatefulWidget {
  const DayMode({super.key});

  @override
  State<DayMode> createState() => _DayModeState();
}

class _DayModeState extends State<DayMode> {
  bool isFullSun = false;

  final Duration _duration = const Duration(seconds: 1);

  SizeConfig sizeConfig = SizeConfig();
  @override
  void initState() {
    super.initState();

    isFullSun = true;
  }

  void changeMood() {
    setState(() {
      isFullSun = !isFullSun;
    });
  }

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    List<Color> lightBgColors = [
      const Color(0xFF8C2480),
      const Color(0xFFCE587D),
      const Color(0xFFFF9485),
      if (isFullSun) const Color(0xFFFF9D80),
    ];
    var darkBgColors = [
      const Color(0xFF0D1441),
      const Color(0xFF283584),
      const Color(0xFF376AB2),
    ];
    return SafeArea(
      child: Scaffold(
        body: AnimatedContainer(
          duration: _duration,
          curve: Curves.easeInOut,
          width: double.infinity,
          height: SizeConfig.screenHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isFullSun ? lightBgColors : darkBgColors,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              //back button
              Positioned(
                  top: getProportionateScreenHeight(10),
                  left: getProportionateScreenWidth(10),
                  child: backIcon(context)),
              Sun(duration: _duration, isFullSun: isFullSun),
              //moon
              Moon(duration: _duration, isFullSun: isFullSun),
              //land
              const Land(),
              //elements
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isFullSun ? "Good Morning" : "Good Night",
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const VerticalSpacing(of: 10),
                    Tabs(
                      press: (value) {
                        changeMood();
                      },
                    ),
                    const VerticalSpacing(of: 100),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
