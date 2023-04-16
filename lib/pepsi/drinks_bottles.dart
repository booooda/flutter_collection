import 'package:flutter/material.dart';
import 'package:flutter_collection/pepsi/bottle_card.dart';
import 'package:flutter_collection/shared_data.dart';

class DrinksBottles extends StatefulWidget {
  const DrinksBottles({super.key});

  @override
  State<DrinksBottles> createState() => _DrinksBottlesState();
}

class _DrinksBottlesState extends State<DrinksBottles> {
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
              'Check our Drinks',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50,
            ),
            const CardBottle(
              bottle: 'assets/img/pepsi/bottle.png',
              color: Color.fromARGB(255, 23, 0, 195),
              content:
                  'Pepsi is a carbonated soft drink manufactured by PepsiCo. Originally created and developed in 1893',
              logo: 'assets/img/pepsi/logo.png',
              title: 'pepsi',
            ),
            const SizedBox(
              height: 50,
            ),
            const CardBottle(
              bottle: 'assets/img/pepsi/cocaB.png',
              color: Color.fromARGB(255, 195, 0, 0),
              content:
                  'Pepsi is a carbonated soft drink manufactured by PepsiCo. Originally created and developed in 1893',
              logo: 'assets/img/pepsi/coca.png',
              title: 'Cocacola',
            ),
            const SizedBox(
              height: 50,
            ),
            const CardBottle(
              bottle: 'assets/img/pepsi/swB.png',
              color: Color.fromARGB(255, 250, 188, 44),
              content:
                  'Pepsi is a carbonated soft drink manufactured by PepsiCo. Originally created and developed in 1893',
              logo: 'assets/img/pepsi/sw.png',
              title: 'Cocacola',
            ),
          ],
        ),
      )),
    );
  }
}
