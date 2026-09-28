import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class GraficoLineaEscalonada extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoLineaEscalonada({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    final spots = videoJuegos
        .take(8)
        .toList()
        .asMap()
        .entries
        .map(
          (entry) => FlSpot(
            entry.key.toDouble(),
            entry.value.jugadoresActivos.toDouble(),
          ),
        )
        .toList();

    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isStepLineChart: true,
            color: Colors.green,
            barWidth: 3,
            dotData: const FlDotData(show: true),
            belowBarData: BarAreaData(show: false),
          ),
        ],

        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            axisNameWidget: const Text("Videojuegos"),
            axisNameSize: 30,
            sideTitles: const SideTitles(showTitles: true, reservedSize: 35),
          ),
          leftTitles: AxisTitles(
            axisNameWidget: const Text("Jugadores activos"),
            axisNameSize: 30,
            sideTitles: const SideTitles(showTitles: true, reservedSize: 50),
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
