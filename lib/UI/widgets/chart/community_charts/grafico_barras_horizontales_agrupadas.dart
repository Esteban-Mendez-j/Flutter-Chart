import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 24. Barras horizontales agrupadas: ventas vs jugadores activos (millones).
class GraficoBarrasHorizontalesAgrupadas extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBarrasHorizontalesAgrupadas({
    super.key,
    required this.videoJuegos,
  });

  List<charts.Series<VideoJuego, String>> _crearSeries() {
    return [
      charts.Series<VideoJuego, String>(
        id: 'Ventas (M)',
        domainFn: (VideoJuego juego, _) => juego.nombre,
        measureFn: (VideoJuego juego, _) => juego.numeroVentas / 1000000,
        data: videoJuegos,
        colorFn: (_, _) => charts.MaterialPalette.indigo.shadeDefault,
      ),
      charts.Series<VideoJuego, String>(
        id: 'Jugadores activos (M)',
        domainFn: (VideoJuego juego, _) => juego.nombre,
        measureFn: (VideoJuego juego, _) => juego.jugadoresActivos / 1000000,
        data: videoJuegos,
        colorFn: (_, _) => charts.MaterialPalette.lime.shadeDefault,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Ventas vs jugadores activos (millones)',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: charts.BarChart(
            _crearSeries(),
            animate: true,
            vertical: false,
            barGroupingType: charts.BarGroupingType.grouped,
            behaviors: [charts.SeriesLegend()],
          ),
        ),
      ],
    );
  }
}
