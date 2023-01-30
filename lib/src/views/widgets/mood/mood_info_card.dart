import 'package:flutter/material.dart';

class MoodInfoCard extends StatelessWidget {
  const MoodInfoCard(
      {Key? key, required this.moodTitle, required this.moodEmoji})
      : super(key: key);

  final String moodTitle;
  final String moodEmoji;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          moodTitle,
          style: TextStyle(fontSize: 22, color: Colors.grey.shade800),
        ),
        const SizedBox(height: 30),
        Image.asset(
          moodEmoji,
          width: 160,
        ),
      ],
    );
  }
}
