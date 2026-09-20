import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraficoCircular extends StatelessWidget {
  const GraficoCircular({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sectionsSpace: 4,
        centerSpaceRadius: 30,
        sections: [
          PieChartSectionData(value: 40, title: '40%', radius: 80),
          PieChartSectionData(value: 30, title: '30%', radius: 80),
          PieChartSectionData(value: 20, title: '20%', radius: 80),
          PieChartSectionData(value: 10, title: '10%', radius: 80),
        ],
      ),
    );
  }
}
