import 'package:flutter/material.dart';
import 'package:flutter_collection/shared_data.dart';
import 'package:flutter_collection/widgets/card_img.dart';

class CustomCard extends StatelessWidget {
  final Project project;
  const CustomCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => project.details)));
        },
        child: SizedBox(
          height: 210,
          width: width * .43,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: width * .43,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: project.color,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Hero(
                        tag: project,
                        child: CardImage(
                          img: project.img,
                          height: 150,
                        )),
                    Text(project.title,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
