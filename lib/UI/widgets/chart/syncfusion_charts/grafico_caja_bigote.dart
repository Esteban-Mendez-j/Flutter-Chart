import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoCajaBigote extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoCajaBigote({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    final categorias = videoJuegos
        .map((juego) => juego.categoria)
        .toSet()
        .toList();

    final datos = categorias.map((categoria) {
      final precios = videoJuegos
          .where((juego) => juego.categoria == categoria)
          .map((juego) => juego.precio)
          .toList();

      precios.sort();

      return PrecioCategoria(categoria, precios);
    }).toList();

    return SfCartesianChart(
      title: ChartTitle(text: 'Distribución de precios por categoría'),

      primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Categoría')),

      primaryYAxis: NumericAxis(title: AxisTitle(text: 'Precio (USD)')),

      tooltipBehavior: TooltipBehavior(enable: true),

      series: <CartesianSeries>[
        BoxAndWhiskerSeries<PrecioCategoria, String>(
          dataSource: datos,

          xValueMapper: (PrecioCategoria dato, _) => dato.categoria,

          yValueMapper: (PrecioCategoria dato, _) => dato.precios,

          name: 'Precio',

          showMean: true,

          enableTooltip: true,
        ),
      ],
    );
  }
}

class PrecioCategoria {
  final String categoria;
  final List<double> precios;

  PrecioCategoria(this.categoria, this.precios);
}
