import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mood_diary_app_with_flutter/src/views/pages/app/app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const App());
}
