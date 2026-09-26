import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SfG3Pie extends StatelessWidget {
  const SfG3Pie({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_PieData> data = [
      _PieData('Frontend', 40),
      _PieData('Backend', 35),
      _PieData('DevOps', 25),
    ];

    return SfCircularChart(
      series: <CircularSeries<_PieData, String>>[
        PieSeries<_PieData, String>(
          dataSource: data,
          xValueMapper: (_PieData data, _) => data.x,
          yValueMapper: (_PieData data, _) => data.y,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }
}

class _PieData {
  _PieData(this.x, this.y);
  final String x;
  final double y;
}