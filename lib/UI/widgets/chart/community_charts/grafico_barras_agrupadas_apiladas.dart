import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/historial_mensual.dart';
import 'package:graficos/data/model/videojuego.dart';

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
    if (videoJuegos.length < 2) {
      return const Center(child: Text('Se necesitan al menos 2 videojuegos'));
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
      child: charts.BarChart(
        _crearSeries(),
        animate: true,

        barGroupingType: charts.BarGroupingType.groupedStacked,

        domainAxis: charts.OrdinalAxisSpec(
          renderSpec: charts.SmallTickRendererSpec(
            labelStyle: const charts.TextStyleSpec(fontSize: 9),
            labelAnchor: charts.TickLabelAnchor.centered,
          ),

          // Evita mostrar todos los meses
          tickProviderSpec: charts.StaticOrdinalTickProviderSpec([
            charts.TickSpec('2025-10', label: 'Oct'),
            charts.TickSpec('2025-12', label: 'Dic'),
            charts.TickSpec('2026-02', label: 'Feb'),
            charts.TickSpec('2026-04', label: 'Abr'),
            charts.TickSpec('2026-06', label: 'Jun'),
            charts.TickSpec('2026-08', label: 'Ago'),
          ]),
        ),

        behaviors: [
          charts.SeriesLegend(
            position: charts.BehaviorPosition.bottom,
            desiredMaxRows: 2,
            entryTextStyle: const charts.TextStyleSpec(fontSize: 9),
          ),
        ],
      ),
    );
  }
}
