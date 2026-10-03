import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 3. Gráfico de barras apiladas: ingresos vs costo de desarrollo (en millones).
class GraficoBarrasApiladas extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBarrasApiladas({super.key, required this.videoJuegos});

  List<charts.Series<VideoJuego, String>> _crearSeries() {
    return [
      charts.Series<VideoJuego, String>(
        id: 'Ingresos (M)',
        domainFn: (VideoJuego juego, _) => juego.nombreCorto,
        measureFn: (VideoJuego juego, _) => juego.ingresosEstimados / 1000000,
        data: videoJuegos,
        colorFn: (_, _) => charts.MaterialPalette.cyan.shadeDefault,
      ),
      charts.Series<VideoJuego, String>(
        id: 'Costo desarrollo (M)',
        domainFn: (VideoJuego juego, _) => juego.nombreCorto,
        measureFn: (VideoJuego juego, _) => juego.costoDesarrollo / 1000000,
        data: videoJuegos,
        colorFn: (_, _) => charts.MaterialPalette.deepOrange.shadeDefault,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Ingresos vs costo de desarrollo (millones USD)',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: charts.BarChart(
            _crearSeries(),
            animate: true,
            barGroupingType: charts.BarGroupingType.stacked,
            behaviors: [charts.SeriesLegend()],
          ),
        ),
      ],
    );
  }
}
