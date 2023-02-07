// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:mood_diary_app_with_flutter/src/models/mood/mood_model.dart';
import 'package:mood_diary_app_with_flutter/src/models/mood_card/mood_card.dart';
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _currentPage = PageController(viewportFraction: 1);
  int _currentIndex = 0;
  MoodCard? moodCard;
  String? mood;
  String? image;
  String? datePicked;
  String? timePicked;
  DateTime dateTime = DateTime.now();
  int? currentIndex;
  int onTapCount = 0;
  Color colors = Colors.white;
  String? dateOnly;
  String? dayOfWeek;
  List<MoodModel> moods = ListOfMoods.moods;

  @override
  void initState() {
    _currentPage.addListener(() {
      int next = _currentPage.page!.round();
      if (_currentIndex != next) {
        setState(() {
          _currentIndex = next;
        });
      }
    });
    mood = moods[_currentIndex].title.toString();
    image = moods[_currentIndex].image.toString();
    // dateTime = ;
    dayOfWeek = DateFormat('EEEE').format(dateTime).toString();
    dateOnly = "${dateTime.day}-${dateTime.month}-${dateTime.year}";

    super.initState();
  }

  @override
  void dispose() {
    _currentPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(microseconds: 100),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: moods[_currentIndex].colors,
          begin: Alignment.bottomCenter,
          end: Alignment.topLeft,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pushNamed('/chart'),
                  icon: const Icon(
                    Icons.bar_chart_rounded,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed('/dashboard'),
                  icon: const Icon(
                    Icons.checklist_outlined,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  'How are you \nfeeling Today?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(height: 100),
                // AspectRatio(
                //   aspectRatio: 1.4,
                //   child: PageView.builder(
                //       onPageChanged: (_) {
                //         setState(() {
                //           mood = moods[_currentIndex].title;
                //           image = moods[_currentIndex].image;
                //           // moods[_currentPage.page!.toInt()].isSelected = true;
                //           // onTapCount += onTapCount;
                //         });
                //       },
                //       controller: _currentPage,
                //       itemCount: moods.length,
                //       itemBuilder: (_, currentIndex) {
                //         return Center(
                //           child: MoodInfoCard(
                //             moodTitle: moods[currentIndex].title,
                //             moodEmoji: moods[currentIndex].image,
                //           ),
                //         );
                //       }),
                // ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 80),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black,
                        ),
                        height: 60,
                        width: MediaQuery.of(context).size.width - 25,
                        child: TextButton(
                          child: const Text(
                            'Select',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          onPressed: () async {
                            Provider.of<MoodCard>(context, listen: false)
                                .addPlace(
                              dayOfWeek.toString(),
                              mood.toString(),
                              image.toString(),
                              dateTime.toString(),
                              dateOnly.toString(),
                            );
                            await Navigator.of(context).pushNamed('/dashboard');
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
