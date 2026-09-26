import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SfG1Linea extends StatelessWidget {
  const SfG1Linea({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_SalesData> data = [
      _SalesData('Ene', 35),
      _SalesData('Feb', 28),
      _SalesData('Mar', 34),
      _SalesData('Abr', 32),
      _SalesData('May', 40),
    ];

    return SfCartesianChart(
      primaryXAxis: const CategoryAxis(),
      series: <CartesianSeries<_SalesData, String>>[
        LineSeries<_SalesData, String>(
          dataSource: data,
          xValueMapper: (_SalesData sales, _) => sales.year,
          yValueMapper: (_SalesData sales, _) => sales.sales,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);
  final String year;
  final double sales;
}