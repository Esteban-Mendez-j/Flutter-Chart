import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/historial_mensual.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 20. Combo Chart: combina barras (ventas) y una línea (ingresos) en un
/// mismo gráfico usando "customSeriesRenderers".
///
/// Nota: las ventas se dividen entre 1000 solo para acercar su escala a la
/// de los ingresos y que ambas series se vean bien en el mismo eje.
class GraficoComboBarraLinea extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoComboBarraLinea({super.key, required this.videoJuegos});

  List<charts.Series<HistorialMensual, String>> _crearSeries() {
    final juego = videoJuegos.first;
    return [
      charts.Series<HistorialMensual, String>(
        id: 'Ventas (miles)',
        domainFn: (HistorialMensual h, _) => h.periodo,
        measureFn: (HistorialMensual h, _) => h.ventas / 1000,
        data: juego.historialMensual,
        colorFn: (_, _) => charts.MaterialPalette.blue.shadeDefault,
      ),
      charts.Series<HistorialMensual, String>(
        id: 'Ingresos (M)',
        domainFn: (HistorialMensual h, _) => h.periodo,
        measureFn: (HistorialMensual h, _) => h.ingresos,
        data: juego.historialMensual,
        colorFn: (_, _) => charts.MaterialPalette.red.shadeDefault,
      )..setAttribute(charts.rendererIdKey, 'linea'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Combo barra + línea: ${videoJuegos.first.nombre}',
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: charts.OrdinalComboChart(
            _crearSeries(),
            animate: true,
            defaultRenderer: charts.BarRendererConfig<String>(),
            customSeriesRenderers: [
              charts.LineRendererConfig<String>(customRendererId: 'linea'),
            ],
            behaviors: [charts.SeriesLegend()],
          ),
        ),
      ],
    );
  }
}
