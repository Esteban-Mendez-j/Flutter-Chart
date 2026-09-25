import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoHistograma extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoHistograma({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(text: 'Distribución de precios de videojuegos'),

      primaryXAxis: NumericAxis(
        title: AxisTitle(text: 'Rango de precio (USD)'),
      ),

      primaryYAxis: NumericAxis(
        title: AxisTitle(text: 'Cantidad de videojuegos'),
      ),

      tooltipBehavior: TooltipBehavior(enable: true),

      series: <CartesianSeries<VideoJuego, double>>[
        HistogramSeries<VideoJuego, double>(
          dataSource: videoJuegos,

          yValueMapper: (VideoJuego juego, _) => juego.precio,

          name: 'Distribución de precios',

          binInterval: 15,

          showNormalDistributionCurve: true,

          curveColor: Colors.red,

          enableTooltip: true,
        ),
      ],
    );
  }
}
