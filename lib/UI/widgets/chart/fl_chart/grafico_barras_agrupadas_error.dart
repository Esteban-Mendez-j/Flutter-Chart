import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class GraficoBarrasAgrupadasError extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBarrasAgrupadasError({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    final juegos = videoJuegos.take(5).toList();

    return BarChart(
      BarChartData(
        minY: 0,
        maxY: 100,

        errorIndicatorData: const FlErrorIndicatorData(show: true),

        barGroups: List.generate(juegos.length, (index) {
          final juego = juegos[index];

          return BarChartGroupData(
            x: index,
            barsSpace: 4,
            barRods: [
              BarChartRodData(
                toY: juego.puntaje,
                width: 16,
                color: Colors.blue,
                borderRadius: BorderRadius.circular(3),

                // Error visible
                toYErrorRange: const FlErrorRange(lowerBy: 7, upperBy: 7),
              ),

              BarChartRodData(
                toY: juego.duracionPromedioHoras.clamp(0, 100),
                width: 16,
                color: Colors.orange,
                borderRadius: BorderRadius.circular(3),

                toYErrorRange: const FlErrorRange(lowerBy: 7, upperBy: 7),
              ),
            ],
          );
        }),

        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            axisNameWidget: const Text("Videojuegos"),
            axisNameSize: 30,
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();

                if (index < 0 || index >= juegos.length) {
                  return const SizedBox();
                }

                return Text(
                  juegos[index].nombre.length > 7
                      ? "${juegos[index].nombre.substring(0, 7)}..."
                      : juegos[index].nombre,
                  style: const TextStyle(fontSize: 9),
                );
              },
            ),
          ),

          leftTitles: AxisTitles(
            axisNameWidget: const Text("Valor"),
            axisNameSize: 25,
            sideTitles: const SideTitles(showTitles: true, reservedSize: 35),
          ),

          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),

          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),

        gridData: const FlGridData(show: true),
      ),
    );
  }
}
