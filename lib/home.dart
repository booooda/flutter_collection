import 'package:flutter/material.dart';
import 'package:flutter_collection/shared_data.dart';
import 'custom_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 15),
                const Text("Flutter Collectios",
                    style: TextStyle(fontSize: 25, color: Colors.white)),
                const Text('Improve your skills easily 🙌',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 79, 234, 102))),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  children: [
                    for (int i = 0; i < cardData.length; i++)
                      CustomCard(
                        project: Project.fromMap(cardData[i]),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
