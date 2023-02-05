import 'package:flutter/material.dart';

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

class ListOfMoods {
  static List<MoodModel> moods = [
    MoodModel(
      image: 'assets/smile.gif',
      title: 'Happy',
      isSelected: false,
      colors: [Colors.yellow.shade100, Colors.yellow.shade200],
    ),
    MoodModel(
      image: 'assets/very_good.gif',
      title: 'Very Good',
      isSelected: false,
      colors: [Colors.yellow.shade100, Colors.pink.shade100],
    ),
    MoodModel(
      image: 'assets/excited.gif',
      title: 'Excited',
      isSelected: false,
      colors: [
        Colors.indigo.shade300,
        Colors.yellow.shade100,
        Colors.red.shade300,
      ],
    ),
    MoodModel(
      image: 'assets/calm.gif',
      title: 'Calm',
      isSelected: false,
      colors: [Colors.yellow.shade200, Colors.yellow.shade800],
    ),
    MoodModel(
      image: 'assets/disappointed.gif',
      title: 'Disappointed',
      isSelected: false,
      colors: [Colors.yellow.shade200, Colors.yellow.shade900],
    ),
    MoodModel(
      image: 'assets/sad.gif',
      title: 'Sad',
      isSelected: false,
      colors: [Colors.yellow.shade200, Colors.yellow.shade500],
    ),
    MoodModel(
      image: 'assets/angry.gif',
      title: 'Angry',
      isSelected: false,
      colors: [Colors.yellow.shade100, Colors.pink.shade50],
    ),
    MoodModel(
      image: 'assets/awful.gif',
      title: 'Awful',
      isSelected: false,
      colors: [Colors.yellow.shade100, Colors.blue.shade100],
    ),
    MoodModel(
      image: 'assets/not_good.gif',
      title: 'Not Good',
      isSelected: false,
      colors: [Colors.yellow.shade100, Colors.yellow.shade700],
    ),
  ];
}
