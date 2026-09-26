import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

/// Columnas apiladas (Stacked Column): compara valoraciones positivas y
/// negativas de varios juegos, apiladas una sobre otra en cada columna.
class GraficoColumnasApiladas extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoColumnasApiladas({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    final top5 = videoJuegos.take(5).toList();

    return SfCartesianChart(
      title: ChartTitle(text: 'Valoraciones por videojuego (apiladas)'),
      primaryXAxis: const CategoryAxis(),
      primaryYAxis: NumericAxis(title: AxisTitle(text: 'Valoraciones')),
      tooltipBehavior: TooltipBehavior(enable: true),
      legend: const Legend(isVisible: true, position: LegendPosition.bottom),
      series: <CartesianSeries<VideoJuego, String>>[
        StackedColumnSeries<VideoJuego, String>(
          dataSource: top5,
          xValueMapper: (VideoJuego juego, _) => juego.nombre,
          yValueMapper: (VideoJuego juego, _) => juego.valoracionesPositivas,
          name: 'Positivas',
          color: Colors.green,
        ),
        StackedColumnSeries<VideoJuego, String>(
          dataSource: top5,
          xValueMapper: (VideoJuego juego, _) => juego.nombre,
          yValueMapper: (VideoJuego juego, _) => juego.valoracionesNegativas,
          name: 'Negativas',
          color: Colors.redAccent,
        ),
      ],
    );
  }
}
