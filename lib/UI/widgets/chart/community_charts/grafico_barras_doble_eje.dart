import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 32. Barras con doble eje: ingresos (eje izquierdo, millones USD) y puntaje
/// (eje derecho, escala 0-10) porque tienen escalas muy distintas.
class GraficoBarrasDobleEje extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBarrasDobleEje({super.key, required this.videoJuegos});

  List<charts.Series<VideoJuego, String>> _crearSeries() {
    return [
      charts.Series<VideoJuego, String>(
        id: 'Ingresos (M)',
        domainFn: (VideoJuego juego, _) => juego.nombre,
        measureFn: (VideoJuego juego, _) => juego.ingresosEstimados / 1000000,
        data: videoJuegos,
        colorFn: (_, _) => charts.MaterialPalette.blue.shadeDefault,
      ),
      charts.Series<VideoJuego, String>(
        id: 'Puntaje (0-10)',
        domainFn: (VideoJuego juego, _) => juego.nombre,
        measureFn: (VideoJuego juego, _) => juego.puntaje,
        data: videoJuegos,
        colorFn: (_, _) => charts.MaterialPalette.deepOrange.shadeDefault,
      )..setAttribute(charts.measureAxisIdKey, 'secondaryMeasureAxisId'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Ingresos (izq.) y puntaje (der.)',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: charts.BarChart(
            _crearSeries(),
            animate: true,
            barGroupingType: charts.BarGroupingType.grouped,
            secondaryMeasureAxis: charts.NumericAxisSpec(
              tickProviderSpec: charts.BasicNumericTickProviderSpec(
                desiredTickCount: 5,
              ),
            ),
            behaviors: [charts.SeriesLegend()],
          ),
        ),
      ],
    );
  }
}
