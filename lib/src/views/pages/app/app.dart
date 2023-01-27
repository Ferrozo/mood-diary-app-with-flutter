import 'package:flutter/material.dart';
import 'package:mood_diary_app_with_flutter/src/views/pages/exports_pages.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
