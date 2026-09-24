import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class GraficoAreaEntreLineas extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoAreaEntreLineas({super.key, required this.videoJuegos});
  @override
  Widget build(BuildContext context) {
    final juego = videoJuegos.first;

    final maxVentas = juego.historialMensual
        .asMap()
        .entries
        .map(
          (entry) => FlSpot(
            entry.key.toDouble(),
            entry.value.ventasOhlc.high / 1000000,
          ),
        )
        .toList();

    final minVentas = juego.historialMensual
        .asMap()
        .entries
        .map(
          (entry) => FlSpot(
            entry.key.toDouble(),
            entry.value.ventasOhlc.low / 1000000,
          ),
        )
        .toList();

    final maxVal = maxVentas.isNotEmpty
        ? maxVentas.map((s) => s.y).reduce((a, b) => a > b ? a : b)
        : 5.0;

    return Column(
      children: [
        Text(
          'Rango de Variabilidad de Ventas Mensuales (Máx vs Mín) - ${juego.nombre}',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: LineChart(
            LineChartData(
              minX: 0,
              maxX: (juego.historialMensual.length - 1).toDouble(),
              minY: 0,
              maxY: maxVal * 1.2,
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
                    'Ventas (Millones)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                  axisNameSize: 22,
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 45,
                  ),
                ),
                bottomTitles: AxisTitles(
                  axisNameWidget: const Text(
                    'Mes de Historial',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                  axisNameSize: 22,
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
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
              betweenBarsData: [
                BetweenBarsData(
                  fromIndex: 0,
                  toIndex: 1,
                  color: Colors.blue.withValues(alpha: 0.25),
                ),
              ],
              lineBarsData: [
                LineChartBarData(
                  spots: maxVentas,
                  isCurved: true,
                  barWidth: 2.5,
                  color: Colors.blue.shade700,
                  dotData: const FlDotData(show: true),
                  belowBarData: BarAreaData(show: false),
                ),
                LineChartBarData(
                  spots: minVentas,
                  isCurved: true,
                  barWidth: 2.5,
                  color: Colors.cyan.shade600,
                  dotData: const FlDotData(show: true),
                  belowBarData: BarAreaData(show: false),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
