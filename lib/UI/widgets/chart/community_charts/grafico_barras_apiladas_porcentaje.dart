import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 28. Barras apiladas al 100%: porcentaje de valoraciones positivas y
/// negativas de cada juego (cada barra suma 100).
class GraficoBarrasApiladasPorcentaje extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBarrasApiladasPorcentaje({super.key, required this.videoJuegos});

  double _porcentajePositivo(VideoJuego j) {
    final total = j.valoracionesPositivas + j.valoracionesNegativas;
    return total == 0 ? 0 : j.valoracionesPositivas / total * 100;
  }

  List<charts.Series<VideoJuego, String>> _crearSeries() {
    return [
      charts.Series<VideoJuego, String>(
        id: 'Positivas (%)',
        domainFn: (VideoJuego juego, _) => juego.nombre,
        measureFn: (VideoJuego juego, _) => _porcentajePositivo(juego),
        data: videoJuegos,
        colorFn: (_, _) => charts.MaterialPalette.green.shadeDefault,
      ),
      charts.Series<VideoJuego, String>(
        id: 'Negativas (%)',
        domainFn: (VideoJuego juego, _) => juego.nombre,
        measureFn: (VideoJuego juego, _) => 100 - _porcentajePositivo(juego),
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
          'Valoraciones positivas vs negativas (%)',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: charts.BarChart(
            _crearSeries(),
            animate: true,
            barGroupingType: charts.BarGroupingType.stacked,
            primaryMeasureAxis: const charts.NumericAxisSpec(
              viewport: charts.NumericExtents(0, 100),
            ),
            behaviors: [charts.SeriesLegend()],
          ),
        ),
      ],
    );
  }
}
