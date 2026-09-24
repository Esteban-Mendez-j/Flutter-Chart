import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class GraficoBarraPositivasNegativas extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBarraPositivasNegativas({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    final juegos = videoJuegos.take(6).toList();

    return Column(
      children: [
        const Text(
          'Balance Neto de Satisfacción de Usuarios (%)',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: BarChart(
            BarChartData(
              minY: -100,
              maxY: 100,
              gridData: const FlGridData(show: true),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: const AxisTitles(
                  axisNameWidget: Text(
                    'Balance Neto (%)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                  axisNameSize: 22,
                  sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                ),
                bottomTitles: AxisTitles(
                  axisNameWidget: const Text(
                    'Videojuegos',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                  axisNameSize: 22,
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      final index = value.toInt();

                      if (index < 0 || index >= juegos.length) {
                        return const SizedBox();
                      }

                      return Text(
                        juegos[index].nombre.substring(
                          0,
                          juegos[index].nombre.length > 8
                              ? 8
                              : juegos[index].nombre.length,
                        ),
                        style: const TextStyle(fontSize: 9),
                      );
                    },
                  ),
                ),
              ),
              barGroups: List.generate(juegos.length, (index) {
                final juego = juegos[index];
                final total = juego.valoracionesPositivas + juego.valoracionesNegativas;
                final balanceNeto = total > 0
                    ? ((juego.valoracionesPositivas - juego.valoracionesNegativas) / total) * 100
                    : 0.0;

                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      fromY: 0,
                      toY: balanceNeto,
                      width: 22,
                      color: balanceNeto >= 0 ? Colors.green.shade600 : Colors.redAccent,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
