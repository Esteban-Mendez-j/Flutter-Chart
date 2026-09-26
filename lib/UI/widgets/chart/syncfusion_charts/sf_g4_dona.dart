import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SfG4Dona extends StatelessWidget {
  const SfG4Dona({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_DoughnutData> data = [
      _DoughnutData('iOS', 45),
      _DoughnutData('Android', 45),
      _DoughnutData('Web', 10),
    ];

    return SfCircularChart(
      series: <CircularSeries<_DoughnutData, String>>[
        DoughnutSeries<_DoughnutData, String>(
          dataSource: data,
          xValueMapper: (_DoughnutData data, _) => data.x,
          yValueMapper: (_DoughnutData data, _) => data.y,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }
}

class _DoughnutData {
  _DoughnutData(this.x, this.y);
  final String x;
  final double y;
}