import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class GraficoLineasMultiples extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoLineasMultiples({super.key, required this.videoJuegos});

  final meses = const [
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

  @override
  Widget build(BuildContext context) {
    final juegos = videoJuegos.take(4).toList();
    final colors = [
      Colors.blue.shade600,
      Colors.green.shade600,
      Colors.orange.shade700,
      Colors.purple.shade600,
    ];

    double maxIngreso = 0;
    for (final juego in juegos) {
      for (final mes in juego.historialMensual) {
        if (mes.ingresos > maxIngreso) maxIngreso = mes.ingresos;
      }
    }

    return Column(
      children: [
        const Text(
          'Evolución de Ingresos Mensuales (\$M)',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 12,
          runSpacing: 4,
          alignment: WrapAlignment.center,
          children: juegos.asMap().entries.map((entry) {
            final color = colors[entry.key % colors.length];
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: 10, height: 10, color: color),
                const SizedBox(width: 4),
                Text(
                  entry.value.nombre,
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                ),
              ],
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: LineChart(
            LineChartData(
              minX: 0,
              maxX: 11,
              minY: 0,
              maxY: maxIngreso > 0 ? maxIngreso * 1.15 : 100,
              lineBarsData: juegos.asMap().entries.map((entry) {
                final idx = entry.key;
                final juego = entry.value;
                final color = colors[idx % colors.length];

                final spots = List.generate(juego.historialMensual.length, (mesIdx) {
                  return FlSpot(
                    mesIdx.toDouble(),
                    juego.historialMensual[mesIdx].ingresos,
                  );
                });

                return LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  barWidth: 3,
                  color: color,
                  isStrokeCapRound: true,
                  dotData: const FlDotData(show: true),
                  belowBarData: BarAreaData(show: false),
                );
              }).toList(),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: const AxisTitles(
                  axisNameWidget: Text(
                    'Ingresos (\$M USD)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                  axisNameSize: 22,
                  sideTitles: SideTitles(showTitles: true, reservedSize: 45),
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
              gridData: const FlGridData(show: true),
              borderData: FlBorderData(show: true),
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  getTooltipItems: (spots) {
                    return spots.map((spot) {
                      final juego = juegos[spot.barIndex];

                      return LineTooltipItem(
                        '${juego.nombre}\n\$${spot.y.toStringAsFixed(1)}M USD',
                        const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }).toList();
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
