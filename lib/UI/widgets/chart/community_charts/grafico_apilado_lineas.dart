import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/historial_mensual.dart';
import 'package:graficos/data/model/videojuego.dart';

/// Barras apiladas + línea.
/// Muestra las valoraciones positivas y negativas
/// apiladas y los jugadores activos mediante una línea
/// utilizando un segundo eje para manejar las diferentes escalas.
class GraficoBarrasApiladasLinea extends StatelessWidget {
  final VideoJuego videojuego;

  const GraficoBarrasApiladasLinea({super.key, required this.videojuego});

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
    final positivas = charts.Series<HistorialMensual, String>(
      id: 'Positivas',
      domainFn: (HistorialMensual dato, _) => _formatearPeriodo(dato.periodo),
      measureFn: (HistorialMensual dato, _) => dato.valoracionesPositivas,
      data: videojuego.historialMensual,
      colorFn: (_, _) => charts.MaterialPalette.green.shadeDefault,
    );

    final negativas = charts.Series<HistorialMensual, String>(
      id: 'Negativas',
      domainFn: (HistorialMensual dato, _) => _formatearPeriodo(dato.periodo),
      measureFn: (HistorialMensual dato, _) => dato.valoracionesNegativas,
      data: videojuego.historialMensual,
      colorFn: (_, _) => charts.MaterialPalette.red.shadeDefault,
    );

    final jugadores = charts.Series<HistorialMensual, String>(
      id: 'Jugadores activos',
      domainFn: (HistorialMensual dato, _) => _formatearPeriodo(dato.periodo),
      measureFn: (HistorialMensual dato, _) => dato.jugadoresActivos / 1000000,
      data: videojuego.historialMensual,
      colorFn: (_, _) => charts.MaterialPalette.deepOrange.shadeDefault,
    );

    // La línea utiliza un renderer diferente.
    jugadores.setAttribute(charts.rendererIdKey, 'lineRenderer');

    // La línea utiliza el segundo eje Y.
    jugadores.setAttribute(charts.measureAxisIdKey, 'secondaryMeasureAxisId');

    return [positivas, negativas, jugadores];
  }

  @override
  Widget build(BuildContext context) {
    if (videojuego.historialMensual.isEmpty) {
      return const Center(child: Text('No hay datos disponibles'));
    }

    return Column(
      children: [
        Text(
          '${videojuego.nombreCorto} - Valoraciones y jugadores',
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 10),

        Expanded(
          child: charts.OrdinalComboChart(
            _crearSeries(),
            animate: true,

            // Las valoraciones se muestran como
            // barras apiladas.
            defaultRenderer: charts.BarRendererConfig<String>(
              groupingType: charts.BarGroupingType.stacked,
            ),

            // La serie de jugadores utiliza el renderer
            // de línea.
            customSeriesRenderers: [
              charts.LineRendererConfig<String>(
                customRendererId: 'lineRenderer',
                includePoints: true,
                radiusPx: 4,
                strokeWidthPx: 2,
              ),
            ],

            // Eje X con meses abreviados.
            domainAxis: charts.OrdinalAxisSpec(
              renderSpec: charts.SmallTickRendererSpec(
                labelRotation: 45,
                labelStyle: charts.TextStyleSpec(fontSize: 9),
              ),
            ),

            // Segundo eje Y para jugadores activos.
            secondaryMeasureAxis: charts.NumericAxisSpec(
              tickProviderSpec: charts.BasicNumericTickProviderSpec(
                desiredTickCount: 5,
              ),
            ),

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
