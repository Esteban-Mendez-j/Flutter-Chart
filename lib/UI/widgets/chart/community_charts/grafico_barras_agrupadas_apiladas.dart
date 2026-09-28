import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/historial_mensual.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 4. Gráfico de barras agrupadas + apiladas: compara valoraciones
/// positivas/negativas mes a mes entre dos videojuegos.
///
/// El truco de esta librería es "seriesCategory": las series que comparten
/// la misma categoría se apilan juntas, y cada categoría forma un grupo.
class GraficoBarrasAgrupadasApiladas extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBarrasAgrupadasApiladas({super.key, required this.videoJuegos});

  List<charts.Series<HistorialMensual, String>> _crearSeries() {
    final juegoA = videoJuegos[0];
    final juegoB = videoJuegos[1];

    return [
      charts.Series<HistorialMensual, String>(
        id: '${juegoA.nombre} +',
        seriesCategory: juegoA.nombre,
        domainFn: (HistorialMensual h, _) => h.periodo,
        measureFn: (HistorialMensual h, _) => h.valoracionesPositivas,
        data: juegoA.historialMensual,
        colorFn: (_, _) => charts.MaterialPalette.green.shadeDefault,
      ),
      charts.Series<HistorialMensual, String>(
        id: '${juegoA.nombre} -',
        seriesCategory: juegoA.nombre,
        domainFn: (HistorialMensual h, _) => h.periodo,
        measureFn: (HistorialMensual h, _) => h.valoracionesNegativas,
        data: juegoA.historialMensual,
        colorFn: (_, _) => charts.MaterialPalette.red.shadeDefault,
      ),
      charts.Series<HistorialMensual, String>(
        id: '${juegoB.nombre} +',
        seriesCategory: juegoB.nombre,
        domainFn: (HistorialMensual h, _) => h.periodo,
        measureFn: (HistorialMensual h, _) => h.valoracionesPositivas,
        data: juegoB.historialMensual,
        colorFn: (_, _) => charts.MaterialPalette.blue.shadeDefault,
      ),
      charts.Series<HistorialMensual, String>(
        id: '${juegoB.nombre} -',
        seriesCategory: juegoB.nombre,
        domainFn: (HistorialMensual h, _) => h.periodo,
        measureFn: (HistorialMensual h, _) => h.valoracionesNegativas,
        data: juegoB.historialMensual,
        colorFn: (_, _) => charts.MaterialPalette.purple.shadeDefault,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Valoraciones por mes: ${videoJuegos[0].nombre} vs ${videoJuegos[1].nombre}',
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: charts.BarChart(
            _crearSeries(),
            animate: true,
            barGroupingType: charts.BarGroupingType.groupedStacked,
            behaviors: [
              charts.SeriesLegend(
                position: charts.BehaviorPosition.bottom,
                desiredMaxRows: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
