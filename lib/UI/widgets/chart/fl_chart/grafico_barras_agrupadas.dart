import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class GraficoBarrasAgrupadas extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBarrasAgrupadas({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    final juegos = videoJuegos.take(5).toList();

    double maxValor = 0;
    for (final game in juegos) {
      final ingresoM = game.ingresosEstimados / 1000000;
      final costoM = game.costoDesarrollo / 1000000;
      if (ingresoM > maxValor) maxValor = ingresoM;
      if (costoM > maxValor) maxValor = costoM;
    }

    return Column(
      children: [
        const Text(
          'Comparativa Financiera: Ingresos vs Costo de Desarrollo',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 12, height: 12, color: Colors.green.shade600),
            const SizedBox(width: 4),
            const Text('Ingresos (\$M)', style: TextStyle(fontSize: 11)),
            const SizedBox(width: 16),
            Container(width: 12, height: 12, color: Colors.red.shade400),
            const SizedBox(width: 4),
            const Text('Costo Dev (\$M)', style: TextStyle(fontSize: 11)),
          ],
        ),
        const SizedBox(height: 8),
        Expanded(
          child: BarChart(
            BarChartData(
              maxY: maxValor * 1.15,
              barTouchData: BarTouchData(
                enabled: true,
                touchTooltipData: BarTouchTooltipData(
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    final game = juegos[group.x.toInt()];
                    final tipo = rodIndex == 0 ? 'Ingresos' : 'Costo Dev';
                    final valor = rodIndex == 0
                        ? game.ingresosEstimados / 1000000
                        : game.costoDesarrollo / 1000000;
                    return BarTooltipItem(
                      '${game.nombre}\n$tipo: \$${valor.toStringAsFixed(1)}M',
                      const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
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
                      return RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          juegos[index].nombre,
                          style: const TextStyle(fontSize: 10),
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    },
                    reservedSize: 50,
                  ),
                ),
                leftTitles: const AxisTitles(
                  axisNameWidget: Text(
                    'Millones (\$M)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                  axisNameSize: 22,
                  sideTitles: SideTitles(showTitles: true, reservedSize: 45),
                ),
              ),
              borderData: FlBorderData(show: false),
              barGroups: List.generate(juegos.length, (index) {
                final game = juegos[index];
                final ingresoM = game.ingresosEstimados / 1000000;
                final costoM = game.costoDesarrollo / 1000000;

                return BarChartGroupData(
                  x: index,
                  barsSpace: 4,
                  barRods: [
                    BarChartRodData(
                      toY: ingresoM,
                      width: 14,
                      color: Colors.green.shade600,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    BarChartRodData(
                      toY: costoM,
                      width: 14,
                      color: Colors.red.shade400,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ],
                );
              }),
              gridData: const FlGridData(show: true, drawVerticalLine: false),
            ),
          ),
        ),
      ],
    );
  }
}
