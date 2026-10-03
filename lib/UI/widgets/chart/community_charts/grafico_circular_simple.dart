import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 14. Gráfico circular (pie) simple: participación de ingresos por juego.
class GraficoCircularSimple extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoCircularSimple({super.key, required this.videoJuegos});

  static final List<charts.Color> _colores = [
    charts.MaterialPalette.blue.shadeDefault,
    charts.MaterialPalette.red.shadeDefault,
    charts.MaterialPalette.green.shadeDefault,
    charts.MaterialPalette.purple.shadeDefault,
    charts.MaterialPalette.deepOrange.shadeDefault,
  ];

  List<charts.Series<VideoJuego, String>> _crearSeries() {
    return [
      charts.Series<VideoJuego, String>(
        id: 'Ingresos estimados',
        domainFn: (VideoJuego juego, _) => juego.nombre,
        measureFn: (VideoJuego juego, _) => juego.ingresosEstimados,
        data: videoJuegos,
        colorFn: (_, index) => _colores[(index ?? 0) % _colores.length],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Participación de ingresos estimados',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 10),

        Expanded(
          child: charts.PieChart<String>(
            _crearSeries(),
            animate: true,

            behaviors: [
              charts.DatumLegend(
                position: charts.BehaviorPosition.bottom,
                horizontalFirst: false,
                desiredMaxRows: 3,
                cellPadding: const EdgeInsets.only(right: 8, bottom: 4),
                entryTextStyle: const charts.TextStyleSpec(fontSize: 10),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
