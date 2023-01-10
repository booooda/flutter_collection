import 'package:flutter/material.dart';
import 'package:flutter_collection/auto%20scroll/auto_scroll.dart';
import 'package:flutter_collection/day_mode.dart/day_mode.dart';
import 'package:flutter_collection/expand%20animation/card.dart';
import 'package:flutter_collection/mario/mario.dart';
import 'package:flutter_collection/scratch/scratch.dart';
import 'package:flutter_collection/smart%20switch/smart_switch.dart';
import 'package:flutter_collection/smile/smile.dart';

import 'login_animation/login.dart';

Color dark = const Color.fromARGB(255, 29, 37, 46);
const Color grey = Color.fromARGB(255, 56, 59, 62);
Color navy = const Color(0xff302d3e);

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

List<Map<String, dynamic>> cardData = [
  {
    'img': 'assets/img/Main/mario.png',
    'title': 'Super Mario',
    'color': Color.fromARGB(255, 144, 49, 38),
    'details': Mario()
  },
  {
    'img': 'assets/img/Main/character.png',
    'title': 'Login Animation',
    'color': const Color(0xff8C336B),
    'details': const Login()
  },
  {
    'img': 'assets/img/Main/autoScroll.png',
    'title': 'Auto List Scroll',
    'color': Colors.green,
    'details': AutoScroll()
  },
  {
    'img': 'assets/img/Main/smartSwitch.png',
    'title': 'Smart Switch',
    'color': Colors.blue,
    'details': const SmartSwitch()
  },
  {
    'img': 'assets/img/Main/scratch.png',
    'title': 'Scratcher',
    'color': const Color.fromARGB(255, 247, 170, 56),
    'details': Scratch()
  },
  {
    'img': 'assets/img/Main/day_mode.png',
    'title': 'Day Mode',
    'color': const Color.fromARGB(255, 204, 81, 226),
    'details': const DayMode()
  },
  {
    'img': 'assets/img/Main/emoji.png',
    'title': 'Emoji Rate',
    'color': const Color.fromARGB(255, 244, 221, 132),
    'details': const Smile()
  },
  {
    'img': 'assets/img/Main/expand.png',
    'title': 'Expanded Card',
    'color': const Color.fromARGB(255, 255, 114, 43),
    'details': const CardScreen()
  },
];

Widget backIcon(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back)),
    ],
  );
}

ButtonStyle buttonStyle(Color foreColor, {Color backColor = Colors.white}) {
  return ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(foreColor),
    backgroundColor: MaterialStateProperty.all<Color>(backColor),
  );
}

class Project {
  final String img;
  final String title;
  final Color color;
  final Widget details;

  Project.fromMap(data)
      : img = data['img'],
        title = data['title'],
        color = data['color'],
        details = data['details'];
}
