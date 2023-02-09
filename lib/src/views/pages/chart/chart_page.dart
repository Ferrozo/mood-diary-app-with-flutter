import 'package:flutter/material.dart';
import 'package:mood_diary_app_with_flutter/src/models/data_item/data_item.dart';
import 'package:mood_diary_app_with_flutter/src/views/widgets/chart_widget/chart_widget.dart';

// ignore: must_be_immutable
class ChartPage extends StatelessWidget {
  ChartPage({Key? key}) : super(key: key);
  List<DataItem> dataList = [
    const DataItem(
        value: 0.125, label: 'Happy', color: Color.fromARGB(241, 250, 159, 23)),
    const DataItem(
        value: 0.125,
        label: 'Very Go',
        color: Color.fromARGB(175, 233, 159, 30)),
    const DataItem(
        value: 0.125,
        label: 'Excited',
        color: Color.fromARGB(198, 68, 137, 255)),
    const DataItem(
        value: 0.125, label: 'Calm', color: Color.fromARGB(240, 198, 255, 222)),
    DataItem(value: 0.125, label: 'Disappo', color: Colors.green[400]!),
    const DataItem(value: 0.125, label: 'Sad', color: Colors.yellow),
    DataItem(value: 0.125, label: 'Awful ', color: Colors.green[50]!),
    DataItem(value: 0.125, label: 'Not Go ', color: Colors.green[100]!),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            const Text('Graphic moods'),
            const Spacer(),
            IconButton(
                onPressed: () => Navigator.of(context).pushNamed('/dashboard'),
                icon: const Icon(
                  Icons.checklist_outlined,
                  color: Colors.white,
                ))
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: ChartWidget(
          dataList: dataList,
        ),
      ),
    );
  }
}
