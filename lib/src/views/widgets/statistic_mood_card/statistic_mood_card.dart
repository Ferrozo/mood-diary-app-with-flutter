import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StatisticMoodCard extends StatelessWidget {
  StatisticMoodCard({
    Key? key,
    required this.day,
    required this.dayOfWeek,
    required this.colors,
    required this.moodImage,
    required this.moodTitle,
  }) : super(key: key);

  final String moodTitle;
  final String day;
  final String dayOfWeek;
  final String moodImage;
  List<Color> colors = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(15),
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: colors,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  day,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  dayOfWeek,
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            Column(children: [
              Text(
                moodTitle,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              Image.asset(
                moodImage,
                width: 60,
              ),
            ])
          ],
        ),
      ),
    );
  }
}
