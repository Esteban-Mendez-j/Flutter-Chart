import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/historial_mensual.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 12. Varias series de línea en un mismo gráfico: compara la evolución de
/// jugadores activos entre 3 videojuegos.
class GraficoLineasMultiples extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoLineasMultiples({super.key, required this.videoJuegos});

  List<charts.Series<HistorialMensual, int>> _crearSeries() {
    final juegos = videoJuegos.take(3).toList();
    final colores = [
      charts.MaterialPalette.blue.shadeDefault,
      charts.MaterialPalette.red.shadeDefault,
      charts.MaterialPalette.green.shadeDefault,
    ];

    return List.generate(juegos.length, (i) {
      final juego = juegos[i];
      return charts.Series<HistorialMensual, int>(
        id: juego.nombre,
        domainFn: (HistorialMensual h, index) => index ?? 0,
        measureFn: (HistorialMensual h, _) => h.jugadoresActivos,
        data: juego.historialMensual,
        colorFn: (_, _) => colores[i],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Todos los juegos comparten los mismos periodos, así que tomamos los
    // del primero para las etiquetas del eje.
    final periodos = videoJuegos.first.historialMensual
        .map((h) => h.periodo)
        .toList();

    return Column(
      children: [
        const Text(
          'Jugadores activos: Comparacion entre juegos',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: charts.LineChart(
            _crearSeries(),
            animate: true,
            behaviors: [charts.SeriesLegend()],
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
