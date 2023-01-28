import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/mood_card/mood_card.dart';

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Row(children: [
      const CircularProgressIndicator(),
      Container(
          margin: const EdgeInsets.only(left: 5),
          child: const Text("Deleting entry...")),
    ]),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class MoodOfDay extends StatefulWidget {
  MoodOfDay({
    Key? key,
    this.dateTime,
    this.image,
    this.mood,
    this.a,
    this.b,
  }) : super(key: key);

  String? dateTime;
  String? mood;
  String? image;
  List<String>? a;
  List<String>? b;
  @override
  State<MoodOfDay> createState() => _MoodOfDayState();
}

class _MoodOfDayState extends State<MoodOfDay> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 100,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                child: Image.asset(widget.image.toString()),
                height: 45,
                width: 45,
              ),
              SizedBox(width: 15),
              Text(
                widget.mood.toString(),
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Text(
                widget.dateTime ?? 'nothing',
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              SizedBox(width: 30),
              IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    Provider.of<MoodCard>(context, listen: false).isloading =
                        true;
                    await Provider.of<MoodCard>(context, listen: false)
                        .deletePlaces(widget.dateTime.toString());
                    Provider.of<MoodCard>(context, listen: false).isloading =
                        false;
                  })
            ],
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                SizedBox(width: 80),
                ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.a!.length.toInt(),
                    itemBuilder: (context, index) {
                      return Row(
                        children: <Widget>[
                          Image.asset(widget.a![index]),
                          SizedBox(width: 25)
                        ],
                      );
                    }),
              ],
            ),
          ),
          SizedBox(width: 50),
          Expanded(
            child: Row(
              children: <Widget>[
                SizedBox(width: 80),
                ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.b!.length.toInt(),
                    itemBuilder: (context, index) {
                      return Row(
                        children: <Widget>[
                          Text(
                            widget.b![index] ?? 'nothinng',
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          SizedBox(width: 10)
                        ],
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
