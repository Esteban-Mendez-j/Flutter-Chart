import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

/// Clase auxiliar solo para poder graficar dos valores (positivas/negativas)
/// como si fueran "categorías" dentro de un mismo PieChart.
class _Segmento {
  final String categoria;
  final double valor;
  final charts.Color color;

  _Segmento(this.categoria, this.valor, this.color);
}

/// 15. Gráfico de dona (donut): valoraciones positivas vs negativas de un
/// videojuego. Se logra con [ArcRendererConfig.arcWidth], que deja un hueco
/// en el centro.
class GraficoDona extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoDona({super.key, required this.videoJuegos});

  List<charts.Series<_Segmento, String>> _crearSeries() {
    final juego = videoJuegos.first;
    final datos = [
      _Segmento(
        'Positivas',
        juego.valoracionesPositivas.toDouble(),
        charts.MaterialPalette.green.shadeDefault,
      ),
      _Segmento(
        'Negativas',
        juego.valoracionesNegativas.toDouble(),
        charts.MaterialPalette.red.shadeDefault,
      ),
    ];

    return [
      charts.Series<_Segmento, String>(
        id: 'Valoraciones',
        domainFn: (_Segmento s, _) => s.categoria,
        measureFn: (_Segmento s, _) => s.valor,
        colorFn: (_Segmento s, __) => s.color,
        data: datos,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Donut: valoraciones de ${videoJuegos.first.nombre}',
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: charts.PieChart<String>(
            _crearSeries(),
            animate: true,
            defaultRenderer: charts.ArcRendererConfig(arcWidth: 30),
            behaviors: [charts.DatumLegend()],
          ),
        ),
      ],
    );
  }
}
