import 'package:flutter/material.dart';
import 'package:flutter_collection/expand%20animation/custom_card.dart';
import 'package:flutter_collection/shared_data.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  AnimationController? controller;
  double cardHeight = 0;
  double backHeight = 80;
  bool expanded = false;
  double padding = 30;
  double btnpos = 25;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 255, 114, 43),
            body: SizedBox(
              width: width(context),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    backIcon(context),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomCard(
                      title: 'Croods',
                      colors: [
                        Color.fromARGB(255, 11, 235, 134),
                        Color.fromARGB(255, 6, 162, 64),
                      ],
                      img: 'assets/img/auto_scroll/image2.jpg',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomCard(
                        img: 'assets/img/auto_scroll/image3.jpg',
                        title: 'Kong fo panda',
                        colors: [
                          Color.fromARGB(255, 235, 235, 11),
                          Color.fromARGB(255, 162, 133, 6)
                        ]),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomCard(
                        img: 'assets/img/auto_scroll/image7.jpg',
                        title: 'Minions',
                        colors: [
                          Color.fromARGB(255, 11, 179, 235),
                          Color.fromARGB(255, 6, 74, 162)
                        ]),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomCard(
                        img: 'assets/img/auto_scroll/image9.jpg',
                        title: 'Bolt',
                        colors: [
                          Color.fromARGB(255, 235, 11, 60),
                          Color.fromARGB(255, 162, 6, 16)
                        ]),
                  ],
                ),
              ),
            )));
  }
}
