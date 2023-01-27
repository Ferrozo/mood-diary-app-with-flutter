import 'package:flutter/material.dart';

class MoodIcon extends StatelessWidget {
  const MoodIcon(
      {Key? key, required this.name, required this.image, required this.color})
      : super(key: key);

  final String image;
  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: color),
      ),
      height: 75,
      width: 55,
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            height: 45,
            width: 45,
          ),
          Text(name)
        ],
      ),
    );
  }
}
