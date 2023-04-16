import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_collection/shared_data.dart';

class Mario extends StatefulWidget {
  const Mario({super.key});

  @override
  State<Mario> createState() => _MarioState();
}

class _MarioState extends State<Mario> {
  late Timer timer;
  bool isLongPressed = false;
  int i = 0;

  static double mariox = 0;
  static double marioy = 1;
  double time = 0;
  double height = 0;
  String dir = 'right';
  bool run = false;
  bool jumpState = false;

  double initalHeight = marioy;

  void prejump() {
    time = 0;
    initalHeight = marioy;
    marioy = 1;
  }

  void jump() {
    prejump();
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      time += .05;
      height = -4.9 * time * time + 5 * time;
      jumpState = true;
      if (initalHeight - height > 1) {
        setState(() {
          marioy = 1;
          timer.cancel();
          jumpState = false;
        });
      } else {
        setState(() {
          marioy = initalHeight - height;
        });
      }
    });
  }

  right() {
    dir = "right";
    run = true;
    setState(() {
      mariox += 0.05;
    });
  }

  left() {
    dir = "left";
    run = true;
    setState(() {
      mariox -= 0.05;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.blue,
          body: Column(
            children: [
              backIcon(context),
              Expanded(
                flex: 4,
                child: Container(
                  color: Colors.blue,
                  padding: const EdgeInsets.only(top: 20),
                  child: AnimatedContainer(
                    alignment: Alignment(mariox, marioy),
                    duration: const Duration(milliseconds: 0),
                    child: dir == 'right'
                        ? run
                            ? Image.asset(
                                'assets/img/mario/waking.gif',
                                width: 40,
                                fit: BoxFit.cover,
                              )
                            : jumpState
                                ? Image.asset(
                                    'assets/img/mario/jump.png',
                                    width: 40,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    'assets/img/mario/stand.png',
                                    width: 40,
                                    fit: BoxFit.cover,
                                  )
                        : run
                            ? Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(pi),
                                child: Image.asset(
                                  'assets/img/mario/waking.gif',
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : jumpState
                                ? Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationY(pi),
                                    child: Image.asset(
                                      'assets/img/mario/jump.png',
                                      width: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationY(pi),
                                    child: Image.asset(
                                      'assets/img/mario/stand.png',
                                      width: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                  ),
                ),
              ),
              Container(
                color: Colors.green,
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.brown,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.5),
                            borderRadius: BorderRadius.circular(10)),
                        child: GestureDetector(
                            onLongPressStart: (detail) {
                              setState(() {
                                timer = Timer.periodic(
                                    const Duration(milliseconds: 100), (t) {
                                  run = true;
                                  left();
                                });
                              });
                            },
                            onLongPressEnd: (detail) {
                              setState(() {
                                run = false;
                              });
                              timer.cancel();
                            },
                            child: const Icon(Icons.arrow_back)),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.5),
                              borderRadius: BorderRadius.circular(10)),
                          child: IconButton(
                              onPressed: () {
                                jump();
                              },
                              icon: const Icon(Icons.arrow_upward))),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.5),
                            borderRadius: BorderRadius.circular(10)),
                        child: GestureDetector(
                            onLongPressStart: (detail) {
                              setState(() {
                                timer = Timer.periodic(
                                    const Duration(milliseconds: 100), (t) {
                                  run = true;
                                  right();
                                });
                              });
                            },
                            onLongPressEnd: (detail) {
                              setState(() {
                                run = false;
                              });
                              timer.cancel();
                            },
                            child: const Icon(Icons.arrow_forward)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
