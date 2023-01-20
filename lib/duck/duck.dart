import 'package:flutter/material.dart';
import 'package:flutter_collection/shared_data.dart';
import 'package:rive/rive.dart';
import 'dart:async';

class Duck extends StatefulWidget {
  const Duck({super.key});

  @override
  State<Duck> createState() => _DuckState();
}

class _DuckState extends State<Duck> {
  Color color = Colors.red;
  int i = 0;
  List<Color> change = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.black,
  ];
  SMIInput<bool>? light;
  bool on = false;
  bool duck = false;
  StateMachineController? controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    const oneSec = Duration(milliseconds: 500);
    Timer.periodic(oneSec, (Timer t) {
      if (on) {
        colors();
      }
      //print(color);
    });
  }

  void colors() {
    if (i == change.length) {
      setState(() {
        i = 0;
        color = change[i];
      });
    } else {
      setState(() {
        color = change[i];
        i++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: width(context),
          height: height(context),
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Turn lights on to start party',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: (() {
                  setState(() {
                    duck = !duck;
                  });
                }),
                child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(color: Colors.yellow),
                    child: Text(
                      duck ? 'Hide duck' : 'Get the Duck',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              AnimatedScale(
                scale: duck ? 1 : 0,
                duration: const Duration(seconds: 1),
                child: Image.asset(
                  'assets/img/duck/duck.gif',
                  height: 200,
                ),
              ),
              GestureDetector(
                onTap: () {
                  light!.change(on);
                  on = !on;
                },
                child: SizedBox(
                    width: 250,
                    height: 250,
                    child: RiveAnimation.asset(
                      'assets/img/duck/light.riv',
                      fit: BoxFit.fitHeight,
                      stateMachines: const ["state"],
                      onInit: ((artboard) {
                        controller = StateMachineController.fromArtboard(
                            artboard, "state");
                        if (controller == null) return;
                        artboard.addController(controller!);
                        light = controller?.findInput("light");
                      }),
                    )),
              ),
            ],
          )),
    );
  }
}
