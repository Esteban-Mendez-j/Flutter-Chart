import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 5. Gráfico de barra horizontal: ingresos estimados por videojuego.
class GraficoBarraHorizontal extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBarraHorizontal({super.key, required this.videoJuegos});

  List<charts.Series<VideoJuego, String>> _crearSeries() {
    return [
      charts.Series<VideoJuego, String>(
        id: 'Ingresos estimados (M)',
        domainFn: (VideoJuego juego, _) => juego.nombre,
        measureFn: (VideoJuego juego, _) => juego.ingresosEstimados / 1000000,
        data: videoJuegos,
        colorFn: (_, __) => charts.MaterialPalette.indigo.shadeDefault,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Ingresos estimados por videojuego (millones USD)',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: charts.BarChart(
            _crearSeries(),
            animate: true,
            vertical: false,
          ),
        ),
      ],
    );
  }
}
