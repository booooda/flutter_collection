import 'package:flutter/material.dart';
import 'package:flutter_collection/shared_data.dart';

class WheelScreen extends StatefulWidget {
  const WheelScreen({super.key});

  @override
  State<WheelScreen> createState() => _WheelScreenState();
}

class _WheelScreenState extends State<WheelScreen> {
  int _selectedIndex = 0;
  int oldindex = 0;
  double rota = 15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffcd9f),
      body: SafeArea(
        child: Container(
            height: height(context),
            width: width(context),
            child: Column(children: [
              backIcon(context),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Check  our Drinks',
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                width: width(context),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Positioned(
                      right: 60,
                      child: AnimatedRotation(
                        duration: const Duration(milliseconds: 500),
                        turns: rota / 360,
                        child: Container(
                          width: 600,
                          height: 300,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 10,
                                spreadRadius: 2,
                              )
                            ],
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 80, 30, 3),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 5,
                                right: 200,
                                child: Image.asset(
                                  'assets/img/wheel/cup.png',
                                  width: 90,
                                  height: 90,
                                ),
                              ),
                              Positioned(
                                top: 5,
                                right: 280,
                                child: Image.asset(
                                  'assets/img/wheel/cap.png',
                                  width: 110,
                                  height: 90,
                                ),
                              ),
                              Positioned(
                                top: 65,
                                right: 150,
                                child: Image.asset(
                                  'assets/img/wheel/tea.png',
                                  width: 70,
                                  height: 90,
                                ),
                              ),
                              Positioned(
                                top: 55,
                                left: 160,
                                child: Image.asset(
                                  'assets/img/wheel/cup.png',
                                  width: 90,
                                  height: 90,
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 200,
                                child: Image.asset(
                                  'assets/img/wheel/cap.png',
                                  width: 110,
                                  height: 90,
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 290,
                                child: Image.asset(
                                  'assets/img/wheel/cup.png',
                                  width: 90,
                                  height: 90,
                                ),
                              ),
                              Positioned(
                                bottom: 60,
                                right: 170,
                                child: Image.asset(
                                  'assets/img/wheel/nescafe.png',
                                  width: 80,
                                  height: 90,
                                ),
                              ),
                              Positioned(
                                bottom: 60,
                                left: 140,
                                child: Image.asset(
                                  'assets/img/wheel/cap.png',
                                  width: 110,
                                  height: 100,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: width(context) * .5,
                      height: height(context) * .5,
                      child: ListWheelScrollView(
                        itemExtent: 50,
                        diameterRatio: 1.8,
                        onSelectedItemChanged: (int index) {
                          oldindex = index;
                          // update the UI on selected item changes
                          if (oldindex > _selectedIndex) {
                            setState(() {
                              _selectedIndex = index;
                              rota = rota + 45;
                            });
                          } else {
                            setState(() {
                              _selectedIndex = index;
                              rota = rota - 45;
                            });
                          }
                        },
                        // children of the list
                        children: items
                            .map((e) => Card(
                                  elevation: 0,
                                  color: (items.indexOf(e) == _selectedIndex)
                                      ? const Color.fromARGB(255, 44, 1, 63)
                                      : Colors.transparent,
                                  child: Center(
                                    child: Text(
                                      e,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: (items.indexOf(e) ==
                                                  _selectedIndex)
                                              ? Colors.white
                                              : const Color.fromARGB(
                                                  255, 205, 5, 75)),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              )
            ])),
      ),
    );
  }
}

List items = [
  'Tea',
  'Coffe',
  'Late',
  'Hot Choclate',
  'Cappuccino',
  'Expresso',
  'Americano',
  'Nescafe',
];
