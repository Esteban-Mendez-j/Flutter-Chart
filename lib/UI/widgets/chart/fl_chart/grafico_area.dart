import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class GraficoAreas extends StatelessWidget {
  final List<VideoJuego> videoJuegos;
  final double maxJugadores;

  const GraficoAreas({
    super.key,
    required this.videoJuegos,
    required this.maxJugadores,
  });

  @override
  Widget build(BuildContext context) {
    final juegos = videoJuegos.take(5).toList();

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

    final colors = [
      Colors.blue.shade600,
      Colors.green.shade600,
      Colors.orange.shade700,
      Colors.purple.shade600,
      Colors.red.shade400,
    ];

    return Column(
      children: [
        const Text(
          'Evolución de Jugadores Activos por Mes',
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
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
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
              maxY: maxJugadores > 0 ? maxJugadores * 1.15 : 100,
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
                    'Jugadores Activos',
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
              lineBarsData: juegos.asMap().entries.map((entry) {
                final idx = entry.key;
                final juego = entry.value;
                final color = colors[idx % colors.length];

                return LineChartBarData(
                  spots: [
                    for (int i = 0; i < juego.historialMensual.length; i++)
                      FlSpot(
                        i.toDouble(),
                        juego.historialMensual[i].jugadoresActivos.toDouble(),
                      ),
                  ],
                  isCurved: true,
                  barWidth: 2,
                  color: color,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    color: color.withValues(alpha: 0.15),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
