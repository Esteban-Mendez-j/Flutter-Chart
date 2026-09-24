import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class GraficoBurbujas extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBurbujas({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) {
      return const Center(
        child: Text('No hay datos para el gráfico de burbujas'),
      );
    }

    final juegos = videoJuegos.take(15).toList();

    final maxJugadores = juegos
        .map((j) => j.jugadoresActivos)
        .reduce((a, b) => max(a, b))
        .toDouble();

    final maxCosto = juegos
        .map((j) => j.costoDesarrollo / 1000000)
        .reduce((a, b) => max(a, b));

    final maxIngreso = juegos
        .map((j) => j.ingresosEstimados / 1000000)
        .reduce((a, b) => max(a, b));

    return Column(
      children: [
        const Text(
          'Rentabilidad Multivariable: Costo vs Ingreso vs Jugadores',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ScatterChart(
            ScatterChartData(
              minX: 0,
              maxX: maxCosto * 1.20,
              minY: 0,
              maxY: maxIngreso * 1.20,
              gridData: const FlGridData(
                show: true,
                drawVerticalLine: true,
                horizontalInterval: 50,
                verticalInterval: 50,
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.grey.shade400),
              ),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: AxisTitles(
                  axisNameWidget: const Text(
                    'Ingresos Estimados (\$M)',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                  ),
                  sideTitles: const SideTitles(
                    showTitles: true,
                    reservedSize: 45,
                  ),
                ),
                bottomTitles: AxisTitles(
                  axisNameWidget: const Text(
                    'Costo de Desarrollo (\$M)',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                  ),
                  sideTitles: const SideTitles(
                    showTitles: true,
                    reservedSize: 35,
                  ),
                ),
              ),
              scatterSpots: juegos.map((juego) {
                final costoM = juego.costoDesarrollo / 1000000;
                final ingresoM = juego.ingresosEstimados / 1000000;

                final radio =
                    8.0 +
                    (juego.jugadoresActivos /
                            (maxJugadores == 0 ? 1 : maxJugadores)) *
                        20.0;

                final color = juego.puntaje >= 8.5
                    ? Colors.green.withValues(alpha: 0.75)
                    : juego.puntaje >= 7.0
                    ? Colors.blue.withValues(alpha: 0.75)
                    : Colors.orange.withValues(alpha: 0.75);

                return ScatterSpot(
                  costoM,
                  ingresoM,
                  dotPainter: FlDotCirclePainter(color: color, radius: radio),
                );
              }).toList(),
              scatterTouchData: ScatterTouchData(
                enabled: true,
                touchTooltipData: ScatterTouchTooltipData(
                  getTooltipItems: (ScatterSpot spot) {
                    final index = juegos.indexWhere(
                      (j) =>
                          (j.costoDesarrollo / 1000000) == spot.x &&
                          (j.ingresosEstimados / 1000000) == spot.y,
                    );
                    if (index == -1) return null;
                    final juego = juegos[index];
                    return ScatterTooltipItem(
                      '${juego.nombre}\nCosto: \$${spot.x.toStringAsFixed(1)}M\nIngreso: \$${spot.y.toStringAsFixed(1)}M\nScore: ${juego.puntaje}\nJugadores: ${(juego.jugadoresActivos / 1000000).toStringAsFixed(1)}M',
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
