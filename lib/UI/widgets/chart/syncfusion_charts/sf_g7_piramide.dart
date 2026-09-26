import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SfG7Piramide extends StatelessWidget {
  const SfG7Piramide({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_PyramidData> data = [
      _PyramidData('Nivel 1', 100),
      _PyramidData('Nivel 2', 80),
      _PyramidData('Nivel 3', 60),
      _PyramidData('Nivel 4', 40),
      _PyramidData('Nivel 5', 20),
    ];

    return SfPyramidChart(
      series: PyramidSeries<_PyramidData, String>(
        dataSource: data,
        xValueMapper: (_PyramidData data, _) => data.x,
        yValueMapper: (_PyramidData data, _) => data.y,
        dataLabelSettings: const DataLabelSettings(isVisible: true),
      ),
    );
  }
}

class _PyramidData {
  _PyramidData(this.x, this.y);
  final String x;
  final double y;
}