import 'package:flutter/material.dart';
import 'package:graficos/data/model/historial_mensual.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

/// Área de rango (Range Area): sombrea el área entre el valor mínimo (open)
/// y máximo (high) de ventas simuladas de cada mes.
class GraficoAreaRango extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoAreaRango({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    final juego = videoJuegos.first;

    return SfCartesianChart(
      title: ChartTitle(text: 'Rango de ventas simuladas: ${juego.nombre}'),
      primaryXAxis: const CategoryAxis(title: AxisTitle(text: 'Mes')),
      primaryYAxis: NumericAxis(title: AxisTitle(text: 'Valor')),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CartesianSeries<HistorialMensual, String>>[
        RangeAreaSeries<HistorialMensual, String>(
          dataSource: juego.historialMensual,
          xValueMapper: (HistorialMensual h, _) => h.periodo,
          lowValueMapper: (HistorialMensual h, _) => h.ventasOhlc.low,
          highValueMapper: (HistorialMensual h, _) => h.ventasOhlc.high,
          name: 'Rango mín-máx',
          color: Colors.cyan.withValues(alpha: 0.4),
          borderColor: Colors.cyan,
          borderWidth: 2,
        ),
      ],
    );
  }
}
