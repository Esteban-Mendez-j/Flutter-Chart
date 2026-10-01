import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoAreaEscalonada extends StatelessWidget {
  const GraficoAreaEscalonada({super.key});

  @override
  Widget build(BuildContext context) {
    final datos = [
      _Dato('Ene', 120),
      _Dato('Feb', 120),
      _Dato('Mar', 180),
      _Dato('Abr', 150),
      _Dato('May', 240),
      _Dato('Jun', 210),
      _Dato('Jul', 300),
    ];

    return SfCartesianChart(
      primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Mes')),
      primaryYAxis: NumericAxis(title: AxisTitle(text: 'Precio (USD)')),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CartesianSeries<_Dato, String>>[
        StepAreaSeries<_Dato, String>(
          name: 'Precio',
          dataSource: datos,
          xValueMapper: (_Dato dato, _) => dato.x,
          yValueMapper: (_Dato dato, _) => dato.y,
          opacity: 0.6,
          borderWidth: 2,
          borderColor: Colors.lightBlueAccent,
        ),
      ],
    );
  }
}

class _Dato {
  final String x;
  final double y;

  _Dato(this.x, this.y);
}
