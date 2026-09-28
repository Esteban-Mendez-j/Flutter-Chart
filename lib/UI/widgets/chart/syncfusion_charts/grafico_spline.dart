import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoSpline extends StatelessWidget {
  const GraficoSpline({super.key});

  @override
  Widget build(BuildContext context) {
    final datos = [
      _Dato(2019, 45),
      _Dato(2020, 60),
      _Dato(2021, 52),
      _Dato(2022, 75),
      _Dato(2023, 68),
      _Dato(2024, 90),
    ];

    return SfCartesianChart(
      primaryXAxis: NumericAxis(title: AxisTitle(text: 'Año de lanzamiento')),
      primaryYAxis: NumericAxis(title: AxisTitle(text: 'Ventas (millones)')),
      series: <CartesianSeries<_Dato, int>>[
        SplineSeries<_Dato, int>(
          dataSource: datos,
          xValueMapper: (_Dato dato, _) => dato.x,
          yValueMapper: (_Dato dato, _) => dato.y,
          markerSettings: const MarkerSettings(isVisible: true),
        ),
      ],
    );
  }
}

class _Dato {
  final int x;
  final double y;

  _Dato(this.x, this.y);
}
