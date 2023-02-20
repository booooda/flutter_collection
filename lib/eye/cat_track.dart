import 'package:flutter/material.dart';
import 'package:flutter_collection/shared_data.dart';
import 'package:rive/rive.dart';

class CatTrack extends StatefulWidget {
  const CatTrack({super.key});

  @override
  State<CatTrack> createState() => _CatTrackState();
}

class _CatTrackState extends State<CatTrack> {
  StateMachineController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          SizedBox(
              width: width(context),
              height: height(context),
              child: RiveAnimation.asset(
                'assets/img/Main/cat.riv',
                fit: BoxFit.fitHeight,
                stateMachines: const ["state"],
                onInit: ((artboard) {
                  controller = StateMachineController.fromArtboard(
                      artboard, "State Machine 1");
                  if (controller == null) return;
                  artboard.addController(controller!);
                }),
              )),
          backIcon(context),
        ]),
      ),
    );
  }
}
