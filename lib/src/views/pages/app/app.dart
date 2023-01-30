import 'package:flutter/material.dart';
import 'package:mood_diary_app_with_flutter/src/models/mood_card/mood_card.dart';
import 'package:mood_diary_app_with_flutter/src/views/pages/dashboard/dashboard.dart';
import 'package:mood_diary_app_with_flutter/src/views/pages/exports_pages.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: MoodCard(
          actImage: '', actName: '', dateTime: '', image: '', mood: ''),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        routes: {
          '/home_screen': (ctx) => const HomePage(),
          '/dashboard': (ctx) => Dashboard(),
        },
      ),
    );
  }
}
