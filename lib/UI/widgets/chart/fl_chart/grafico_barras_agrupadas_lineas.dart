import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/UI/widgets/chart/widgets_view/construir_ejes_combinables.dart';

class GraficoBarrasAgrupadasConTendencia extends StatelessWidget {
  const GraficoBarrasAgrupadasConTendencia({super.key});

  @override
  Widget build(BuildContext context) {
    final etiquetas = ['2021', '2022', '2023', '2024', '2025'];
    final ingresos = [40.0, 55.0, 50.0, 68.0, 75.0];
    final gastos = [30.0, 38.0, 42.0, 45.0, 50.0];
    final margen = List.generate(
      ingresos.length,
      (i) => ingresos[i] - gastos[i],
    );

    return Stack(
      children: [
        BarChart(
          BarChartData(
            minY: 0,
            maxY: 90,
            titlesData: construirEjesCombinables(
              nombreEjeX: 'Año',
              nombreEjeY: 'Monto (M\$)',
              etiquetasX: etiquetas,
            ),
            gridData: const FlGridData(show: true, drawVerticalLine: false),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: Colors.grey.shade300),
            ),
            groupsSpace: 16,
            barGroups: List.generate(etiquetas.length, (i) {
              return BarChartGroupData(
                x: i,
                barsSpace: 4,
                barRods: [
                  BarChartRodData(
                    toY: ingresos[i],
                    width: 12,
                    color: Colors.blue.shade400,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  BarChartRodData(
                    toY: gastos[i],
                    width: 12,
                    color: Colors.red.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ],
              );
            }),
          ),
        ),
        IgnorePointer(
          child: LineChart(
            LineChartData(
              minX: -0.5,
              maxX: etiquetas.length - 0.5,
              minY: 0,
              maxY: 90,
              titlesData: construirEjesCombinables(
                nombreEjeX: 'Año',
                nombreEjeY: 'Monto (M\$)',
                etiquetasX: etiquetas,
                mostrarTextos: false,
              ),
              gridData: const FlGridData(show: false),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: List.generate(
                    margen.length,
                    (i) => FlSpot(i.toDouble(), margen[i]),
                  ),
                  isCurved: true,
                  color: Colors.orange.shade800,
                  barWidth: 2.5,
                  dotData: FlDotData(
                    show: true,
                    getDotPainter: (spot, pct, bar, index) =>
                        FlDotCirclePainter(
                          radius: 3,
                          color: Colors.orange.shade800,
                          strokeWidth: 0,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
