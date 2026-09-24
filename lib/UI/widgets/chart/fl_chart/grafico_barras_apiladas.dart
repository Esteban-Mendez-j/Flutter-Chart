import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class GraficoBarrasApiladas extends StatelessWidget {
  final List<VideoJuego> videoJuegos;
  final List<String> categorias;

  const GraficoBarrasApiladas({
    super.key,
    required this.categorias,
    required this.videoJuegos,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Distribución de Modos de Juego por Categoría',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: BarChart(
            BarChartData(
              barGroups: List.generate(categorias.length, (index) {
                final categoria = categorias[index];

                final singlePlayer = videoJuegos
                    .where(
                      (game) =>
                          game.categoria == categoria &&
                          game.modoJuego.contains('Un jugador'),
                    )
                    .length;

                final multiplayer = videoJuegos
                    .where(
                      (game) =>
                          game.categoria == categoria &&
                          game.modoJuego.contains('Multijugador'),
                    )
                    .length;

                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: (singlePlayer + multiplayer).toDouble(),
                      rodStackItems: [
                        BarChartRodStackItem(
                          0,
                          singlePlayer.toDouble(),
                          Colors.blue,
                        ),
                        BarChartRodStackItem(
                          singlePlayer.toDouble(),
                          (singlePlayer + multiplayer).toDouble(),
                          Colors.green,
                        ),
                      ],
                    ),
                  ],
                );
              }),

              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  axisNameWidget: const Text(
                    'Categoría',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                  axisNameSize: 22,
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      final index = value.toInt();

                      if (index < 0 || index >= categorias.length) {
                        return const SizedBox();
                      }

                      return SideTitleWidget(
                        meta: meta,
                        child: Text(
                          categorias[index],
                          style: const TextStyle(fontSize: 11),
                        ),
                      );
                    },
                  ),
                ),

                leftTitles: const AxisTitles(
                  axisNameWidget: Text(
                    'Cantidad de Videojuegos',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                  axisNameSize: 22,
                  sideTitles: SideTitles(showTitles: true, reservedSize: 35),
                ),

                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),

                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),

              borderData: FlBorderData(show: true),
              gridData: const FlGridData(show: true),
            ),
          ),
        ),
      ],
    );
  }
}
