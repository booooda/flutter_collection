import 'package:flutter/material.dart';
import 'package:flutter_collection/auto%20scroll/auto_scroll.dart';
import 'package:flutter_collection/bike/bike.dart';
import 'package:flutter_collection/burger/burger.dart';
import 'package:flutter_collection/category_transition/category_transition.dart';
import 'package:flutter_collection/day_mode.dart/day_mode.dart';
import 'package:flutter_collection/duck/duck.dart';
import 'package:flutter_collection/expand%20animation/card.dart';
import 'package:flutter_collection/eye/cat_track.dart';
import 'package:flutter_collection/mario/mario.dart';
import 'package:flutter_collection/pepsi/drinks_bottles.dart';
import 'package:flutter_collection/pizza%20ingredients/pizze_ing.dart';
import 'package:flutter_collection/record%20animation/record_animation.dart';
import 'package:flutter_collection/scratch/scratch.dart';
import 'package:flutter_collection/shop_sliders/shop_slider.dart';
import 'package:flutter_collection/slide_card/slide.dart';
import 'package:flutter_collection/smart%20switch/smart_switch.dart';
import 'package:flutter_collection/smile/smile.dart';
import 'package:flutter_collection/transation_expand.dart/transition.dart';
import 'package:flutter_collection/wheel_scroll/wheel.dart';

import 'login_animation/login.dart';
import 'sliver_animation/home.dart';

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
    'color': const Color.fromARGB(255, 144, 49, 38),
    'details': const Mario()
  },
  {
    'img': 'assets/img/Main/movie.png',
    'title': 'Expanded Menu',
    'color': const Color.fromARGB(255, 27, 1, 57),
    'details': const TransitionScreen()
  },
  {
    'img': 'assets/img/Main/wheel.png',
    'title': 'Wheel View',
    'color': const Color(0xffffcd9f),
    'details': const WheelScreen()
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
  {
    'img': 'assets/img/Main/sliver.png',
    'title': 'Sliver Animation',
    'color': const Color.fromARGB(255, 255, 43, 43),
    'details': const Sliver()
  },
  {
    'img': 'assets/img/Main/duck.png',
    'title': 'Duck ligths',
    'color': Colors.green,
    'details': const Duck()
  },
  {
    'img': 'assets/img/Main/cat.png',
    'title': 'Cat Tracking',
    'color': Colors.yellow[900],
    'details': const CatTrack()
  },
  {
    'img': 'assets/img/Main/bottles.png',
    'title': 'Drink Bottles',
    'color': const Color.fromARGB(255, 23, 60, 245),
    'details': const DrinksBottles()
  },
  {
    'img': 'assets/img/Main/slideCard.png',
    'title': 'Drink Bottles',
    'color': const Color.fromARGB(255, 55, 165, 0),
    'details': const Slide()
  },
  {
    'img': 'assets/img/Main/bike.png',
    'title': 'Drink Bottles',
    'color': const Color.fromARGB(255, 237, 189, 112),
    'details': const Bike()
  },
  {
    'img': 'assets/img/Main/burger.png',
    'title': 'Burger Bottles',
    'color': const Color.fromARGB(255, 126, 69, 0),
    'details': const Burger()
  },
  {
    'img': 'assets/img/Main/clothes_climp.png',
    'title': 'Clothes Slider',
    'color': const Color.fromARGB(255, 189, 176, 114),
    'details': const ShopSlider()
  },
  {
    'img': 'assets/img/Main/pizza.png',
    'title': 'Pizza Ingrediants',
    'color': const Color.fromARGB(255, 255, 255, 255),
    'details': const PizzaIngredients()
  },
  {
    'img': 'assets/img/Main/record.png',
    'title': 'Record Animation',
    'color': const Color.fromARGB(255, 7, 124, 193),
    'details': const RecordAnimation()
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
