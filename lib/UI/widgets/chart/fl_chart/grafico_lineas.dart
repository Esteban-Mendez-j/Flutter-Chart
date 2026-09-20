import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraficoLineas extends StatelessWidget {
  const GraficoLineas({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 6,
        minY: 0,
        maxY: 100,
        gridData: const FlGridData(show: true),
        titlesData: const FlTitlesData(
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 20),
              FlSpot(1, 40),
              FlSpot(2, 35),
              FlSpot(3, 60),
              FlSpot(4, 50),
              FlSpot(5, 80),
              FlSpot(6, 70),
            ],
            isCurved: true,
            barWidth: 3,
            dotData: const FlDotData(show: true),
          ),
        ],
      ),
    );
  }
}
