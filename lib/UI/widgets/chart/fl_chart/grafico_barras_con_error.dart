import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class GraficoBarrasConError extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBarrasConError({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    final juegos = videoJuegos.take(5).toList();

    return BarChart(
      BarChartData(
        minY: 0,
        maxY: 20,

        errorIndicatorData: FlErrorIndicatorData(
          show: true,
          painter: (_) {
            return FlSimpleErrorPainter(
              lineColor: Colors.red,
              lineWidth: 3,
              capLength: 12,
              showErrorTexts: true,
              errorTextStyle: TextStyle(
                color: Colors.red,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),

        barGroups: List.generate(juegos.length, (index) {
          final valor = juegos[index].puntaje;

          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: valor,
                width: 25,
                color: Colors.blue,
                borderRadius: BorderRadius.circular(4),

                toYErrorRange: const FlErrorRange(lowerBy: 3, upperBy: 3),
              ),
            ],
          );
        }),

        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            axisNameWidget: const Text("Videojuegos"),
            axisNameSize: 28,
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();

                if (index < 0 || index >= juegos.length) {
                  return const SizedBox();
                }

                final nombre = juegos[index].nombre;

                return Text(
                  nombre.length > 7 ? "${nombre.substring(0, 7)}..." : nombre,
                  style: const TextStyle(fontSize: 9),
                );
              },
            ),
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

        gridData: const FlGridData(show: true),
      ),
    );
  }
}
