import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class GraficoLineaError extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoLineaError({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    final juego = videoJuegos[4];

    const meses = [
      'Ene',
      'Feb',
      'Mar',
      'Abr',
      'May',
      'Jun',
      'Jul',
      'Ago',
      'Sep',
      'Oct',
      'Nov',
      'Dic',
    ];

    final valoresJugadores = juego.historialMensual
        .map((m) => m.jugadoresActivos / 1000000)
        .toList();
    final maxJ = valoresJugadores.isNotEmpty
        ? valoresJugadores.reduce((a, b) => a > b ? a : b)
        : 100.0;
    final minJ = valoresJugadores.isNotEmpty
        ? valoresJugadores.reduce((a, b) => a < b ? a : b)
        : 0.0;

    return Column(
      children: [
        Text(
          'Jugadores Activos con Margen de Error Estimado - ${juego.nombre}',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: LineChart(
            LineChartData(
              minX: 0,
              maxX: 11,
              minY: (minJ * 0.75).clamp(0.0, double.infinity),
              maxY: maxJ * 1.30,
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
                    'Jugadores Activos (M)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                  axisNameSize: 22,
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 45,
                    interval: 10,
                  ),
                ),
                bottomTitles: AxisTitles(
                  axisNameWidget: const Text(
                    'Meses',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                  axisNameSize: 22,
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      final index = value.toInt();
                      if (index < 0 || index >= meses.length) {
                        return const SizedBox();
                      }
                      return SideTitleWidget(
                        meta: meta,
                        child: Text(
                          meses[index],
                          style: const TextStyle(fontSize: 10),
                        ),
                      );
                    },
                  ),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: juego.historialMensual.asMap().entries.map((entry) {
                    final mes = entry.value;

                    final jugadores = mes.jugadoresActivos / 1000000;

                    return FlSpot(
                      entry.key.toDouble(),
                      jugadores,
                      yError: FlErrorRange(
                        lowerBy: jugadores * 0.15,
                        upperBy: jugadores * 0.20,
                      ),
                    );
                  }).toList(),
                  isCurved: false,
                  barWidth: 2,
                  dotData: const FlDotData(show: true),
                  errorIndicatorData: FlErrorIndicatorData(show: true),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
