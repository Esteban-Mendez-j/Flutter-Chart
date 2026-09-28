import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoBarrasApiladas extends StatelessWidget {
  const GraficoBarrasApiladas({super.key});

  @override
  Widget build(BuildContext context) {
    final datos = [
      _Dato('2019', 40, 25, 15),
      _Dato('2020', 50, 30, 20),
      _Dato('2021', 60, 35, 25),
      _Dato('2022', 70, 40, 30),
      _Dato('2023', 80, 45, 35),
    ];

    return SfCartesianChart(
      primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Año')),
      primaryYAxis: NumericAxis(title: AxisTitle(text: 'Ventas (millones)')),
      legend: const Legend(isVisible: true),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CartesianSeries<_Dato, String>>[
        StackedBarSeries<_Dato, String>(
          name: 'PC',
          dataSource: datos,
          xValueMapper: (_Dato dato, _) => dato.x,
          yValueMapper: (_Dato dato, _) => dato.pc,
        ),
        StackedBarSeries<_Dato, String>(
          name: 'Consola',
          dataSource: datos,
          xValueMapper: (_Dato dato, _) => dato.x,
          yValueMapper: (_Dato dato, _) => dato.consola,
        ),
        StackedBarSeries<_Dato, String>(
          name: 'Móvil',
          dataSource: datos,
          xValueMapper: (_Dato dato, _) => dato.x,
          yValueMapper: (_Dato dato, _) => dato.movil,
        ),
      ],
    );
  }
}

class _Dato {
  final String x;
  final double pc;
  final double consola;
  final double movil;

  _Dato(this.x, this.pc, this.consola, this.movil);
}
