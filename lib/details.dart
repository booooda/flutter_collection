import 'package:flutter/material.dart';
import 'package:flutter_collection/shared_data.dart';
import 'package:flutter_collection/widgets/card_img.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class Details extends StatelessWidget {
  final Project project;
  const Details({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: project.color,
        body: SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                backIcon(context),
                TextAnimator(
                  incomingEffect:
                      WidgetTransitionEffects.incomingSlideInFromTop(
                          blur: const Offset(0, 20), scale: 2),
                  project.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WidgetAnimator(
                      incomingEffect:
                          WidgetTransitionEffects.incomingSlideInFromLeft(
                              delay: const Duration(milliseconds: 500),
                              blur: const Offset(0, 20),
                              scale: 2),
                      child: ElevatedButton(
                          style: buttonStyle(project.color),
                          onPressed: (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => project.details)));
                          }),
                          child: const Text('Demo')),
                    ),
                    const SizedBox(width: 10),
                    WidgetAnimator(
                      incomingEffect:
                          WidgetTransitionEffects.incomingSlideInFromRight(
                              delay: const Duration(milliseconds: 1000),
                              blur: const Offset(0, 20),
                              scale: 2),
                      child: ElevatedButton(
                          style: buttonStyle(project.color),
                          onPressed: (() {}),
                          child: const Text('Github')),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Hero(
                    flightShuttleBuilder: (
                      BuildContext flightContext,
                      Animation<double> animation,
                      HeroFlightDirection flightDirection,
                      BuildContext fromHeroContext,
                      BuildContext toHeroContext,
                    ) {
                      return RotationTransition(
                          turns: animation,
                          child: CardImage(
                            img: project.img,
                            height: 200,
                          ));
                    },
                    tag: project,
                    child: CardImage(
                      img: project.img,
                      height: 300,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
