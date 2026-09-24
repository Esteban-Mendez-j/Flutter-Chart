import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class GraficoLineasEscalonadas extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoLineasEscalonadas({super.key, required this.videoJuegos});

  final List<String> meses = const [
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
    final juego = videoJuegos.first;

    // Calculamos las ventas acumuladas mes a mes (en millones)
    double acumulado = 0;
    final spotsAcumulados = <FlSpot>[];
    for (int i = 0; i < juego.historialMensual.length; i++) {
      acumulado += (juego.historialMensual[i].ventas / 1000000);
      spotsAcumulados.add(FlSpot(i.toDouble(), acumulado));
    }

    final maxY = acumulado > 0 ? acumulado * 1.15 : 10.0;

    return Column(
      children: [
        Text(
          'Crecimiento Acumulado de Ventas (Paso a Paso) - ${juego.nombre}',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: LineChart(
            LineChartData(
              minX: 0,
              maxX: (spotsAcumulados.length - 1).toDouble(),
              minY: 0,
              maxY: maxY,
              lineBarsData: [
                LineChartBarData(
                  spots: spotsAcumulados,
                  isStepLineChart: true,
                  barWidth: 3,
                  color: Colors.blue.shade700,
                  dotData: const FlDotData(show: true),
                  belowBarData: BarAreaData(
                    show: true,
                    color: Colors.blue.withValues(alpha: 0.15),
                  ),
                ),
              ],
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: const AxisTitles(
                  axisNameWidget: Text(
                    'Ventas Acum. (M)',
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
                    reservedSize: 30,
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
                      final mes = meses[spot.x.toInt() % meses.length];

                      return LineTooltipItem(
                        '$mes: ${spot.y.toStringAsFixed(2)}M ventas acum.',
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
