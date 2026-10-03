import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 10. Gráfico combinado de barras y línea:
/// compara ventas y jugadores activos por videojuego.
class GraficoComboBarraLinea extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoComboBarraLinea({super.key, required this.videoJuegos});

  List<charts.Series<VideoJuego, String>> _crearSeries() {
    // Serie de BARRAS
    final ventas = charts.Series<VideoJuego, String>(
      id: 'Ventas',
      domainFn: (VideoJuego juego, _) => juego.nombreCorto,
      measureFn: (VideoJuego juego, _) => juego.numeroVentas / 1000000,
      data: videoJuegos,
      colorFn: (_, _) => charts.MaterialPalette.blue.shadeDefault,
    );

    // Serie de LÍNEA
    final jugadores = charts.Series<VideoJuego, String>(
      id: 'Jugadores activos',
      domainFn: (VideoJuego juego, _) => juego.nombreCorto,
      measureFn: (VideoJuego juego, _) => juego.jugadoresActivos / 1000000,
      data: videoJuegos,
      colorFn: (_, _) => charts.MaterialPalette.deepOrange.shadeDefault,
    );

    // Indicamos que esta serie utilizará
    // el renderer de línea.
    jugadores.setAttribute(charts.rendererIdKey, 'lineRenderer');

    return [ventas, jugadores];
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
          child: charts.OrdinalComboChart(
            _crearSeries(),
            animate: true,

            // Renderer por defecto:
            // las series normales serán barras.
            defaultRenderer: charts.BarRendererConfig<String>(),

            // Renderer personalizado para la línea.
            customSeriesRenderers: [
              charts.LineRendererConfig<String>(
                customRendererId: 'lineRenderer',
                includePoints: true,
                radiusPx: 4,
                strokeWidthPx: 2,
              ),
            ],

            behaviors: [
              charts.SeriesLegend(
                position: charts.BehaviorPosition.bottom,
                horizontalFirst: true,
                cellPadding: const EdgeInsets.only(right: 8),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
