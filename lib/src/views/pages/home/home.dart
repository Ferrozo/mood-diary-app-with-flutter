// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:mood_diary_app_with_flutter/src/models/activity/activity_model.dart';
import 'package:mood_diary_app_with_flutter/src/models/mood/mood_model.dart';
import 'package:mood_diary_app_with_flutter/src/models/mood_card/mood_card.dart';
import 'package:mood_diary_app_with_flutter/src/views/widgets/activity_icon/activity_icon.dart';
import 'package:mood_diary_app_with_flutter/src/views/widgets/mood/mood_info_card.dart';
import 'package:mood_diary_app_with_flutter/src/views/widgets/mood_icon/mood_icon.dart';
import 'package:provider/provider.dart';

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
  String? dateTime;
  int? currentIndex;
  int onTapCount = 0;
  Color colors = Colors.white;
  String? dateOnly;

  List<MoodModel> moods = [
    MoodModel(
      image: 'assets/smile.gif',
      title: 'Happy',
      isSelected: false,
      colors: [Colors.yellow.shade100, Colors.yellow.shade200],
    ),
    MoodModel(
      image: 'assets/very_good.gif',
      title: 'Very Good',
      isSelected: false,
      colors: [Colors.yellow.shade100, Colors.pink.shade100],
    ),
    MoodModel(
      image: 'assets/excited.gif',
      title: 'Excited',
      isSelected: false,
      colors: [
        Colors.indigo.shade300,
        Colors.yellow.shade100,
        Colors.red.shade300,
      ],
    ),
    MoodModel(
      image: 'assets/calm.gif',
      title: 'Calm',
      isSelected: false,
      colors: [Colors.yellow.shade200, Colors.yellow.shade800],
    ),
    MoodModel(
      image: 'assets/disappointed.gif',
      title: 'Disappointed',
      isSelected: false,
      colors: [Colors.yellow.shade200, Colors.yellow.shade900],
    ),
    MoodModel(
      image: 'assets/sad.gif',
      title: 'Sad',
      isSelected: false,
      colors: [Colors.yellow.shade200, Colors.yellow.shade500],
    ),
    MoodModel(
      image: 'assets/angry.gif',
      title: 'Angry',
      isSelected: false,
      colors: [Colors.yellow.shade100, Colors.pink.shade50],
    ),
    MoodModel(
      image: 'assets/awful.gif',
      title: 'Awful',
      isSelected: false,
      colors: [Colors.yellow.shade100, Colors.blue.shade100],
    ),
    MoodModel(
      image: 'assets/not_good.gif',
      title: 'Not Good',
      isSelected: false,
      colors: [Colors.yellow.shade100, Colors.yellow.shade700],
    ),
  ];

  List<ActivityModel> act = [
    ActivityModel(image: 'assets/1.png', name: 'Sports', selected: false),
    ActivityModel(image: 'assets/1.png', name: 'Nothing', selected: false),
    ActivityModel(image: 'assets/1.png', name: 'Something', selected: false),
    ActivityModel(image: 'assets/1.png', name: 'Others', selected: false),
  ];

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
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
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
              AspectRatio(
                aspectRatio: 1.4,
                child: PageView.builder(
                    controller: _currentPage,
                    itemCount: moods.length,
                    itemBuilder: (_, currentIndex) {
                      return Center(
                        child: MoodInfoCard(
                          moodTitle: moods[currentIndex].title,
                          moodEmoji: moods[currentIndex].image,
                        ),
                      );
                    }),
              ),
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
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        // body: Column(
        //   children: <Widget>[
        //     IconButton(
        //       onPressed: () => Navigator.of(context).pushNamed('/dashboard'),
        //       icon: const Icon(Icons.dashboard),
        //     ),
        //     Row(children: <Widget>[
        //       const SizedBox(width: 70),
        //       IconButton(
        //           icon: const Icon(Icons.date_range),
        //           onPressed: () => showDatePicker(
        //                       context: context,
        //                       initialDate: DateTime.now(),
        //                       firstDate: DateTime(2001),
        //                       lastDate: DateTime(2024))
        //                   .then(
        //                 (date) => {
        //                   setState(
        //                     () {
        //                       datePicked =
        //                           '${date!.day.toString()} - ${date.month.toString()} - ${date.year.toString()}';
        //                       dateOnly =
        //                           '${date.day..toString()} / ${date.month.toString()}';
        //                     },
        //                   ),
        //                 },
        //               )),
        //       IconButton(
        //         icon: const Icon(Icons.timer),
        //         onPressed: () =>
        //             showTimePicker(context: context, initialTime: TimeOfDay.now())
        //                 .then(
        //           (time) => {
        //             setState(
        //               () {
        //                 timePicked = time!.format(context).toString();
        //               },
        //             ),
        //           },
        //         ),
        //       ),
        //       Container(
        //         height: 40,
        //         width: 40,
        //         child: FloatingActionButton(
        //           child: const Icon(Icons.done),
        //           onPressed: () => setState(() {
        //             dateTime = '${datePicked} ${timePicked}';
        //             // ignore: avoid_print
        //             print(dateTime);
        //           }),
        //         ),
        //       )
        //     ]),
        //     Expanded(
        //       child: ListView.builder(
        //           scrollDirection: Axis.horizontal,
        //           itemCount: moods.length,
        //           itemBuilder: (context, index) {
        //             return Row(
        //               children: <Widget>[
        //                 const SizedBox(width: 15),
        //                 GestureDetector(
        //                     child: MoodIcon(
        //                         image: moods[index].image,
        //                         name: moods[index].title,
        //                         color: moods[index].isSelected
        //                             ? Colors.black
        //                             : Colors.white),
        //                     onTap: () => {
        //                           if (onTapCount == 0)
        //                             {
        //                               setState(() {
        //                                 mood = moods[index].title;
        //                                 image = moods[index].image;
        //                                 moods[index].isSelected = true;
        //                                 onTapCount += onTapCount;
        //                                 print(mood);
        //                               }),
        //                             }
        //                           else if (moods[index].isSelected)
        //                             {
        //                               setState(() {
        //                                 moods[index].isSelected = false;
        //                                 onTapCount = 0;
        //                               })
        //                             }
        //                         }),
        //               ],
        //             );
        //           }),
        //     ),
        //     const Text('WHAT YOU HAVE BEEN DOING?',
        //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        //     const SizedBox(height: 10),
        //     const Text('Hold on the activity to select,You can choose multiple',
        //         style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
        //     Expanded(
        //       child: ListView.builder(
        //           scrollDirection: Axis.horizontal,
        //           itemCount: act.length,
        //           itemBuilder: (context, index) {
        //             return Row(children: <Widget>[
        //               const SizedBox(width: 15),
        //               GestureDetector(
        //                   child: ActivityIcon(
        //                       image: act[index].image,
        //                       name: act[index].name,
        //                       color: act[index].selected
        //                           ? Colors.black
        //                           : Colors.white),
        //                   onTap: () {
        //                     if (act[index].selected) {
        //                       setState(() {
        //                         act[index].selected = false;
        //                       });
        //                     } else {
        //                       setState(
        //                         () {
        //                           act[index].selected = true;
        //                           Provider.of<MoodCard>(context, listen: false)
        //                               .add(act[index]);

        //                           print(act[index].selected);
        //                         },
        //                       );
        //                     }
        //                   }),
        //             ]);
        //           }),
        //     ),
        //     IconButton(
        //       onPressed: () => {
        //         setState(
        //           () {
        //             Provider.of<MoodCard>(context, listen: false).addPlace(
        //                 dateTime!,
        //                 mood!,
        //                 image!,
        //                 Provider.of<MoodCard>(context, listen: false)
        //                     .activityImages
        //                     .join('_'),
        //                 Provider.of<MoodCard>(context, listen: false)
        //                     .activityNames
        //                     .join('_'),
        //                 dateOnly!);
        //           },
        //         ),
        //         // Navigator.of(context).pushNamed('/home_screen'),
        //       },
        //       icon: const Icon(Icons.send),
        //     )
        //   ],
        // ),
      ),
    );
  }
}
