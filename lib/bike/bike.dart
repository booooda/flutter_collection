import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_collection/shared_data.dart';

class Bike extends StatefulWidget {
  const Bike({super.key});

  @override
  State<Bike> createState() => _BikeState();
}

class _BikeState extends State<Bike> with TickerProviderStateMixin {
  bool wheel1 = true;
  bool wheel2 = false;
  bool change = false;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: false);

  // Create an animation with value of type "double"
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  void initState() {
    _controller.stop();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: const Color.fromARGB(255, 237, 189, 112),
          width: width(context),
          height: height(context),
          child: Column(
            children: [
              backIcon(context),
              const Text(
                'Bike Wheels',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: height(context) * .6,
                width: width(context),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedPositioned(
                        duration: const Duration(milliseconds: 500),
                        left: change ? -150 : 28,
                        top: 80,
                        child: RotationTransition(
                          turns: _animation,
                          child: Image.asset(
                            wheel1
                                ? 'assets/img/bike/wheel1.png'
                                : 'assets/img/bike/wheel2.png',
                            height: 120,
                          ),
                        )),
                    Positioned(
                      top: 0,
                      child: Image.asset(
                        'assets/img/bike/bike.png',
                        width: 300,
                      ),
                    ),
                    AnimatedPositioned(
                        duration: const Duration(milliseconds: 500),
                        right: change ? -150 : 25,
                        top: 80,
                        child: RotationTransition(
                          turns: _animation,
                          child: Image.asset(
                            wheel1
                                ? 'assets/img/bike/wheel1.png'
                                : 'assets/img/bike/wheel2.png',
                            height: 120,
                          ),
                        )),
                    Positioned(
                      bottom: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (!wheel1) {
                                _controller.repeat();
                                setState(() {
                                  wheel2 = false;
                                });
                                Timer(const Duration(milliseconds: 500), (() {
                                  setState(() {
                                    change = true;
                                  });
                                }));
                                Timer(const Duration(seconds: 1), (() {
                                  setState(() {
                                    wheel1 = true;
                                    change = false;
                                  });
                                }));
                                Timer(const Duration(milliseconds: 1500), (() {
                                  setState(() {
                                    _controller.stop();
                                  });
                                }));
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: wheel2
                                    ? Colors.white
                                    : const Color.fromARGB(255, 237, 189, 112),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 5,
                                      spreadRadius: .5)
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.asset('assets/img/bike/wheel1.png'),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (wheel1) {
                                _controller.repeat();
                                setState(() {
                                  wheel2 = true;
                                });
                                Timer(const Duration(milliseconds: 500), (() {
                                  setState(() {
                                    change = true;
                                  });
                                }));
                                Timer(const Duration(seconds: 1), (() {
                                  setState(() {
                                    wheel1 = false;
                                    change = false;
                                  });
                                }));
                                Timer(const Duration(milliseconds: 1500), (() {
                                  setState(() {
                                    _controller.stop();
                                  });
                                }));
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: wheel2
                                    ? const Color.fromARGB(255, 237, 189, 112)
                                    : Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 5,
                                      spreadRadius: .5)
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.asset('assets/img/bike/wheel2.png'),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
