import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoHiloAperturaCierre extends StatelessWidget {
  const GraficoHiloAperturaCierre({super.key});

  @override
  Widget build(BuildContext context) {
    final datos = [
      _Dato('Lun', 52, 40, 44, 50),
      _Dato('Mar', 55, 45, 50, 47),
      _Dato('Mié', 58, 46, 47, 56),
      _Dato('Jue', 60, 50, 56, 52),
      _Dato('Vie', 62, 51, 52, 60),
      _Dato('Sáb', 66, 55, 60, 64),
    ];

    return SfCartesianChart(
      primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Día')),
      primaryYAxis: NumericAxis(
        title: AxisTitle(text: 'Jugadores conectados (miles)'),
      ),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CartesianSeries<_Dato, String>>[
        HiloOpenCloseSeries<_Dato, String>(
          name: 'Conexiones',
          dataSource: datos,
          xValueMapper: (_Dato dato, _) => dato.x,
          highValueMapper: (_Dato dato, _) => dato.high,
          lowValueMapper: (_Dato dato, _) => dato.low,
          openValueMapper: (_Dato dato, _) => dato.open,
          closeValueMapper: (_Dato dato, _) => dato.close,
        ),
      ],
    );
  }
}

class _Dato {
  final String x;
  final double high;
  final double low;
  final double open;
  final double close;

  _Dato(this.x, this.high, this.low, this.open, this.close);
}
