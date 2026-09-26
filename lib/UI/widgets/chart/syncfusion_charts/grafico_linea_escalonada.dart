import 'package:flutter/material.dart';
import 'package:graficos/data/model/historial_mensual.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

/// Línea escalonada (Step Line): evolución de jugadores activos mes a mes.
/// A diferencia de una línea normal, une los puntos con segmentos rectos
/// horizontales y verticales, útil para mostrar cambios que ocurren en
/// momentos puntuales (no de forma gradual).
class GraficoLineaEscalonada extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoLineaEscalonada({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    final juego = videoJuegos.first;

    return SfCartesianChart(
      title: ChartTitle(text: 'Jugadores activos: ${juego.nombre}'),
      primaryXAxis: const CategoryAxis(title: AxisTitle(text: 'Mes')),
      primaryYAxis: NumericAxis(
        title: AxisTitle(text: 'Jugadores activos'),
      ),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CartesianSeries<HistorialMensual, String>>[
        StepLineSeries<HistorialMensual, String>(
          dataSource: juego.historialMensual,
          xValueMapper: (HistorialMensual h, _) => h.periodo,
          yValueMapper: (HistorialMensual h, _) => h.jugadoresActivos,
          name: 'Jugadores activos',
          color: Colors.deepPurple,
          markerSettings: const MarkerSettings(isVisible: true),
        ),
      ],
    );
  }
}
