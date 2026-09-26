import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

/// Columnas 100% apiladas: muestra qué porcentaje de las valoraciones de
/// cada juego son positivas vs negativas (cada columna suma 100%).
class GraficoColumnas100 extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoColumnas100({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    final top5 = videoJuegos.take(5).toList();

    return SfCartesianChart(
      title: ChartTitle(
        text: '% de valoraciones positivas vs negativas por juego',
      ),
      primaryXAxis: const CategoryAxis(),
      primaryYAxis: NumericAxis(
        title: AxisTitle(text: 'Porcentaje'),
        labelFormat: '{value}%',
        minimum: 0,
        maximum: 100,
        interval: 20,
      ),
      tooltipBehavior: TooltipBehavior(enable: true),
      legend: const Legend(isVisible: true, position: LegendPosition.bottom),
      series: <CartesianSeries<VideoJuego, String>>[
        StackedColumn100Series<VideoJuego, String>(
          dataSource: top5,
          xValueMapper: (VideoJuego juego, _) => juego.nombre,
          yValueMapper: (VideoJuego juego, _) => juego.valoracionesPositivas,
          name: 'Positivas',
          color: Colors.green,
        ),
        StackedColumn100Series<VideoJuego, String>(
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