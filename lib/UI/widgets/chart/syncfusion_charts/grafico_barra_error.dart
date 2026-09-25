import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoBarraError extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBarraError({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    final categorias = videoJuegos
        .map((juego) => juego.categoria)
        .toSet()
        .toList();

    final datosPorCategoria = categorias.map((categoria) {
      final puntajes = videoJuegos
          .where((juego) => juego.categoria == categoria)
          .map((juego) => juego.puntaje)
          .toList();

      final promedio = puntajes.reduce((a, b) => a + b) / puntajes.length;
      final minimo = puntajes.reduce((a, b) => a < b ? a : b);
      final maximo = puntajes.reduce((a, b) => a > b ? a : b);

      return ErrorPuntaje(
        categoria,
        promedio,
        promedio - minimo,
        maximo - promedio,
      );
    }).toList();

    final series = datosPorCategoria
        .map(
          (dato) => ErrorBarSeries<ErrorPuntaje, String>(
            dataSource: [dato],
            xValueMapper: (ErrorPuntaje d, _) => d.categoria,
            yValueMapper: (ErrorPuntaje d, _) => d.promedio,
            type: ErrorBarType.custom,
            mode: RenderingMode.vertical,
            verticalPositiveErrorValue: dato.errorSuperior,
            verticalNegativeErrorValue: dato.errorInferior,
            name: dato.categoria,
            isVisibleInLegend: false,
          ),
        )
        .toList();

    return SfCartesianChart(
      title: ChartTitle(text: 'Promedio y variación del puntaje por categoría'),

      primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Categoría')),

      primaryYAxis: NumericAxis(
        title: AxisTitle(text: 'Puntaje'),
        minimum: 0,
        maximum: 10,
      ),

      tooltipBehavior: TooltipBehavior(enable: true),

      series: series.cast<CartesianSeries<ErrorPuntaje, String>>().toList(),
    );
  }
}

class ErrorPuntaje {
  final String categoria;
  final double promedio;
  final double errorInferior;
  final double errorSuperior;

  ErrorPuntaje(
    this.categoria,
    this.promedio,
    this.errorInferior,
    this.errorSuperior,
  );
}
