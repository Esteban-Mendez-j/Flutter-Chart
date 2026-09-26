import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 7. Gráfico de barras con patrón de relleno: resalta con rayas los juegos
/// que superan 50 millones de copias vendidas.
class GraficoBarrasPatron extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBarrasPatron({super.key, required this.videoJuegos});

  List<charts.Series<VideoJuego, String>> _crearSeries() {
    return [
      charts.Series<VideoJuego, String>(
        id: 'Ventas (M)',
        domainFn: (VideoJuego juego, _) => juego.nombre,
        measureFn: (VideoJuego juego, _) => juego.numeroVentas / 1000000,
        data: videoJuegos,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        fillPatternFn: (VideoJuego juego, _) => juego.numeroVentas > 50000000
            ? charts.FillPatternType.forwardHatch
            : charts.FillPatternType.solid,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Ventas (millones). Rayado = más de 50M vendidas',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: charts.BarChart(_crearSeries(), animate: true),
        ),
      ],
    );
  }
}
