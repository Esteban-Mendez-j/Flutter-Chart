import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SfG6AreaSuave extends StatelessWidget {
  const SfG6AreaSuave({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_AreaData> data = [
      _AreaData('Ene', 10),
      _AreaData('Feb', 25),
      _AreaData('Mar', 18),
      _AreaData('Abr', 30),
      _AreaData('May', 22),
    ];

    return SfCartesianChart(
      primaryXAxis: const CategoryAxis(),
      series: <CartesianSeries<_AreaData, String>>[
        SplineAreaSeries<_AreaData, String>(
          dataSource: data,
          xValueMapper: (_AreaData data, _) => data.x,
          yValueMapper: (_AreaData data, _) => data.y,
          color: Colors.blueAccent.withOpacity(0.4),
          borderColor: Colors.blue,
          borderWidth: 2,
        ),
      ],
    );
  }
}

class _AreaData {
  _AreaData(this.x, this.y);
  final String x;
  final double y;
}
