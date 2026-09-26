import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SfG2Columna extends StatelessWidget {
  const SfG2Columna({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_ChartData> data = [
      _ChartData('Colombia', 85),
      _ChartData('Chile', 65),
      _ChartData('México', 75),
      _ChartData('Perú', 50),
    ];

    return SfCartesianChart(
      primaryXAxis: const CategoryAxis(),
      series: <CartesianSeries<_ChartData, String>>[
        ColumnSeries<_ChartData, String>(
          dataSource: data,
          xValueMapper: (_ChartData data, _) => data.x,
          yValueMapper: (_ChartData data, _) => data.y,
          color: Colors.indigo,
        ),
      ],
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);
  final String x;
  final double y;
}