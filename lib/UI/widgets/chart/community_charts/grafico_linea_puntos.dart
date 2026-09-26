import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/historial_mensual.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 11. Línea con puntos visibles en cada valor de la serie.
class GraficoLineaPuntos extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoLineaPuntos({super.key, required this.videoJuegos});

  List<charts.Series<HistorialMensual, int>> _crearSeries() {
    final juego = videoJuegos.first;
    return [
      charts.Series<HistorialMensual, int>(
        id: 'Ingresos mensuales (M)',
        domainFn: (HistorialMensual h, index) => index ?? 0,
        measureFn: (HistorialMensual h, _) => h.ingresos,
        data: juego.historialMensual,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final periodos = videoJuegos.first.historialMensual
        .map((h) => h.periodo)
        .toList();

    return Column(
      children: [
        Text(
          'Ingresos mensuales (M) con puntos: ${videoJuegos.first.nombre}',
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: charts.LineChart(
            _crearSeries(),
            animate: true,
            defaultRenderer: charts.LineRendererConfig(
              includePoints: true,
              radiusPx: 4,
            ),
            domainAxis: charts.NumericAxisSpec(
              tickFormatterSpec: charts.BasicNumericTickFormatterSpec(
                (num? value) {
                  final i = value?.toInt() ?? 0;
                  return (i >= 0 && i < periodos.length) ? periodos[i] : '';
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}