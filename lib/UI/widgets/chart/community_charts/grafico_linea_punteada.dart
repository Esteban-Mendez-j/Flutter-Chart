import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/historial_mensual.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 13. Línea con patrón de guiones (dash pattern), útil para representar
/// proyecciones o datos estimados.
class GraficoLineaPunteada extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoLineaPunteada({super.key, required this.videoJuegos});

  List<charts.Series<HistorialMensual, int>> _crearSeries() {
    final juego = videoJuegos.first;
    return [
      charts.Series<HistorialMensual, int>(
        id: 'Ventas (proyección)',
        domainFn: (HistorialMensual h, index) => index ?? 0,
        measureFn: (HistorialMensual h, _) => h.ventas,
        data: juego.historialMensual,
        colorFn: (_, _) => charts.MaterialPalette.purple.shadeDefault,
        dashPatternFn: (_, _) => [4, 4],
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
          'Línea punteada: ventas de ${videoJuegos.first.nombre}',
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: charts.LineChart(
            _crearSeries(),
            animate: true,
            domainAxis: charts.NumericAxisSpec(
              tickFormatterSpec: charts.BasicNumericTickFormatterSpec((
                num? value,
              ) {
                final i = value?.toInt() ?? 0;
                return (i >= 0 && i < periodos.length) ? periodos[i] : '';
              }),
            ),
          ),
        ),
      ],
    );
  }
}
