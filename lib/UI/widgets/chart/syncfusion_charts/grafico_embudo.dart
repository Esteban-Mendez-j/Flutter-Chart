import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

/// Embudo (Funnel): distinto de "Pirámide" (que ya está hecha). Usa el
/// widget SfFunnelChart en vez de SfCartesianChart, y muestra cómo el
/// puntaje "reduce" el número de juegos que lo alcanzan.
class GraficoEmbudo extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoEmbudo({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    // Contamos cuántos juegos superan cada umbral de puntaje, simulando
    // un embudo de "calidad": todos -> buenos -> muy buenos -> excelentes.
    final datos = [
      _EtapaEmbudo('Todos los juegos', videoJuegos.length.toDouble()),
      _EtapaEmbudo(
        'Puntaje > 6',
        videoJuegos.where((j) => j.puntaje > 6).length.toDouble(),
      ),
      _EtapaEmbudo(
        'Puntaje > 7.5',
        videoJuegos.where((j) => j.puntaje > 7.5).length.toDouble(),
      ),
      _EtapaEmbudo(
        'Puntaje > 9',
        videoJuegos.where((j) => j.puntaje > 9).length.toDouble(),
      ),
    ];

    return SfFunnelChart(
      title: ChartTitle(text: 'Embudo de calidad de los videojuegos'),
      legend: const Legend(isVisible: true, position: LegendPosition.bottom),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: FunnelSeries<_EtapaEmbudo, String>(
        dataSource: datos,
        xValueMapper: (_EtapaEmbudo e, _) => e.etapa,
        yValueMapper: (_EtapaEmbudo e, _) => e.cantidad,
        dataLabelSettings: const DataLabelSettings(isVisible: true),
      ),
    );
  }
}

class _EtapaEmbudo {
  final String etapa;
  final double cantidad;

  _EtapaEmbudo(this.etapa, this.cantidad);
}
