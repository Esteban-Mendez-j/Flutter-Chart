import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoDispersion extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoDispersion({super.key, required this.videoJuegos});

  static const Map<String, Color> _coloresCategorias = {
    'Sandbox': Colors.green,
    'Acción': Colors.red,
    'RPG': Colors.purple,
    'Aventura': Colors.orange,
    'Battle Royale': Colors.cyan,
    'Casual': Colors.yellow,
    'MOBA': Colors.blue,
    'Shooter': Colors.brown,
    'Deportes': Colors.teal,
    'Estrategia': Colors.indigo,
  };

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(text: 'Relación entre precio y puntaje'),

      primaryXAxis: NumericAxis(title: AxisTitle(text: 'Precio (USD)')),

      primaryYAxis: NumericAxis(
        title: AxisTitle(text: 'Puntaje'),
        minimum: 0,
        maximum: 10,
      ),

      tooltipBehavior: TooltipBehavior(enable: true),

      series: <CartesianSeries<VideoJuego, double>>[
        ScatterSeries<VideoJuego, double>(
          dataSource: videoJuegos,

          xValueMapper: (VideoJuego juego, _) => juego.precio,

          yValueMapper: (VideoJuego juego, _) => juego.puntaje,

          pointColorMapper: (VideoJuego juego, _) =>
              _coloresCategorias[juego.categoria] ?? Colors.grey,

          name: 'Videojuegos',

          markerSettings: const MarkerSettings(height: 10, width: 10),

          enableTooltip: true,
        ),
      ],
    );
  }
}
