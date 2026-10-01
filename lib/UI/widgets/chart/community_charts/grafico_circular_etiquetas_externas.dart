import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 27. Gráfico circular con el nombre y porcentaje fuera de cada porción.
class GraficoCircularEtiquetasExternas extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoCircularEtiquetasExternas({super.key, required this.videoJuegos});

  static final List<charts.Color> _colores = [
    charts.MaterialPalette.cyan.shadeDefault,
    charts.MaterialPalette.pink.shadeDefault,
    charts.MaterialPalette.yellow.shadeDefault,
    charts.MaterialPalette.green.shadeDefault,
    charts.MaterialPalette.deepOrange.shadeDefault,
  ];

  List<charts.Series<VideoJuego, String>> _crearSeries() {
    final total = videoJuegos.fold<int>(0, (s, j) => s + j.numeroVentas);

    return [
      charts.Series<VideoJuego, String>(
        id: 'Ventas',
        domainFn: (VideoJuego juego, _) => juego.nombre,
        measureFn: (VideoJuego juego, _) => juego.numeroVentas,
        data: videoJuegos,
        colorFn: (_, index) => _colores[(index ?? 0) % _colores.length],
        labelAccessorFn: (VideoJuego juego, _) =>
            '${juego.nombre} ${(juego.numeroVentas / total * 100).toStringAsFixed(0)}%',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Participación en ventas',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: charts.PieChart<String>(
            _crearSeries(),
            animate: true,
            defaultRenderer: charts.ArcRendererConfig<String>(
              arcRendererDecorators: [
                charts.ArcLabelDecorator(
                  labelPosition: charts.ArcLabelPosition.outside,
                  outsideLabelStyleSpec: charts.TextStyleSpec(
                    color: charts.MaterialPalette.white,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
