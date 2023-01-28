import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mood_diary_app_with_flutter/src/models/activity/activity_model.dart';
import 'package:mood_diary_app_with_flutter/src/models/mood/mood_model.dart';
import 'package:mood_diary_app_with_flutter/src/models/mood_card/mood_card.dart';
import 'package:mood_diary_app_with_flutter/src/views/widgets/activity_icon/activity_icon.dart';
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
  MoodCard? moodCard;
  String? mood;
  String? image;
  String? datePicked;
  String? timePicked;
  String? dateTime;
  int? currentIndex;
  int onTapCount = 0;

  List<MoodModel> moods = [
    MoodModel(image: 'assets/1.png', title: 'Happy', isSelected: false),
    MoodModel(image: 'assets/1.png', title: 'Sad', isSelected: false),
  ];

  List<ActivityModel> act = [
    ActivityModel(image: 'assets/1.png', name: 'Sports', selected: false),
    ActivityModel(image: 'assets/1.png', name: 'Nothing', selected: false),
    ActivityModel(image: 'assets/1.png', name: 'Something', selected: false),
    ActivityModel(image: 'assets/1.png', name: 'Others', selected: false),
  ];
  Color colors = Colors.white;
  String? dateOnly;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed('/chart'),
            icon: Icon(Icons.dashboard),
          ),
          Row(children: <Widget>[
            const SizedBox(width: 70),
            IconButton(
                icon: const Icon(Icons.date_range),
                onPressed: () => showDatePicker(
                            keyboardType: TextInputType.number,
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2001),
                            lastDate: DateTime(2024))
                        .then(
                      (date) => {
                        setState(
                          () {
                            datePicked =
                                '${date!.day}-${date.month}-${date.year}';
                            dateOnly = '${date.day}/${date.month}';
                          },
                        ),
                      },
                    )),
            IconButton(
                icon: const Icon(Icons.timer),
                onPressed: () => showTimePicker(
                        context: context, initialTime: TimeOfDay.now())
                    .then((time) => {
                          setState(() {
                            timePicked = time!.format(context).toString();
                          })
                        })),
            Container(
              height: 40,
              width: 40,
              child: FloatingActionButton(
                child: Icon(Icons.done),
                onPressed: () => setState(() {
                  dateTime = '${datePicked}   ${timePicked}';
                }),
              ),
            )
          ]),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: moods.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: <Widget>[
                      const SizedBox(width: 15),
                      GestureDetector(
                          child: MoodIcon(
                              image: moods[index].image,
                              name: moods[index].title,
                              color: moods[index].isSelected
                                  ? Colors.black
                                  : Colors.white),
                          onTap: () => {
                                if (onTapCount == 0)
                                  {
                                    setState(() {
                                      mood = moods[index].title;
                                      image = moods[index].image;
                                      moods[index].isSelected = true;
                                      onTapCount = onTapCount + 1;
                                      print(mood);
                                    }),
                                  }
                                else if (moods[index].isSelected)
                                  {
                                    setState(() {
                                      moods[index].isSelected = false;
                                      onTapCount = 0;
                                    })
                                  }
                              }),
                    ],
                  );
                }),
          ),
          Text('WHAT YOU HAVE BEEN DOING?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text('Hold on the activity to select,You can choose multiple',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: act.length,
                itemBuilder: (context, index) {
                  return Row(children: <Widget>[
                    const SizedBox(width: 15),
                    GestureDetector(
                        child: ActivityIcon(
                            image: act[index].image,
                            name: act[index].name,
                            color: act[index].selected
                                ? Colors.black
                                : Colors.white),
                        onTap: () {
                          if (act[index].selected) {
                            setState(() {
                              act[index].selected = false;
                            });
                          } else {
                            setState(
                              () {
                                act[index].selected = true;
                                Provider.of<MoodCard>(context, listen: false)
                                    .add(act[index]);

                                print(act[index].selected);
                              },
                            );
                          }
                        }),
                  ]);
                }),
          ),
          IconButton(
            onPressed: () => {
              setState(() {
                Provider.of<MoodCard>(context, listen: false).addPlace(
                    dateTime!,
                    mood!,
                    image!,
                    Provider.of<MoodCard>(context, listen: false)
                        .activityImages
                        .join('_'),
                    Provider.of<MoodCard>(context, listen: false)
                        .activityNames
                        .join('_'),
                    dateOnly!);
              }),
              Navigator.of(context).pushNamed('/home_screen'),
            },
            icon: Icon(Icons.send),
          )
        ],
      ),
    );
  }
}
