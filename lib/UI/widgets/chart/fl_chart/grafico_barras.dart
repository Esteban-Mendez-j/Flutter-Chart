import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraficoBarras extends StatelessWidget {
  const GraficoBarras({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        maxY: 100,
        gridData: const FlGridData(show: true),
        titlesData: const FlTitlesData(
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [BarChartRodData(toY: 50, width: 25)],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [BarChartRodData(toY: 80, width: 25)],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [BarChartRodData(toY: 40, width: 25)],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [BarChartRodData(toY: 90, width: 25)],
          ),
        ],
      ),
    );
  }
}
