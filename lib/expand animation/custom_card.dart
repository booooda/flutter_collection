import 'package:flutter/material.dart';
import 'package:flutter_collection/expand%20animation/clipper.dart';

class CustomCard extends StatefulWidget {
  final List<Color> colors;
  final String title;
  final String img;

  const CustomCard(
      {super.key,
      required this.colors,
      required this.title,
      required this.img});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  AnimationController? controller;
  double cardHeight = 0;
  double backHeight = 80;
  bool expanded = false;
  double padding = 30;
  double btnpos = 25;
  void expand() {
    if (expanded) {
      setState(() {
        cardHeight = 0;
        backHeight = 80;
        padding = 30;
        expanded = false;
        btnpos = 25;
      });
    } else {
      setState(() {
        cardHeight = 200;
        backHeight = 250;
        padding = 20;
        expanded = true;
        btnpos = 15;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => expand(),
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                tileMode: TileMode.clamp,
                colors: widget.colors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            width: 300,
            height: backHeight,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: padding),
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipPath(
              clipper: ContainerClipper(),
              child: AnimatedContainer(
                curve: Curves.linear,
                duration: const Duration(milliseconds: 250),
                width: 300,
                height: cardHeight,
                child: Image.asset(widget.img, fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
              bottom: btnpos,
              right: 10,
              child: Row(
                children: const [
                  Icon(
                    size: 25,
                    Icons.notification_add,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    size: 25,
                    Icons.add_shopping_cart_rounded,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
