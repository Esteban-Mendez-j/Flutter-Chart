import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 6. Barra horizontal con etiquetas de valor dentro de cada barra
/// y el eje de categorías (dominio) oculto.
class GraficoBarraHorizontalEtiquetas extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBarraHorizontalEtiquetas({
    super.key,
    required this.videoJuegos,
  });

  List<charts.Series<VideoJuego, String>> _crearSeries() {
    return [
      charts.Series<VideoJuego, String>(
        id: 'Jugadores activos',
        domainFn: (VideoJuego juego, _) => juego.nombre,
        measureFn: (VideoJuego juego, _) => juego.jugadoresActivos,
        data: videoJuegos,
        colorFn: (_, __) => charts.MaterialPalette.lime.shadeDefault,
        labelAccessorFn: (VideoJuego juego, _) =>
            '${juego.nombre}: ${(juego.jugadoresActivos / 1000000).toStringAsFixed(1)}M',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Jugadores activos (con etiquetas)',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: charts.BarChart(
            _crearSeries(),
            animate: true,
            vertical: false,
            barRendererDecorator: charts.BarLabelDecorator<String>(),
            domainAxis: const charts.OrdinalAxisSpec(
              renderSpec: charts.NoneRenderSpec(),
            ),
          ),
        ),
      ],
    );
  }
}
