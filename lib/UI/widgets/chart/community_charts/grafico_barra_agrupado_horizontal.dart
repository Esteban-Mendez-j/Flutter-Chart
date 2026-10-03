import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 9. Gráfico de barras apiladas y agrupadas horizontal:
/// compara ventas y jugadores activos por videojuego.
class GraficoBarrasApiladasAgrupadasHorizontal extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBarrasApiladasAgrupadasHorizontal({
    super.key,
    required this.videoJuegos,
  });

  List<charts.Series<VideoJuego, String>> _crearSeries() {
    return [
      // VENTAS - segmento 1
      charts.Series<VideoJuego, String>(
        id: 'Ventas A',
        domainFn: (VideoJuego juego, _) => juego.nombreCorto,
        measureFn: (VideoJuego juego, _) => juego.numeroVentas * 0.60 / 1000000,
        data: videoJuegos,
        colorFn: (_, _) => charts.MaterialPalette.blue.shadeDefault,
        seriesCategory: 'Ventas',
      ),

      // VENTAS - segmento 2
      charts.Series<VideoJuego, String>(
        id: 'Ventas B',
        domainFn: (VideoJuego juego, _) => juego.nombreCorto,
        measureFn: (VideoJuego juego, _) => juego.numeroVentas * 0.40 / 1000000,
        data: videoJuegos,
        colorFn: (_, _) => charts.MaterialPalette.indigo.shadeDefault,
        seriesCategory: 'Ventas',
      ),

      // JUGADORES - segmento 1
      charts.Series<VideoJuego, String>(
        id: 'Jugadores A',
        domainFn: (VideoJuego juego, _) => juego.nombreCorto,
        measureFn: (VideoJuego juego, _) =>
            juego.jugadoresActivos * 0.65 / 1000000,
        data: videoJuegos,
        colorFn: (_, _) => charts.MaterialPalette.deepOrange.shadeDefault,
        seriesCategory: 'Jugadores',
      ),

      // JUGADORES - segmento 2
      charts.Series<VideoJuego, String>(
        id: 'Jugadores B',
        domainFn: (VideoJuego juego, _) => juego.nombreCorto,
        measureFn: (VideoJuego juego, _) =>
            juego.jugadoresActivos * 0.35 / 1000000,
        data: videoJuegos,
        colorFn: (_, _) => charts.MaterialPalette.red.shadeDefault,
        seriesCategory: 'Jugadores',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) {
      return const Center(child: Text('No hay datos disponibles'));
    }

    return Column(
      children: [
        const Text(
          'Ventas y jugadores activos por videojuego',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 10),

        Expanded(
          child: charts.BarChart(
            _crearSeries(),
            animate: true,
            vertical: false,
            barGroupingType: charts.BarGroupingType.groupedStacked,
            behaviors: [
              charts.SeriesLegend(
                position: charts.BehaviorPosition.bottom,
                horizontalFirst: true,
                cellPadding: const EdgeInsets.only(right: 6),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
