import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_collection/shared_data.dart';

class CardBottle extends StatefulWidget {
  final Color color;
  final String logo;
  final String bottle;
  final String title;
  final String content;

  const CardBottle(
      {super.key,
      required this.color,
      required this.logo,
      required this.bottle,
      required this.title,
      required this.content});

  @override
  State<CardBottle> createState() => _CardBottleState();
}

class _CardBottleState extends State<CardBottle> {
  bool change = false;
  bool logo = false;
  bool widgets = false;
  bool bottle = false;
  bool text = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        if (logo) {
          setState(() {
            change = !change;
            bottle = false;
            text = false;
          });
          Timer(const Duration(milliseconds: 400), () {
            setState(() {
              logo = false;
            });
          });
          Timer(const Duration(milliseconds: 250), () {
            setState(() {
              widgets = !widgets;
            });
          });
        } else {
          setState(() {
            logo = true;
            bottle = true;
          });
          Timer(const Duration(milliseconds: 250), () {
            setState(() {
              change = !change;
            });
          });
          Timer(const Duration(milliseconds: 500), () {
            setState(() {
              widgets = !widgets;
              text = true;
            });
          });
        }
      }),
      child: Stack(
        children: [
          AnimatedContainer(
            height: 150,
            width: change ? width(context) * .8 : 150,
            duration: const Duration(milliseconds: 500),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: change ? widget.color : Colors.black,
                borderRadius: BorderRadius.circular(change ? 20 : 120),
                border: Border.all(color: widget.color, width: 5)),
            child: widgets
                ? Container()
                : AnimatedScale(
                    duration: const Duration(milliseconds: 250),
                    scale: logo ? 0 : 1,
                    child: Image.asset(
                      widget.logo,
                      fit: BoxFit.contain,
                    ),
                  ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            right: 20,
            child: SizedBox(
              height: 100,
              child: AnimatedScale(
                duration: const Duration(milliseconds: 250),
                scale: bottle ? 2 : 0,
                child: Image.asset(
                  widget.bottle,
                  height: 150,
                  width: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          text
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: width(context) * .5,
                        child: Text(
                          widget.content,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
