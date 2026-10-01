import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 23. Barras horizontales apiladas: ingresos y costo de desarrollo apilados.
class GraficoBarrasHorizontalesApiladas extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBarrasHorizontalesApiladas({
    super.key,
    required this.videoJuegos,
  });

  List<charts.Series<VideoJuego, String>> _crearSeries() {
    return [
      charts.Series<VideoJuego, String>(
        id: 'Ingresos (M)',
        domainFn: (VideoJuego juego, _) => juego.nombre,
        measureFn: (VideoJuego juego, _) => juego.ingresosEstimados / 1000000,
        data: videoJuegos,
        colorFn: (_, _) => charts.MaterialPalette.green.shadeDefault,
      ),
      charts.Series<VideoJuego, String>(
        id: 'Costo desarrollo (M)',
        domainFn: (VideoJuego juego, _) => juego.nombre,
        measureFn: (VideoJuego juego, _) => juego.costoDesarrollo / 1000000,
        data: videoJuegos,
        colorFn: (_, _) => charts.MaterialPalette.yellow.shadeDefault,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Ingresos y costo apilados (millones USD)',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: charts.BarChart(
            _crearSeries(),
            animate: true,
            vertical: false,
            barGroupingType: charts.BarGroupingType.stacked,
            behaviors: [charts.SeriesLegend()],
          ),
        ),
      ],
    );
  }
}
