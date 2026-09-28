import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoAreaApilada extends StatelessWidget {
  const GraficoAreaApilada({super.key});

  @override
  Widget build(BuildContext context) {
    final datos = [
      _Dato('Ene', 40, 20, 10),
      _Dato('Feb', 45, 25, 15),
      _Dato('Mar', 50, 30, 18),
      _Dato('Abr', 60, 35, 22),
      _Dato('May', 65, 40, 25),
      _Dato('Jun', 75, 45, 30),
    ];

    return SfCartesianChart(
      primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Mes')),
      primaryYAxis: NumericAxis(title: AxisTitle(text: 'Jugadores activos')),
      legend: const Legend(isVisible: true),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CartesianSeries<_Dato, String>>[
        StackedAreaSeries<_Dato, String>(
          name: 'PC',
          dataSource: datos,
          xValueMapper: (_Dato dato, _) => dato.x,
          yValueMapper: (_Dato dato, _) => dato.pc,
        ),
        StackedAreaSeries<_Dato, String>(
          name: 'Consola',
          dataSource: datos,
          xValueMapper: (_Dato dato, _) => dato.x,
          yValueMapper: (_Dato dato, _) => dato.consola,
        ),
        StackedAreaSeries<_Dato, String>(
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
