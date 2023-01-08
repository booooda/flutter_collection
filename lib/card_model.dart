import 'package:flutter/material.dart';

class CardData {
  String img;
  String title;
  Color color;
  CardData.fromMap(data)
      : img = data['img'],
        title = data['title'],
        color = data['color'];
}
