import 'package:diamond_node_slider/diamond_node_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_collection/shared_data.dart';
import 'package:rive/rive.dart';

class Smile extends StatefulWidget {
  const Smile({super.key});

  @override
  State<Smile> createState() => _SmileState();
}

class _SmileState extends State<Smile> {
  double rate = 0;
  SMIInput<bool>? sad;
  FocusNode rateNode = FocusNode();
  SMIInput<double>? score;
  StateMachineController? controller;

  @override
  void initState() {
    rateNode.addListener(emailFocus);
    super.initState();
  }

  @override
  void dispose() {
    rateNode.removeListener(emailFocus);
    super.dispose();
  }

  void emailFocus() {
    sad?.change(false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        color: const Color.fromARGB(255, 244, 221, 132),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            backIcon(context),
            const Text(
              'Tell us how your experience',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                width: 250,
                height: 250,
                child: RiveAnimation.asset(
                  'assets/img/Main/smile.riv',
                  fit: BoxFit.fitHeight,
                  stateMachines: const ["state"],
                  onInit: ((artboard) {
                    controller =
                        StateMachineController.fromArtboard(artboard, "state");
                    if (controller == null) return;
                    artboard.addController(controller!);
                    sad = controller?.findInput("rate");
                    score = controller?.findInput("score");
                    sad?.change(true);
                  }),
                )),
            DiamondNodeSlisder(
              (value) {
                score!.change(value.toDouble());
              },
              activeTrackColor: const Color.fromARGB(255, 255, 118, 64),
              unActiveTrackColor: const Color(0xFFEBEBEB),
              width: 200,
              height: 2.5,
              divisions: 1,
              maxValue: 10,
              minValue: 0,
              textUnitStr: '',
            ),
          ],
        ),
      )),
    );
  }
}
