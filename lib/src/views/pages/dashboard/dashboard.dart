import 'package:flutter/material.dart';
import 'package:mood_diary_app_with_flutter/src/data/local/database.dart';
import 'package:mood_diary_app_with_flutter/src/models/mood_card/mood_card.dart';
import 'package:mood_diary_app_with_flutter/src/views/widgets/statistic_mood_card/statistic_mood_card.dart';
import 'package:provider/provider.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool loader = false;
  List<Color> colors = [Colors.yellow.shade100, Colors.yellow.shade200];

  @override
  Widget build(BuildContext context) {
    loader = Provider.of<MoodCard>(context, listen: true).isloading;
    return loader
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  const Text('Journal'),
                  const Spacer(),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.bar_chart_rounded))
                ],
              ),
            ),
            body: FutureBuilder<List>(
              future: DBHelper.getData('user_moods'),
              // initialData: const [],
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (_, index) {
                          return StatisticMoodCard(
                            moodTitle: snapshot.data![index]['mood'],
                            day: snapshot.data![index]['date'],
                            dayOfWeek: snapshot.data![index]['dateTime'],
                            moodImage: snapshot.data![index]['image'],
                            colors: [
                              Colors.yellow.shade200,
                              Colors.yellow.shade800
                            ],
                          );
                        },
                      )
                    : Center(
                        child: CircularProgressIndicator(
                            color: Colors.yellow.shade800),
                      );
              },
            ),
          );
  }
}
