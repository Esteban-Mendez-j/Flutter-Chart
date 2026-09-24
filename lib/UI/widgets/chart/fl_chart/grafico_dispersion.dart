import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class GraficoDispersion extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoDispersion({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    final juegos = videoJuegos.take(20).toList();

    return Column(
      children: [
        const Text(
          'Relación: Precio vs Puntaje',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ScatterChart(
            ScatterChartData(
              minX: 0,
              maxX: 70,
              minY: 0,
              maxY: 10,
              gridData: const FlGridData(show: true),
              titlesData: const FlTitlesData(
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  axisNameWidget: Text(
                    'Precio (\$USD)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                  axisNameSize: 22,
                  sideTitles: SideTitles(showTitles: true, reservedSize: 30),
                ),
                leftTitles: AxisTitles(
                  axisNameWidget: Text(
                    'Puntaje (0 - 10)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                  axisNameSize: 22,
                  sideTitles: SideTitles(showTitles: true, reservedSize: 35),
                ),
              ),
              scatterSpots: [
                for (final juego in juegos)
                  ScatterSpot(juego.precio, juego.puntaje),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
