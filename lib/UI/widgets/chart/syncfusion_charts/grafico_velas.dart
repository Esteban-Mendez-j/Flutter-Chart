import 'package:flutter/material.dart';
import 'package:graficos/data/model/historial_mensual.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

/// Velas japonesas (Candlestick): usa los datos OHLC (apertura, máximo,
/// mínimo, cierre) que ya vienen en cada mes del historial del juego.
class GraficoVelas extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoVelas({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    final juego = videoJuegos.first;

    return SfCartesianChart(
      title: ChartTitle(text: 'Cotización simulada de ventas: ${juego.nombre}'),
      primaryXAxis: const CategoryAxis(title: AxisTitle(text: 'Mes')),
      primaryYAxis: NumericAxis(title: AxisTitle(text: 'Valor')),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CartesianSeries<HistorialMensual, String>>[
        CandleSeries<HistorialMensual, String>(
          dataSource: juego.historialMensual,
          xValueMapper: (HistorialMensual h, _) => h.periodo,
          lowValueMapper: (HistorialMensual h, _) => h.ventasOhlc.low,
          highValueMapper: (HistorialMensual h, _) => h.ventasOhlc.high,
          openValueMapper: (HistorialMensual h, _) => h.ventasOhlc.open,
          closeValueMapper: (HistorialMensual h, _) => h.ventasOhlc.close,
          name: 'Ventas',
          bearColor: Colors.redAccent,
          bullColor: Colors.green,
        ),
      ],
    );
  }
}
