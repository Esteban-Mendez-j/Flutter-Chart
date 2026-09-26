import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 9. Bar Target Line Chart: compara el puntaje de cada juego contra una
/// línea objetivo fija de calidad (8.5).
class GraficoBarraLineaObjetivo extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBarraLineaObjetivo({super.key, required this.videoJuegos});

  List<charts.Series<VideoJuego, String>> _crearSeries() {
    return [
      charts.Series<VideoJuego, String>(
        id: 'Puntaje',
        domainFn: (VideoJuego juego, _) => juego.nombre,
        measureFn: (VideoJuego juego, _) => juego.puntaje,
        data: videoJuegos,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      ),
      charts.Series<VideoJuego, String>(
        id: 'Objetivo (8.5)',
        domainFn: (VideoJuego juego, _) => juego.nombre,
        measureFn: (_, __) => 8.5,
        data: videoJuegos,
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      )..setAttribute(charts.rendererIdKey, 'objetivo'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Puntaje vs objetivo de calidad (8.5)',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: charts.BarChart(
            _crearSeries(),
            animate: true,
            barGroupingType: charts.BarGroupingType.grouped,
            customSeriesRenderers: [
              charts.BarTargetLineRendererConfig<String>(
                customRendererId: 'objetivo',
                groupingType: charts.BarGroupingType.grouped,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
