import 'package:flutter/material.dart';

class DataItem {
  const DataItem({
    required this.value,
    required this.label,
    required this.color,
  });
  final double value;
  final String label;
  final Color color;
}
