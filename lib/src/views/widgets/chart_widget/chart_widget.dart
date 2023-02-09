import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mood_diary_app_with_flutter/src/models/data_item/data_item.dart';

// ignore: must_be_immutable
class ChartWidget extends StatelessWidget {
  ChartWidget({Key? key, required this.dataList}) : super(key: key);
  List<DataItem> dataList;
  @override
  Widget build(BuildContext context) {
    return DonutChart(dataList: dataList);
  }
}

class DonutChart extends StatefulWidget {
  const DonutChart({
    Key? key,
    required this.dataList,
  }) : super(key: key);

  final List<DataItem> dataList;
  @override
  State<DonutChart> createState() => _DonutChartState();
}

class _DonutChartState extends State<DonutChart> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DonutChartPainter(dataList: widget.dataList),
      child: Container(),
    );
  }
}

final linePaint = Paint()
  ..color = Colors.white
  ..strokeWidth = 3.0
  ..style = PaintingStyle.stroke;

final midPaint = Paint()
  ..color = Colors.white
  ..style = PaintingStyle.fill;
const textFieldTextBigStyle = TextStyle(
  color: Colors.black26,
  fontWeight: FontWeight.bold,
  fontSize: 25,
);

const labelStyle = TextStyle(
  color: Colors.black26,
  fontSize: 13,
);

// ignore: must_be_immutable
class DonutChartPainter extends CustomPainter {
  DonutChartPainter({Key? key, required this.dataList});
  List<DataItem> dataList;
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2.0, size.height / 2.0);
    final radius = size.width * 0.9;
    var startAngle = 0.0;
    final rect = Rect.fromCenter(center: center, width: radius, height: radius);
    startAngle = 0.0;
    for (var data in dataList) {
      final sweepAngle = data.value * 360.0 * pi / 180.0;
      drawSector(data, canvas, rect, startAngle);
      drawLines(radius, startAngle, center, canvas);

      startAngle += sweepAngle;
    }

    startAngle = 0.0;
    for (var data in dataList) {
      final sweepAngle = data.value * 360.0 * pi / 180.0;
      drawLabels(canvas, center, radius, startAngle, sweepAngle, data.label);
      startAngle += sweepAngle;
    }

    canvas.drawCircle(center, radius * 0.25, midPaint);
    drawTextCentered(canvas, center, 'Diary Moods Graphic',
        textFieldTextBigStyle, radius * 0.6);
  }

  void drawLines(
      double radius, double startAngle, Offset center, Canvas canvas) {
    final dx = radius / 2.0 * cos(startAngle);
    final dy = radius / 2.0 * sin(startAngle);

    final p2 = center + Offset(dx, dy);

    canvas.drawLine(center, p2, linePaint);
  }

  void drawLabels(Canvas canvas, Offset center, double radius,
      double startAngle, double sweepAngle, String label) {
    final r = radius * 0.35;
    final dx = r * cos(startAngle + sweepAngle / 2.0);
    final dy = r * sin(startAngle + sweepAngle / 2.0);
    final position = center + Offset(dx, dy);
    drawTextCentered(canvas, position, label, labelStyle, 100);
  }

  TextPainter measureText(
      String s, TextStyle style, double maxWidth, TextAlign align) {
    final span = TextSpan(text: s, style: style);
    final txtPaint = TextPainter(
      text: span,
      textAlign: align,
      textDirection: TextDirection.ltr,
    );

    txtPaint.layout(minWidth: 0, maxWidth: maxWidth);

    return txtPaint;
  }

  Size drawTextCentered(Canvas canvas, Offset position, String txt,
      TextStyle style, double maxWidth) {
    final txtPaint = measureText(txt, style, maxWidth, TextAlign.center);
    final pos =
        position + Offset(-txtPaint.width / 2.0, -txtPaint.height / 2.0);

    txtPaint.paint(canvas, pos);

    return txtPaint.size;
  }

  double drawSector(
      DataItem data, Canvas canvas, Rect rect, double startAngle) {
    final sweepAngle = data.value * 360.0 * pi / 180.0;
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = data.color;
    canvas.drawArc(rect, startAngle, sweepAngle, true, paint);
    return sweepAngle;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
