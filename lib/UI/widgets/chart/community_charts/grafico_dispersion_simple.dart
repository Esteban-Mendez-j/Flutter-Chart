import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 17. Gráfico de dispersión (scatter plot): relación entre precio y puntaje.
class GraficoDispersionSimple extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoDispersionSimple({super.key, required this.videoJuegos});

  List<charts.Series<VideoJuego, num>> _crearSeries() {
    return [
      charts.Series<VideoJuego, num>(
        id: 'Precio vs puntaje',
        domainFn: (VideoJuego juego, _) => juego.precio,
        measureFn: (VideoJuego juego, _) => juego.puntaje,
        data: videoJuegos,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Precio (USD) vs puntaje',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: charts.ScatterPlotChart(_crearSeries(), animate: true),
        ),
      ],
    );
  }
}
