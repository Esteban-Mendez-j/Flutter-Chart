import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoLineasApiladas extends StatelessWidget {
  const GraficoLineasApiladas({super.key});

  @override
  Widget build(BuildContext context) {
    final datos = [
      _Dato('Ene', 30, 20, 10),
      _Dato('Feb', 35, 24, 14),
      _Dato('Mar', 40, 28, 18),
      _Dato('Abr', 38, 30, 22),
      _Dato('May', 46, 34, 26),
      _Dato('Jun', 52, 38, 30),
    ];

    return SfCartesianChart(
      primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Mes')),
      primaryYAxis: NumericAxis(title: AxisTitle(text: 'Descargas (miles)')),
      legend: const Legend(isVisible: true),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CartesianSeries<_Dato, String>>[
        StackedLineSeries<_Dato, String>(
          name: 'Acción',
          dataSource: datos,
          xValueMapper: (_Dato dato, _) => dato.x,
          yValueMapper: (_Dato dato, _) => dato.accion,
          markerSettings: const MarkerSettings(isVisible: true),
        ),
        StackedLineSeries<_Dato, String>(
          name: 'Aventura',
          dataSource: datos,
          xValueMapper: (_Dato dato, _) => dato.x,
          yValueMapper: (_Dato dato, _) => dato.aventura,
          markerSettings: const MarkerSettings(isVisible: true),
        ),
        StackedLineSeries<_Dato, String>(
          name: 'Estrategia',
          dataSource: datos,
          xValueMapper: (_Dato dato, _) => dato.x,
          yValueMapper: (_Dato dato, _) => dato.estrategia,
          markerSettings: const MarkerSettings(isVisible: true),
        ),
      ],
    );
  }
}

class _Dato {
  final String x;
  final double accion;
  final double aventura;
  final double estrategia;

  _Dato(this.x, this.accion, this.aventura, this.estrategia);
}
