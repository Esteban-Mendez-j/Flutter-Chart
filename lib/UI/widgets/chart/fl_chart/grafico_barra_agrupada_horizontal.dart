import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class GraficoBarrasHorizontalesAgrupadas extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBarrasHorizontalesAgrupadas({
    super.key,
    required this.videoJuegos,
  });

  @override
  Widget build(BuildContext context) {
    final juegos = videoJuegos.take(5).toList();

    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
          child: BarChart(
            BarChartData(
              rotationQuarterTurns: 1,

              alignment: BarChartAlignment.spaceAround,

              maxY: 120,
              minY: 0,

              groupsSpace: 12,

              barGroups: List.generate(juegos.length, (index) {
                final juego = juegos[index];

                return BarChartGroupData(
                  x: index,
                  barsSpace: 3,
                  barRods: [
                    BarChartRodData(
                      toY: juego.puntaje.toDouble(),
                      width: 10,
                      color: Colors.blue,
                      borderRadius: BorderRadius.zero,
                    ),
                    BarChartRodData(
                      toY: juego.duracionPromedioHoras.toDouble(),
                      width: 10,
                      color: Colors.orange,
                      borderRadius: BorderRadius.zero,
                    ),
                  ],
                );
              }),

              gridData: const FlGridData(
                show: true,
                drawVerticalLine: true,
                drawHorizontalLine: true,
              ),

              borderData: FlBorderData(show: true),

              titlesData: FlTitlesData(
                // Eje Y
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),

                // Eje X
                bottomTitles: AxisTitles(
                  axisNameWidget: const Text(
                    'Videojuegos',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                  axisNameSize: 22,

                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 55,
                    getTitlesWidget: (value, meta) {
                      final index = value.toInt();

                      if (index < 0 || index >= juegos.length) {
                        return const SizedBox();
                      }

                      final nombre = juegos[index].nombre;

                      return RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          nombre.length > 7
                              ? '${nombre.substring(0, 7)}...'
                              : nombre,
                          style: const TextStyle(fontSize: 9),
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    },
                  ),
                ),

                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),

                rightTitles: AxisTitles(
                  axisNameWidget: Text(
                    'Valor puntaje - horas',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                  axisNameSize: 22,
                  sideTitles: SideTitles(showTitles: true, reservedSize: 30),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
