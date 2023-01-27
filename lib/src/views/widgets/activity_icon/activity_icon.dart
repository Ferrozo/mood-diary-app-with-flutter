import 'package:flutter/material.dart';

class ActivityIcon extends StatelessWidget {
  ActivityIcon({
    Key? key,
    required this.name,
    required this.image,
    required this.color,
  }) : super(key: key);
  String image;
  String name;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: color),
      ),
      height: 80,
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
