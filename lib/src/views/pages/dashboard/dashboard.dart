import 'package:flutter/material.dart';
import 'package:mood_diary_app_with_flutter/src/data/helpers/mood_data/mood_data.dart';
import 'package:mood_diary_app_with_flutter/src/data/local/dbhelper.dart';
import 'package:mood_diary_app_with_flutter/src/models/mood_card/mood_card.dart';
import 'package:mood_diary_app_with_flutter/src/views/widgets/mood_card/mood_card_widget.dart';
import 'package:mood_diary_app_with_flutter/src/views/widgets/statistic_mood_card/statistic_mood_card.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

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

    // return Scaffold(
    //   appBar: AppBar(
    //     elevation: 0,
    //   ),
    //   body: Column(
    //     children: [
    //       const SizedBox(height: 30),
    //       StatisticMoodCard(
    //         day: '11',
    //         dayOfWeek: 'Monday',
    //         moodImage: 'assets/smile.gif',
    //         colors: colors,
    //       ),

    //     ],
    //   ),
    return loader
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            body: FutureBuilder<List>(
                future: DBHelper.getData('user_moods'),
                // initialData: const [],
                builder: (context, snapshot) {
                  print('debug:> ${snapshot.data?.length}');

                  return snapshot.hasData
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length,
                          itemBuilder: (_, index) {
                            var imageString = snapshot.data![index]['actImage'];
                            List<String> img = ['.'];
                            // List<String> name =
                            //     snapshot.data![index]['actName'].split('_');
                            // Provider.of<MoodCard>(_, listen: false)
                            //     .actiName
                            //     .addAll(name);
                            // Provider.of<MoodCard>(_, listen: false).data.add(
                            //     MoodData(
                            //         moodno: snapshot.data![index]['mood'] ==
                            //                 'Angry'
                            //             ? 1
                            //             : snapshot.data![index]['mood'] ==
                            //                     'Happy'
                            //                 ? 2
                            //                 : snapshot.data![index]['mood'] ==
                            //                         'Sad'
                            //                     ? 3
                            //                     : snapshot.data![index]
                            //                                 ['mood'] ==
                            //                             'Surprised'
                            //                         ? 4
                            //                         : snapshot.data![index]
                            //                                     ['mood'] ==
                            //                                 'Loving'
                            //                             ? 5
                            //                             : snapshot.data![index]
                            //                                         ['mood'] ==
                            //                                     'Scared'
                            //                                 ? 6
                            //                                 : 7,
                            //         date: snapshot.data?[index]['date'],
                            //         barColor: snapshot.data![index]['mood'] ==
                            //                 'Angry'
                            //             ? charts.ColorUtil.fromDartColor(
                            //                 Colors.red)
                            //             : snapshot.data![index]['mood'] ==
                            //                     'Happy'
                            //                 ? charts.ColorUtil.fromDartColor(Colors.blue)
                            //                 : snapshot.data![index]['mood'] == 'Sad'
                            //                     ? charts.ColorUtil.fromDartColor(Colors.green)
                            //                     : snapshot.data![index]['mood'] == 'Surprised'
                            //                         ? charts.ColorUtil.fromDartColor(Colors.pink)
                            //                         : snapshot.data![index]['mood'] == 'Loving'
                            //                             ? charts.ColorUtil.fromDartColor(Colors.purple)
                            //                             : snapshot.data![index]['mood'] == 'Scared'
                            //                                 ? charts.ColorUtil.fromDartColor(Colors.black)
                            //                                 : charts.ColorUtil.fromDartColor(Colors.white)));
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
                            // MoodOfDay(
                            //   image: snapshot.data![index]['image'],
                            //   mood: snapshot.data![index]['mood'],
                            //   dateTime: snapshot.data?[index]['dateTime'],
                            //   a: name,
                            //   b: img,
                            // );
                          },
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        );
                }),
          );
  }
}
