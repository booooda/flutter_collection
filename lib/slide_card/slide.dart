import 'package:flutter/material.dart';
import 'package:flutter_collection/shared_data.dart';
import 'package:flutter_collection/slide_card/slide_card.dart';

class Slide extends StatefulWidget {
  const Slide({super.key});

  @override
  State<Slide> createState() => _SlideState();
}

class _SlideState extends State<Slide> {
  bool drag = false;
  double transX = 0;
  double transY = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        color: const Color.fromARGB(255, 244, 240, 226),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            backIcon(context),
            const Text(
              'Slide Card',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50,
            ),
            const SlideCard(color: Colors.amber),
            const SlideCard(color: Colors.lightGreen),
            const SlideCard(color: Colors.deepOrange),
          ],
        ),
      )),
    );
  }
}
