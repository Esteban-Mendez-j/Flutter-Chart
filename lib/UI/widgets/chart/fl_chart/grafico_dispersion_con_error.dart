import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class GraficoDispersionConError extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoDispersionConError({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    final puntos = videoJuegos.asMap().entries.map((entry) {
      final juego = entry.value;

      return ScatterSpot(
        juego.precio,
        juego.puntaje,
        dotPainter: FlDotCirclePainter(radius: 8, color: Colors.orange),
        yError: const FlErrorRange(lowerBy: 2, upperBy: 2),
      );
    }).toList();

    return ScatterChart(
      ScatterChartData(
        minX: 0,
        minY: 0,
        maxY: 100,
        scatterSpots: puntos,
        errorIndicatorData: const FlErrorIndicatorData(show: true),

        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            axisNameWidget: const Text("Precio"),
            axisNameSize: 30,
            sideTitles: const SideTitles(showTitles: true, reservedSize: 35),
          ),
          leftTitles: AxisTitles(
            axisNameWidget: const Text("Puntuación"),
            axisNameSize: 30,
            sideTitles: const SideTitles(showTitles: true, reservedSize: 35),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
      ),
    );
  }
}
