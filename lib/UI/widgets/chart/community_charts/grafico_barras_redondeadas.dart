import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 26. Barras con esquinas redondeadas y el valor escrito sobre cada barra.
class GraficoBarrasRedondeadas extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBarrasRedondeadas({super.key, required this.videoJuegos});

  List<charts.Series<VideoJuego, String>> _crearSeries() {
    return [
      charts.Series<VideoJuego, String>(
        id: 'Puntaje',
        domainFn: (VideoJuego juego, _) => juego.nombre,
        measureFn: (VideoJuego juego, _) => juego.puntaje,
        data: videoJuegos,
        colorFn: (_, _) => charts.MaterialPalette.purple.shadeDefault,
        labelAccessorFn: (VideoJuego juego, _) =>
            juego.puntaje.toStringAsFixed(1),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Puntaje por videojuego (barras redondeadas)',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: charts.BarChart(
            _crearSeries(),
            animate: true,
            defaultRenderer: charts.BarRendererConfig<String>(
              cornerStrategy: const charts.ConstCornerStrategy(12),
              barRendererDecorator: charts.BarLabelDecorator<String>(
                outsideLabelStyleSpec: charts.TextStyleSpec(
                  color: charts.MaterialPalette.white,
                  fontSize: 11,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
