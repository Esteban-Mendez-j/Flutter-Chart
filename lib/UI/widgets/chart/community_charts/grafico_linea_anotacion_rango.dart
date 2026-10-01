import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/historial_mensual.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 29. Línea con anotación de rango: la franja sombreada resalta los meses
/// alrededor del pico de jugadores activos.
class GraficoLineaAnotacionRango extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoLineaAnotacionRango({super.key, required this.videoJuegos});

  List<charts.Series<HistorialMensual, int>> _crearSeries() {
    final juego = videoJuegos.first;
    return [
      charts.Series<HistorialMensual, int>(
        id: 'Jugadores activos',
        domainFn: (HistorialMensual h, index) => index ?? 0,
        measureFn: (HistorialMensual h, _) => h.jugadoresActivos,
        data: juego.historialMensual,
        colorFn: (_, _) => charts.MaterialPalette.blue.shadeDefault,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final historial = videoJuegos.first.historialMensual;
    final periodos = historial.map((h) => h.periodo).toList();

    // Mes del pico y un mes a cada lado.
    var indicePico = 0;
    for (var i = 0; i < historial.length; i++) {
      if (historial[i].jugadoresActivos >
          historial[indicePico].jugadoresActivos) {
        indicePico = i;
      }
    }
    final inicio = indicePico > 0 ? indicePico - 1 : 0;
    final fin = indicePico < historial.length - 1
        ? indicePico + 1
        : historial.length - 1;

    return Column(
      children: [
        Text(
          'Franja sombreada: pico de ${videoJuegos.first.nombre}',
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: charts.LineChart(
            _crearSeries(),
            animate: true,
            defaultRenderer: charts.LineRendererConfig(includePoints: true),
            domainAxis: charts.NumericAxisSpec(
              tickFormatterSpec: charts.BasicNumericTickFormatterSpec((
                num? value,
              ) {
                final i = value?.toInt() ?? 0;
                return (i >= 0 && i < periodos.length) ? periodos[i] : '';
              }),
            ),
            behaviors: [
              charts.RangeAnnotation([
                charts.RangeAnnotationSegment(
                  inicio,
                  fin,
                  charts.RangeAnnotationAxisType.domain,
                  color: charts.MaterialPalette.gray.shade700,
                ),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
