import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_collection/pizza%20ingredients/ing_button.dart';
import 'package:flutter_collection/pizza%20ingredients/ing_widget.dart';
import 'package:flutter_collection/pizza%20ingredients/size_widget.dart';
import 'package:flutter_collection/shared_data.dart';
import 'package:flutter_collection/shop_sliders/clothes_model.dart';

class PizzaIngredients extends StatefulWidget {
  const PizzaIngredients({super.key});

  @override
  State<PizzaIngredients> createState() => _PizzaIngredientsState();
}

class _PizzaIngredientsState extends State<PizzaIngredients> {
  String size = "S";
  bool pepper = false;
  bool becon = false;
  bool mushroom = false;
  bool onions = false;
  bool spicy = false;
  bool tomato = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedContainer(
          duration: const Duration(seconds: 1),
          width: width(context),
          height: height(context),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black87,
                        )),
                    const Expanded(
                      child: Text(
                        "Pizza Ingredients",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Arial",
                            color: Colors.black87,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: width(context),
                height: height(context) * .5,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: size == 'S'
                          ? width(context) * .5
                          : size == "M"
                              ? width(context) * .6
                              : width(context) * .7,
                      height: size == 'S'
                          ? width(context) * .5
                          : size == "M"
                              ? width(context) * .6
                              : width(context) * .7,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/img/pizza/pizza.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    IngWidget(
                        selected: pepper,
                        image: 'assets/img/pizza/pepper.png',
                        size: size),
                    IngWidget(
                        selected: becon,
                        image: 'assets/img/pizza/becon.png',
                        size: size),
                    IngWidget(
                        selected: mushroom,
                        image: 'assets/img/pizza/mushroom.png',
                        size: size),
                    IngWidget(
                        selected: spicy,
                        image: 'assets/img/pizza/spicy.png',
                        size: size),
                    IngWidget(
                        selected: tomato,
                        image: 'assets/img/pizza/tomato.png',
                        size: size),
                    IngWidget(
                        selected: onions,
                        image: 'assets/img/pizza/onions.png',
                        size: size),
                  ],
                ),
              ),
              SizedBox(
                width: width(context),
                height: height(context) * .1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          size = "S";
                        });
                      },
                      child: SizeWidget(
                        size: 'S',
                        selected: size == "S",
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        setState(() {
                          size = "M";
                        });
                      },
                      child: SizeWidget(
                        size: 'M',
                        selected: size == "M",
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        setState(() {
                          size = "L";
                        });
                      },
                      child: SizeWidget(
                        size: 'L',
                        selected: size == "L",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 15,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        onions = !onions;
                        setState(() {});
                      },
                      child: IngButton(
                          selected: onions,
                          color: const Color.fromARGB(255, 119, 26, 19),
                          text: "Onions")),
                  InkWell(
                      onTap: () {
                        pepper = !pepper;
                        setState(() {});
                      },
                      child: IngButton(
                          selected: pepper,
                          color: Colors.green,
                          text: "Peppers")),
                  InkWell(
                      onTap: () {
                        spicy = !spicy;
                        setState(() {});
                      },
                      child: IngButton(
                          selected: spicy, color: Colors.red, text: "Spicy")),
                  InkWell(
                      onTap: () {
                        mushroom = !mushroom;
                        setState(() {});
                      },
                      child: IngButton(
                          selected: mushroom,
                          color: const Color.fromARGB(255, 186, 190, 137),
                          text: "Mushrooms")),
                  InkWell(
                      onTap: () {
                        becon = !becon;
                        setState(() {});
                      },
                      child: IngButton(
                          selected: becon,
                          color: const Color.fromARGB(255, 160, 94, 94),
                          text: "Bacons")),
                  InkWell(
                      onTap: () {
                        tomato = !tomato;
                        setState(() {});
                      },
                      child: IngButton(
                          selected: tomato,
                          color: Colors.red,
                          text: "Tomatoes")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
