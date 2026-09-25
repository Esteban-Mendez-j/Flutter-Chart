import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoCascada extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoCascada({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    final juegosDePago = videoJuegos.where((juego) => juego.precio > 0).toList()
      ..sort((a, b) => b.ingresosEstimados.compareTo(a.ingresosEstimados));

    final topJuegos = juegosDePago.take(8).toList();

    return SfCartesianChart(
      title: ChartTitle(text: 'Contribución de ingresos por videojuego (pago)'),

      primaryXAxis: CategoryAxis(
        title: AxisTitle(text: 'Videojuego'),
        labelRotation: -30,
        labelStyle: const TextStyle(fontSize: 9),
      ),

      primaryYAxis: NumericAxis(
        title: AxisTitle(text: 'Ingresos estimados'),
        numberFormat: null,
        labelFormat: '{value}B',
      ),

      tooltipBehavior: TooltipBehavior(enable: true),

      series: <CartesianSeries<VideoJuego, String>>[
        WaterfallSeries<VideoJuego, String>(
          dataSource: topJuegos,

          xValueMapper: (VideoJuego juego, _) => juego.nombre,

          yValueMapper: (VideoJuego juego, _) => juego.ingresosEstimados / 1e9,

          name: 'Ingresos',

          enableTooltip: true,

          connectorLineSettings: const WaterfallConnectorLineSettings(width: 1),
        ),
      ],
    );
  }
}
