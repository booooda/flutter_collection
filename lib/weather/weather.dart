import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_collection/shared_data.dart';
import 'package:weather_animation/weather_animation.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  Duration duration = const Duration(milliseconds: 500);
  double deltaX = 20;
  Curve curve = Curves.bounceOut;
  double cloudOffset = -80;
  @override
  void initState() {
    super.initState();
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      trans();
    });
  }

  void trans() {
    if (cloudOffset > 50) {
      setState(() {
        cloudOffset = -100;
      });
    } else {
      setState(() {
        cloudOffset = cloudOffset + 50.0;
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String state = 'sunny';

  List<Color> colors() {
    if (state == 'sun') {
      return [
        const Color(0xff283593),
        const Color(0xffff8a65),
      ];
    } else if (state == 'rain') {
      return [
        const Color(0xff283593),
        const Color.fromARGB(255, 101, 114, 255),
      ];
    } else if (state == 'snow') {
      return [
        const Color(0xff283593),
        const Color.fromARGB(255, 157, 101, 255),
      ];
    } else {
      return [
        const Color(0xff283593),
        const Color.fromARGB(255, 60, 0, 171),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        height: height(context),
        width: width(context),
        decoration: BoxDecoration(gradient: LinearGradient(colors: colors())),
        child: Stack(
          children: [
            AnimatedPositioned(
                duration: const Duration(seconds: 1),
                top: 1,
                left: cloudOffset,
                child: const SizedBox(
                    width: 100, height: 30, child: CloudWidget())),
            Positioned(
              top: height(context) * .7,
              left: 10,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        state = 'sun';
                      });
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text('Sunny')),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        state = 'rain';
                      });
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text('Rainy')),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        state = 'snow';
                      });
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text('Snow')),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        state = 'cloud';
                      });
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text('Cloudy')),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
