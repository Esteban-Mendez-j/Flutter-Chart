import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class _Punto {
  final double x;
  final double y;

  _Punto(this.x, this.y);
}

/// 31. Dispersión con línea de tendencia: duración promedio vs puntaje, con
/// una recta de regresión lineal calculada a partir de los mismos datos.
class GraficoDispersionTendencia extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoDispersionTendencia({super.key, required this.videoJuegos});

  List<_Punto> _calcularTendencia() {
    final xs = videoJuegos.map((j) => j.duracionPromedioHoras).toList();
    final ys = videoJuegos.map((j) => j.puntaje).toList();
    final n = xs.length;
    final mediaX = xs.reduce((a, b) => a + b) / n;
    final mediaY = ys.reduce((a, b) => a + b) / n;

    var numerador = 0.0;
    var denominador = 0.0;
    for (var i = 0; i < n; i++) {
      numerador += (xs[i] - mediaX) * (ys[i] - mediaY);
      denominador += (xs[i] - mediaX) * (xs[i] - mediaX);
    }
    final pendiente = denominador == 0 ? 0.0 : numerador / denominador;
    final intercepto = mediaY - pendiente * mediaX;

    final minX = xs.reduce((a, b) => a < b ? a : b);
    final maxX = xs.reduce((a, b) => a > b ? a : b);
    return [
      _Punto(minX, pendiente * minX + intercepto),
      _Punto(maxX, pendiente * maxX + intercepto),
    ];
  }

  List<charts.Series<dynamic, num>> _crearSeries() {
    return [
      charts.Series<VideoJuego, num>(
        id: 'Juegos',
        domainFn: (VideoJuego juego, _) => juego.duracionPromedioHoras,
        measureFn: (VideoJuego juego, _) => juego.puntaje,
        data: videoJuegos,
        colorFn: (_, _) => charts.MaterialPalette.cyan.shadeDefault,
      ),
      charts.Series<_Punto, num>(
        id: 'Tendencia',
        domainFn: (_Punto p, _) => p.x,
        measureFn: (_Punto p, _) => p.y,
        data: _calcularTendencia(),
        colorFn: (_, _) => charts.MaterialPalette.red.shadeDefault,
      )..setAttribute(charts.rendererIdKey, 'tendencia'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Duración promedio (h) vs puntaje, con tendencia',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: charts.NumericComboChart(
            _crearSeries(),
            animate: true,
            defaultRenderer: charts.PointRendererConfig<num>(),
            customSeriesRenderers: [
              charts.LineRendererConfig<num>(customRendererId: 'tendencia'),
            ],
            behaviors: [charts.SeriesLegend()],
          ),
        ),
      ],
    );
  }
}
