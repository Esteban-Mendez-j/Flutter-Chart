import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/historial_mensual.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 21. Gráfico de área simple: evolución mensual de jugadores activos con el
/// espacio bajo la línea relleno.
class GraficoAreaSimple extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoAreaSimple({super.key, required this.videoJuegos});

  List<charts.Series<HistorialMensual, int>> _crearSeries() {
    final juego = videoJuegos.first;
    return [
      charts.Series<HistorialMensual, int>(
        id: 'Jugadores activos',
        domainFn: (HistorialMensual h, index) => index ?? 0,
        measureFn: (HistorialMensual h, _) => h.jugadoresActivos,
        data: juego.historialMensual,
        colorFn: (_, _) => charts.MaterialPalette.teal.shadeDefault,
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
          'Área: jugadores activos de ${videoJuegos.first.nombre}',
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: charts.LineChart(
            _crearSeries(),
            animate: true,
            defaultRenderer: charts.LineRendererConfig(includeArea: true),
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
