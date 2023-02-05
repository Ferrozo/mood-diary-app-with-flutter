import 'package:flutter/cupertino.dart';
import 'package:mood_diary_app_with_flutter/src/data/local/database.dart';
// import 'package:moodairy/helpers/db_helper.dart';
// import 'package:moodairy/models/activity.dart';

class MoodCard extends ChangeNotifier {
  MoodCard({
    required this.dayOfWeek,
    required this.dateTime,
    required this.image,
    required this.mood,
  });

  String dateTime;
  String mood;
  String image;
  String dayOfWeek;

  List? items;
  String? date;
  bool isloading = false;
  List<Color> colors = [];

  Future<void> addPlace(
    String dateTime,
    String mood,
    String image,
    String dayOfWeek,
    String date,
  ) async {
    DBHelper.insert(
      'user_moods',
      {
        'dateTime': dateTime,
        'mood': mood,
        'image': image,
        'dayOfWeek': dayOfWeek,
        'date': date
      },
    );

    notifyListeners();
  }

  Future<void> deletePlaces(String dateTime) async {
    DBHelper.delete(dateTime);
    notifyListeners();
  }
}
