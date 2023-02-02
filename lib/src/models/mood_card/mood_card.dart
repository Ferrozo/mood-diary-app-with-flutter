import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:mood_diary_app_with_flutter/src/data/helpers/mood_data/mood_data.dart';
import 'package:mood_diary_app_with_flutter/src/data/local/dbhelper.dart';
import 'package:mood_diary_app_with_flutter/src/models/activity/activity_model.dart';
// import 'package:moodairy/helpers/db_helper.dart';
// import 'package:moodairy/helpers/mooddata.dart';
// import 'package:moodairy/models/activity.dart';

class MoodCard extends ChangeNotifier {
  MoodCard({
    // required this.actImage,
    required this.dayOfWeek,
    required this.dateTime,
    required this.image,
    required this.mood,
  });

  String dateTime;
  String mood;
  // List<String> activityNames = [];
  // List<String> activityImages = [];
  String image;
  // String actImage;
  String dayOfWeek;

  List? items;
  List<MoodData> data = [];
  String? date;
  bool isloading = false;
  List<Color> colors = [];

  // void add(ActivityModel act) {
  //   activityImages.add(act.image);
  //   activityNames.add(act.name);
  //   notifyListeners();
  // }

  Future<void> addPlace(
    String dateTime,
    String mood,
    String image,
    // String actImage,
    String dayOfWeek,
    String date,
  ) async {
    DBHelper.insert(
      'user_moods',
      {
        'dateTime': dateTime,
        'mood': mood,
        'image': image,
        'colors': colors,
        // 'actImage': actImage,
        'dayOfWeek': dayOfWeek,
        'date': date
      },
    );

    print('dateTime $dateTime \n dateOnly $date');
    notifyListeners();
  }

  Future<void> deletePlaces(String dateTime) async {
    DBHelper.delete(dateTime);
    notifyListeners();
  }
}
