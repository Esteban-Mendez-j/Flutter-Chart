import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

/// Barra horizontal: ingresos estimados por videojuego.
/// Distinto de "Columna" (que ya está hecha) porque usa BarSeries en vez
/// de ColumnSeries, mostrando las categorías en el eje vertical.
class GraficoBarraHorizontal extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBarraHorizontal({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    final top5 = videoJuegos.take(5).toList();

    return SfCartesianChart(
      title: ChartTitle(text: 'Ingresos estimados por videojuego'),
      primaryXAxis: const CategoryAxis(),
      primaryYAxis: NumericAxis(title: AxisTitle(text: 'Ingresos (M USD)')),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CartesianSeries<VideoJuego, String>>[
        BarSeries<VideoJuego, String>(
          dataSource: top5,
          xValueMapper: (VideoJuego juego, _) => juego.nombre,
          yValueMapper: (VideoJuego juego, _) =>
              juego.ingresosEstimados / 1000000,
          name: 'Ingresos (M)',
          color: Colors.indigo,
        ),
      ],
    );
  }
}
