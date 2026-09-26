import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SfG5Radial extends StatelessWidget {
  const SfG5Radial({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_RadialData> data = [
      _RadialData('Meta A', 100, Colors.teal),
      _RadialData('Meta B', 75, Colors.orange),
      _RadialData('Meta C', 50, Colors.purple),
    ];

    return SfCircularChart(
      series: <CircularSeries<_RadialData, String>>[
        RadialBarSeries<_RadialData, String>(
          dataSource: data,
          xValueMapper: (_RadialData data, _) => data.x,
          yValueMapper: (_RadialData data, _) => data.y,
          pointColorMapper: (_RadialData data, _) => data.color,
          maximumValue: 100,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }
}

class _RadialData {
  _RadialData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}