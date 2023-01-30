import 'package:flutter/cupertino.dart';

class MoodModel {
  MoodModel({
    required this.title,
    required this.image,
    required this.isSelected,
    required this.colors,
  });
  String title;
  String image;
  bool isSelected;
  List<Color> colors;
}
