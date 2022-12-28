import 'package:flutter/material.dart';
import 'package:flutter_collection/smart%20switch/provider.dart';
import 'package:provider/provider.dart';

import 'globals.dart';
import 'home_model.dart';

class ContentWidget extends StatelessWidget {
  final int index;
  final Color color;
  ContentWidget({required this.index, required this.color});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    final homeData = HomeData.fromMap(Global.homeItems[index]);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          height: 100,
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                homeData.icon,
                color: Colors.black,
              ),
              Text(
                model.switchValues[index]
                    ? '${(model.sliderValues[index] * 100).round()}%'
                    : 'Off',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontFamily: 'Sf',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              homeData.location,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
