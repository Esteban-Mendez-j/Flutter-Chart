import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 1. Gráfico de barras simple: puntaje por videojuego.
class GraficoBarrasSimple extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBarrasSimple({super.key, required this.videoJuegos});

  List<charts.Series<VideoJuego, String>> _crearSeries() {
    return [
      charts.Series<VideoJuego, String>(
        id: 'Puntaje',
        domainFn: (VideoJuego juego, _) => juego.nombre,
        measureFn: (VideoJuego juego, _) => juego.puntaje,
        data: videoJuegos,
        colorFn: (_, _) => charts.MaterialPalette.blue.shadeDefault,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Puntaje por videojuego',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(child: charts.BarChart(_crearSeries(), animate: true)),
      ],
    );
  }
}
