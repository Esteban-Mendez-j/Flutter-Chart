import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class GraficoLineaDiscontinuaArea extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoLineaDiscontinuaArea({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    final spots = videoJuegos
        .take(8)
        .toList()
        .asMap()
        .entries
        .map((entry) => FlSpot(entry.key.toDouble(), entry.value.puntaje))
        .toList();

    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            color: Colors.purple,
            barWidth: 3,

            // Línea discontinua
            dashArray: [8, 5],

            // Área inferior
            belowBarData: BarAreaData(
              show: true,
              color: Colors.purple.withValues(alpha: 0.15),
            ),

            dotData: const FlDotData(show: true),
          ),
        ],

        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            axisNameWidget: const Text("Videojuegos"),
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
