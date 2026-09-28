import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoHilo extends StatelessWidget {
  const GraficoHilo({super.key});

  @override
  Widget build(BuildContext context) {
    final datos = [
      _Dato('Ene', 850, 420),
      _Dato('Feb', 920, 500),
      _Dato('Mar', 1050, 610),
      _Dato('Abr', 980, 550),
      _Dato('May', 1200, 700),
      _Dato('Jun', 1350, 800),
    ];

    return SfCartesianChart(
      primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Mes')),
      primaryYAxis: NumericAxis(title: AxisTitle(text: 'Jugadores activos')),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CartesianSeries<_Dato, String>>[
        HiloSeries<_Dato, String>(
          dataSource: datos,
          xValueMapper: (_Dato dato, _) => dato.x,
          lowValueMapper: (_Dato dato, _) => dato.low,
          highValueMapper: (_Dato dato, _) => dato.high,
        ),
      ],
    );
  }
}

class _Dato {
  final String x;
  final double high;
  final double low;

  _Dato(this.x, this.high, this.low);
}
