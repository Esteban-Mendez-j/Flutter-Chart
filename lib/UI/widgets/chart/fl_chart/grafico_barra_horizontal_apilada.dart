import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class GraficoBarrasHorizontalesApiladas extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBarrasHorizontalesApiladas({
    super.key,
    required this.videoJuegos,
  });

  @override
  Widget build(BuildContext context) {
    final juegos = videoJuegos.take(5).toList();

    final maximo = juegos.fold<double>(0, (max, juego) {
      final total = juego.puntaje + juego.duracionPromedioHoras;

      return total > max ? total : max;
    });

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
      child: BarChart(
        BarChartData(
          rotationQuarterTurns: 1,

          alignment: BarChartAlignment.spaceAround,

          minY: 0,
          maxY: maximo + 10,

          groupsSpace: 12,

          barGroups: List.generate(juegos.length, (index) {
            final juego = juegos[index];

            final puntaje = juego.puntaje.toDouble();
            final duracion = juego.duracionPromedioHoras.toDouble();

            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: puntaje + duracion,
                  width: 20,
                  borderRadius: BorderRadius.zero,
                  rodStackItems: [
                    BarChartRodStackItem(0, puntaje, Colors.blue),
                    BarChartRodStackItem(
                      puntaje,
                      puntaje + duracion,
                      Colors.orange,
                    ),
                  ],
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
                    ),
                  );
                },
              ),
            ),

            // Eje X
            rightTitles: AxisTitles(
              axisNameWidget: const Text(
                'Valor acumulado',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
              ),
              axisNameSize: 22,
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 25,
                interval: 50,
              ),
            ),

            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),

            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
        ),
      ),
    );
  }
}
