import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 2. Gráfico de barras agrupadas: valoraciones positivas vs negativas.
class GraficoBarrasAgrupadas extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBarrasAgrupadas({super.key, required this.videoJuegos});

  List<charts.Series<VideoJuego, String>> _crearSeries() {
    return [
      charts.Series<VideoJuego, String>(
        id: 'Positivas',
        domainFn: (VideoJuego juego, _) => juego.nombreCorto,
        measureFn: (VideoJuego juego, _) => juego.valoracionesPositivas,
        data: videoJuegos,
        colorFn: (_, _) => charts.MaterialPalette.green.shadeDefault,
      ),
      charts.Series<VideoJuego, String>(
        id: 'Negativas',
        domainFn: (VideoJuego juego, _) => juego.nombreCorto,
        measureFn: (VideoJuego juego, _) => juego.valoracionesNegativas,
        data: videoJuegos,
        colorFn: (_, _) => charts.MaterialPalette.red.shadeDefault,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Valoraciones positivas vs negativas',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: charts.BarChart(
            _crearSeries(),
            animate: true,
            barGroupingType: charts.BarGroupingType.grouped,
            behaviors: [charts.SeriesLegend()],
          ),
        ),
      ],
    );
  }
}
