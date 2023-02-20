import 'package:flutter/material.dart';
import 'package:flutter_collection/shared_data.dart';
import 'package:rive/rive.dart';

class Side extends StatefulWidget {
  const Side({super.key});

  @override
  State<Side> createState() => _SideState();
}

class _SideState extends State<Side> {
  StateMachineController? controller;
  bool ex = true;
  bool show = false;
  SMIInput<bool>? expand;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(alignment: Alignment.bottomLeft, children: [
          GestureDetector(
            onTap: () {
              expand!.change(ex);
              ex = !ex;
            },
            child: SizedBox(
                width: width(context) * .3,
                height: height(context),
                child: RiveAnimation.asset(
                  'assets/img/rive/side.riv',
                  fit: BoxFit.fitHeight,
                  stateMachines: const ["state"],
                  onInit: ((artboard) {
                    controller =
                        StateMachineController.fromArtboard(artboard, "state");
                    if (controller == null) return;
                    artboard.addController(controller!);
                    expand = controller?.findInput("expand");
                  }),
                )),
          ),
          show
              ? SizedBox(
                  width: width(context) * .3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 40),
                      Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 40,
                      ),
                      SizedBox(height: 40),
                      Icon(
                        Icons.library_add,
                        color: Colors.white,
                        size: 40,
                      ),
                      SizedBox(height: 40),
                      Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 40,
                      ),
                    ],
                  ),
                )
              : Container()
        ]),
      ),
    );
  }
}
