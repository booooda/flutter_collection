import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_collection/shared_data.dart';

class Burger extends StatefulWidget {
  const Burger({super.key});

  @override
  State<Burger> createState() => _BurgerState();
}

class _BurgerState extends State<Burger> with TickerProviderStateMixin {
  bool show = false;
  bool showText = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Color.fromARGB(255, 126, 69, 0),
          width: width(context),
          height: height(context),
          child: Column(
            children: [
              backIcon(context),
              const Text(
                'Burger Menu',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: height(context) * .6,
                width: width(context),
                child: GestureDetector(
                  onTap: (() {
                    if (showText) {
                      setState(() {
                        showText = false;
                      });
                      Timer(Duration(milliseconds: 100), () {
                        setState(() {
                          show = !show;
                        });
                      });
                    } else {
                      setState(() {
                        show = !show;
                      });
                      Timer(Duration(milliseconds: 500), () {
                        setState(() {
                          showText = true;
                        });
                      });
                    }
                  }),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedPositioned(
                          duration: const Duration(milliseconds: 500),
                          top: show ? -90 : 10,
                          child: Image.asset(
                            'assets/img/burger/up.png',
                            fit: BoxFit.cover,
                            width: 300,
                          )),
                      showText
                          ? AnimatedPositioned(
                              duration: const Duration(milliseconds: 500),
                              top: 25,
                              left: 50,
                              child: Text(
                                'Bun',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ))
                          : Container(),
                      AnimatedPositioned(
                          duration: const Duration(milliseconds: 500),
                          top: show ? 200 : 105,
                          child: Image.asset(
                            'assets/img/burger/down.png',
                            fit: BoxFit.cover,
                            width: 300,
                          )),
                      showText
                          ? AnimatedPositioned(
                              duration: const Duration(milliseconds: 500),
                              top: 290,
                              left: 40,
                              child: Text(
                                'Becon',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ))
                          : Container(),
                      AnimatedPositioned(
                          duration: const Duration(milliseconds: 500),
                          top: show ? 160 : 90,
                          left: 25,
                          child: Image.asset(
                            'assets/img/burger/greenDown.png',
                            fit: BoxFit.cover,
                            width: 300,
                          )),
                      showText
                          ? AnimatedPositioned(
                              duration: const Duration(milliseconds: 500),
                              top: 100,
                              left: 30,
                              child: Text(
                                'Cabbage',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ))
                          : Container(),
                      AnimatedPositioned(
                          duration: const Duration(milliseconds: 500),
                          top: show ? 145 : 105,
                          left: 40,
                          child: Image.asset(
                            'assets/img/burger/onion.png',
                            fit: BoxFit.cover,
                            width: 270,
                          )),
                      showText
                          ? AnimatedPositioned(
                              duration: const Duration(milliseconds: 500),
                              top: 225,
                              left: 41,
                              child: Text(
                                'Onions',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ))
                          : Container(),
                      AnimatedPositioned(
                          duration: const Duration(milliseconds: 500),
                          top: show ? 65 : 45,
                          left: 15,
                          child: Image.asset(
                            'assets/img/burger/5yar.png',
                            fit: BoxFit.cover,
                            width: 300,
                          )),
                      showText
                          ? AnimatedPositioned(
                              duration: const Duration(milliseconds: 500),
                              top: 200,
                              right: 30,
                              child: Text(
                                'Cucumbers',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ))
                          : Container(),
                      AnimatedPositioned(
                          duration: const Duration(milliseconds: 500),
                          top: 90,
                          left: 40,
                          child: Image.asset(
                            'assets/img/burger/burger.png',
                            fit: BoxFit.cover,
                            width: 300,
                          )),
                      showText
                          ? AnimatedPositioned(
                              duration: const Duration(milliseconds: 500),
                              top: 170,
                              left: 41,
                              child: Text(
                                'Burger',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ))
                          : Container(),
                      AnimatedPositioned(
                          duration: const Duration(milliseconds: 500),
                          top: show ? 45 : 70,
                          left: 20,
                          child: Image.asset(
                            'assets/img/burger/tom.png',
                            fit: BoxFit.cover,
                            width: 300,
                          )),
                      showText
                          ? AnimatedPositioned(
                              duration: const Duration(milliseconds: 500),
                              top: 135,
                              right: 41,
                              child: Text(
                                'Tomatoes',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ))
                          : Container(),
                      AnimatedPositioned(
                          duration: const Duration(milliseconds: 500),
                          top: show ? 30 : 80,
                          left: 20,
                          child: Image.asset(
                            'assets/img/burger/greenUp.png',
                            fit: BoxFit.cover,
                            width: 300,
                          )),
                      showText
                          ? AnimatedPositioned(
                              duration: const Duration(milliseconds: 500),
                              top: 260,
                              right: 41,
                              child: Text(
                                'Cabbage',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ))
                          : Container(),
                      AnimatedPositioned(
                          duration: const Duration(milliseconds: 500),
                          top: show ? -10 : 70,
                          left: 20,
                          child: Image.asset(
                            'assets/img/burger/beef.png',
                            fit: BoxFit.cover,
                            width: 300,
                          )),
                      showText
                          ? AnimatedPositioned(
                              duration: const Duration(milliseconds: 500),
                              top: 65,
                              right: 70,
                              child: Text(
                                'Becon',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ))
                          : Container(),
                    ],
                  ),
                ),
              ),
              Text(
                'Click on burger to show ingredients',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
