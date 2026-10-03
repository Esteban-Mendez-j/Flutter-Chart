import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/historial_mensual.dart';
import 'package:graficos/data/model/videojuego.dart';

/// Barras agrupadas + línea.
/// Compara ventas e ingresos mensuales y muestra
/// los jugadores activos mediante una línea.
class GraficoBarrasAgrupadasLinea extends StatelessWidget {
  final VideoJuego videojuego;

  const GraficoBarrasAgrupadasLinea({super.key, required this.videojuego});

  /// Convierte un período como "2026-01" en "Ene".
  String _formatearPeriodo(String periodo) {
    final partes = periodo.split('-');

    if (partes.length != 2) {
      return periodo;
    }

    const meses = [
      '',
      'Ene',
      'Feb',
      'Mar',
      'Abr',
      'May',
      'Jun',
      'Jul',
      'Ago',
      'Sep',
      'Oct',
      'Nov',
      'Dic',
    ];

    final mes = int.tryParse(partes[1]);

    if (mes == null || mes < 1 || mes > 12) {
      return periodo;
    }

    return meses[mes];
  }

  List<charts.Series<HistorialMensual, String>> _crearSeries() {
    final ventas = charts.Series<HistorialMensual, String>(
      id: 'Ventas',
      domainFn: (HistorialMensual dato, _) => _formatearPeriodo(dato.periodo),
      measureFn: (HistorialMensual dato, _) => dato.ventas / 1000,
      data: videojuego.historialMensual,
      colorFn: (_, _) => charts.MaterialPalette.blue.shadeDefault,
    );

    final ingresos = charts.Series<HistorialMensual, String>(
      id: 'Ingresos',
      domainFn: (HistorialMensual dato, _) => _formatearPeriodo(dato.periodo),
      measureFn: (HistorialMensual dato, _) => dato.ingresos,
      data: videojuego.historialMensual,
      colorFn: (_, _) => charts.MaterialPalette.green.shadeDefault,
    );

    final jugadores = charts.Series<HistorialMensual, String>(
      id: 'Jugadores activos',
      domainFn: (HistorialMensual dato, _) => _formatearPeriodo(dato.periodo),
      measureFn: (HistorialMensual dato, _) => dato.jugadoresActivos / 1000000,
      data: videojuego.historialMensual,
      colorFn: (_, _) => charts.MaterialPalette.deepOrange.shadeDefault,
    );

    // La serie de jugadores utiliza el renderer de línea.
    jugadores.setAttribute(charts.rendererIdKey, 'lineRenderer');

    return [ventas, ingresos, jugadores];
  }

  @override
  Widget build(BuildContext context) {
    if (videojuego.historialMensual.isEmpty) {
      return const Center(child: Text('No hay datos disponibles'));
    }

    return Column(
      children: [
        Text(
          '${videojuego.nombreCorto} - Ventas, ingresos y jugadores',
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 10),

        Expanded(
          child: charts.OrdinalComboChart(
            _crearSeries(),
            animate: true,

            // Las ventas e ingresos se muestran
            // como barras agrupadas.
            defaultRenderer: charts.BarRendererConfig<String>(
              groupingType: charts.BarGroupingType.grouped,
            ),

            // Los jugadores activos se muestran
            // mediante una línea.
            customSeriesRenderers: [
              charts.LineRendererConfig<String>(
                customRendererId: 'lineRenderer',
                includePoints: true,
                radiusPx: 4,
                strokeWidthPx: 2,
              ),
            ],

            // Configuración del eje X.
            domainAxis: charts.OrdinalAxisSpec(
              renderSpec: charts.SmallTickRendererSpec(
                labelRotation: 45,
                labelStyle: charts.TextStyleSpec(fontSize: 9),
              ),
            ),

            // Leyenda.
            behaviors: [
              charts.SeriesLegend(
                position: charts.BehaviorPosition.bottom,
                horizontalFirst: true,
                cellPadding: const EdgeInsets.only(right: 8),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
