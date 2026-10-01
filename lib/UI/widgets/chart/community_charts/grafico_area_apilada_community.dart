import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/historial_mensual.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 22. Gráfico de área apilada: ventas y jugadores activos (en miles) apilados
/// mes a mes para ver el total y la parte de cada serie.
class GraficoAreaApiladaCommunity extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoAreaApiladaCommunity({super.key, required this.videoJuegos});

  List<charts.Series<HistorialMensual, int>> _crearSeries() {
    final juego = videoJuegos.first;
    return [
      charts.Series<HistorialMensual, int>(
        id: 'Ventas (miles)',
        domainFn: (HistorialMensual h, index) => index ?? 0,
        measureFn: (HistorialMensual h, _) => h.ventas / 1000,
        data: juego.historialMensual,
        colorFn: (_, _) => charts.MaterialPalette.blue.shadeDefault,
      ),
      charts.Series<HistorialMensual, int>(
        id: 'Jugadores (miles)',
        domainFn: (HistorialMensual h, index) => index ?? 0,
        measureFn: (HistorialMensual h, _) => h.jugadoresActivos / 1000,
        data: juego.historialMensual,
        colorFn: (_, _) => charts.MaterialPalette.pink.shadeDefault,
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
          'Área apilada: ${videoJuegos.first.nombre}',
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: charts.LineChart(
            _crearSeries(),
            animate: true,
            defaultRenderer: charts.LineRendererConfig(
              includeArea: true,
              stacked: true,
            ),
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
