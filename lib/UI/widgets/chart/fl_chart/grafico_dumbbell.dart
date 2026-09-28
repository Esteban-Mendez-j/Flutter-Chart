import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class GraficoDumbbell extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoDumbbell({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    final juegos = videoJuegos.take(6).toList();

    final spots = <FlSpot>[];

    for (int i = 0; i < juegos.length; i++) {
      final juego = juegos[i];

      final inicio = juego.puntaje;
      final fin = juego.puntaje + (juego.duracionPromedioHoras / 2);

      spots.add(FlSpot(i.toDouble(), inicio));

      spots.add(FlSpot(i.toDouble(), fin));
    }

    return LineChart(
      LineChartData(
        minX: -0.5,
        maxX: juegos.length - 0.5,
        minY: 0,
        maxY: 110,

        lineBarsData: [
          LineChartBarData(
            spots: spots,
            color: Colors.blue,
            barWidth: 3,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 6,
                  color: Colors.orange,
                  strokeWidth: 2,
                  strokeColor: Colors.white,
                );
              },
            ),
          ),
        ],

        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            axisNameWidget: const Text("Videojuegos"),
            axisNameSize: 28,
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();

                if (index < 0 || index >= juegos.length) {
                  return const SizedBox();
                }

                return Text(
                  juegos[index].nombre.length > 6
                      ? juegos[index].nombre.substring(0, 6)
                      : juegos[index].nombre,
                  style: const TextStyle(fontSize: 9),
                );
              },
            ),
          ),

          leftTitles: AxisTitles(
            axisNameWidget: const Text("Valor"),
            axisNameSize: 28,
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
