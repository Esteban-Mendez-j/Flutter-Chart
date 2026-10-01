import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 25. Barras positivas y negativas: diferencia del puntaje de cada juego
/// respecto al promedio del grupo (verde = por encima, rojo = por debajo).
class GraficoBarrasPositivasNegativas extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBarrasPositivasNegativas({super.key, required this.videoJuegos});

  List<charts.Series<VideoJuego, String>> _crearSeries() {
    final promedio =
        videoJuegos.map((j) => j.puntaje).reduce((a, b) => a + b) /
        videoJuegos.length;

    return [
      charts.Series<VideoJuego, String>(
        id: 'Diferencia vs promedio',
        domainFn: (VideoJuego juego, _) => juego.nombre,
        measureFn: (VideoJuego juego, _) => juego.puntaje - promedio,
        data: videoJuegos,
        colorFn: (VideoJuego juego, _) => juego.puntaje >= promedio
            ? charts.MaterialPalette.green.shadeDefault
            : charts.MaterialPalette.red.shadeDefault,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Puntaje respecto al promedio',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(child: charts.BarChart(_crearSeries(), animate: true)),
      ],
    );
  }
}
