import 'package:charts_flutter/flutter.dart' as charts;

class MoodData {
  String date;
  int moodno;
  charts.Color barColor;

  MoodData({required this.moodno, required this.date, required this.barColor});
}
