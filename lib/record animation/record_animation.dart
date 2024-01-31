import 'dart:async';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_collection/shared_data.dart';

class RecordAnimation extends StatefulWidget {
  const RecordAnimation({super.key});

  @override
  State<RecordAnimation> createState() => _RecordAnimationState();
}

class _RecordAnimationState extends State<RecordAnimation> {
  bool recordOn = false;
  bool hideTextField = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
            height: height(context),
            width: width(context),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.black87,
                            )),
                        const Expanded(
                          child: Text(
                            "Start Record Animation",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Arial",
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Stack(
                          children: [
                            AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                width: hideTextField
                                    ? 0
                                    : MediaQuery.of(context).size.width / 1.3,
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 2,
                                        color: const Color.fromARGB(
                                            255, 7, 124, 193),
                                      )),
                                )),
                            AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                width: recordOn
                                    ? MediaQuery.of(context).size.width / 1.3
                                    : 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 7, 124, 193),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: AudioWaveforms(
                                    enableGesture: true,
                                    size: Size(
                                        MediaQuery.of(context).size.width / 1.3,
                                        50),
                                    recorderController: RecorderController(),
                                    waveStyle: const WaveStyle(
                                      waveColor: Colors.white,
                                      extendWaveform: true,
                                      showMiddleLine: false,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: const Color.fromARGB(
                                          255, 7, 124, 193),
                                    ),
                                    padding: const EdgeInsets.only(left: 18),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                  ),
                                )),
                          ],
                        ),
                        const SizedBox(width: 16),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          decoration: BoxDecoration(
                            color: recordOn
                                ? const Color.fromARGB(255, 7, 124, 193)
                                : Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              if (recordOn) {
                                recordOn = !recordOn;
                                Timer(const Duration(milliseconds: 250), () {
                                  hideTextField = !hideTextField;
                                  setState(() {});
                                });
                              } else {
                                hideTextField = !hideTextField;

                                Timer(const Duration(milliseconds: 250), () {
                                  recordOn = !recordOn;
                                  setState(() {});
                                });
                              }
                              setState(() {});
                            },
                            icon: Icon(recordOn ? Icons.stop : Icons.mic),
                            color: recordOn
                                ? Colors.white
                                : const Color.fromARGB(255, 7, 124, 193),
                            iconSize: 28,
                          ),
                        ),
                      ],
                    ),
                  )
                ])),
      ),
    );
  }
}

List items = [
  'Tea',
  'Coffe',
  'Late',
  'Hot Choclate',
  'Cappuccino',
  'Expresso',
  'Americano',
  'Nescafe',
];
