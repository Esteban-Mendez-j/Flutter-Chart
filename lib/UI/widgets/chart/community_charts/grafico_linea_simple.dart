import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/historial_mensual.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 10. Gráfico de línea simple: evolución mensual de jugadores activos.
class GraficoLineaSimple extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoLineaSimple({super.key, required this.videoJuegos});

  // LineChart en esta librería solo admite dominio numérico, así que usamos
  // el índice del mes (0, 1, 2...) y mostramos el periodo real en el eje.
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
    final periodos = videoJuegos.first.historialMensual
        .map((h) => h.periodo)
        .toList();

    return Column(
      children: [
        Text(
          'Jugadores activos por mes: ${videoJuegos.first.nombre}',
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
