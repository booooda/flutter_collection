import 'package:flutter/material.dart';
import 'package:flutter_collection/shared_data.dart';
import 'package:scratcher/widgets.dart';

class Scratch extends StatelessWidget {
  Scratch({super.key});

  final scratchKey = GlobalKey<ScratcherState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            backIcon(context),
            Scratcher(
                key: scratchKey,
                image: Image.asset('assets/img/scratch/scratch.png'),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 253, 216, 105)),
                  width: width * .8,
                  height: 300,
                  child: const Center(
                    child: Text(
                      'Wow!!! 🎉🎉 you won 🎉',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )),
            ElevatedButton(
                style: buttonStyle(Colors.white, backColor: Colors.orange),
                onPressed: (() {
                  scratchKey.currentState
                      ?.reset(duration: const Duration(milliseconds: 500));
                }),
                child: const Text('Reset')),
          ],
        ),
      ),
    );
  }
}
