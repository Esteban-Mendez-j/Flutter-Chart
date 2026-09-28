import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoLineaBarraHorizontal extends StatelessWidget {
  const GraficoLineaBarraHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final datos = [
      _Dato('Minecraft', 95, 80),
      _Dato('GTA V', 85, 72),
      _Dato('Witcher 3', 75, 65),
      _Dato('Cyberpunk 2077', 68, 58),
      _Dato('Elden Ring', 90, 85),
    ];

    return SfCartesianChart(
      primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Videojuego')),
      primaryYAxis: NumericAxis(
        title: AxisTitle(text: 'Puntuación'),
        minimum: 0,
        maximum: 100,
        interval: 20,
      ),
      legend: const Legend(isVisible: true),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CartesianSeries<_Dato, String>>[
        BarSeries<_Dato, String>(
          name: 'Ventas',
          dataSource: datos,
          xValueMapper: (_Dato dato, _) => dato.nombre,
          yValueMapper: (_Dato dato, _) => dato.ventas,
        ),
        LineSeries<_Dato, String>(
          name: 'Puntuación',
          dataSource: datos,
          xValueMapper: (_Dato dato, _) => dato.nombre,
          yValueMapper: (_Dato dato, _) => dato.puntuacion,
          markerSettings: const MarkerSettings(isVisible: true),
        ),
      ],
    );
  }
}

class _Dato {
  final String nombre;
  final double ventas;
  final double puntuacion;

  _Dato(this.nombre, this.ventas, this.puntuacion);
}
