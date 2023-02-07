import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({Key? key}) : super(key: key);

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
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: AspectRatio(
          aspectRatio: 1.0,
          child: PieChart(
            PieChartData(
              sections: data,
              centerSpaceRadius: 100,
              sectionsSpace: 20,
              centerSpaceColor: Colors.yellow.shade200,
              startDegreeOffset: -90,
              // read about it in the PieChartData section
            ),
            swapAnimationDuration:
                const Duration(milliseconds: 150), // Optional
            swapAnimationCurve: Curves.linear, // Optional
          ),
        ),
      ),
    );
  }
}

List<PieChartSectionData> data = [
  PieChartSectionData(title: 'Happy', color: Colors.orange),
  PieChartSectionData(title: 'Very Go', color: Colors.pink),
  PieChartSectionData(title: 'Excited', color: Colors.blueAccent),
  PieChartSectionData(title: 'Calm', color: Colors.white30),
  PieChartSectionData(title: 'Disappo', color: Colors.green[400]),
  PieChartSectionData(title: 'Sad', color: Colors.yellow),
  PieChartSectionData(title: 'Awful ', color: Colors.green[50]),
  PieChartSectionData(title: 'Not Go ', color: Colors.green[100]),
];
