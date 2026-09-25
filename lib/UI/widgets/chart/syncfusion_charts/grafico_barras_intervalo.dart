import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoBarraIntervalo extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBarraIntervalo({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    final categorias = videoJuegos
        .map((juego) => juego.categoria)
        .toSet()
        .toList();

    final datos = categorias.map((categoria) {
      final puntajes = videoJuegos
          .where((juego) => juego.categoria == categoria)
          .map((juego) => juego.puntaje)
          .toList();

      return RangoPuntaje(
        categoria,
        puntajes.reduce((a, b) => a < b ? a : b),
        puntajes.reduce((a, b) => a > b ? a : b),
      );
    }).toList();

    return SfCartesianChart(
      title: ChartTitle(text: 'Rango de puntajes por categoría'),

      primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Categoría')),

      primaryYAxis: NumericAxis(
        title: AxisTitle(text: 'Puntaje'),
        minimum: 0,
        maximum: 10,
      ),

      tooltipBehavior: TooltipBehavior(enable: true),

      series: <CartesianSeries<RangoPuntaje, String>>[
        RangeColumnSeries<RangoPuntaje, String>(
          dataSource: datos,

          xValueMapper: (RangoPuntaje dato, _) => dato.categoria,

          lowValueMapper: (RangoPuntaje dato, _) => dato.minimo,

          highValueMapper: (RangoPuntaje dato, _) => dato.maximo,

          name: 'Puntaje',

          enableTooltip: true,
        ),
      ],
    );
  }
}

class RangoPuntaje {
  final String categoria;
  final double minimo;
  final double maximo;

  RangoPuntaje(this.categoria, this.minimo, this.maximo);
}
