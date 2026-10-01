import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoAreaApilada100 extends StatelessWidget {
  const GraficoAreaApilada100({super.key});

  @override
  Widget build(BuildContext context) {
    final datos = [
      _Dato('2020', 40, 35, 25),
      _Dato('2021', 38, 36, 26),
      _Dato('2022', 35, 38, 27),
      _Dato('2023', 32, 38, 30),
      _Dato('2024', 30, 37, 33),
      _Dato('2025', 28, 36, 36),
    ];

    return SfCartesianChart(
      primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Año')),
      primaryYAxis: NumericAxis(
        title: AxisTitle(text: 'Cuota de jugadores (%)'),
      ),
      legend: const Legend(isVisible: true),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CartesianSeries<_Dato, String>>[
        StackedArea100Series<_Dato, String>(
          name: 'PC',
          dataSource: datos,
          xValueMapper: (_Dato dato, _) => dato.x,
          yValueMapper: (_Dato dato, _) => dato.pc,
        ),
        StackedArea100Series<_Dato, String>(
          name: 'Consola',
          dataSource: datos,
          xValueMapper: (_Dato dato, _) => dato.x,
          yValueMapper: (_Dato dato, _) => dato.consola,
        ),
        StackedArea100Series<_Dato, String>(
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
