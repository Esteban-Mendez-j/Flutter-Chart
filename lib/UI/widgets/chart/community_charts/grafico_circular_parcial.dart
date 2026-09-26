import 'dart:math';

import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class _Segmento {
  final String categoria;
  final double valor;
  final charts.Color color;

  _Segmento(this.categoria, this.valor, this.color);
}

/// 16. Gráfico circular parcial tipo "medidor": muestra el puntaje sobre 10
/// como un arco incompleto (gauge), dejando un espacio abierto abajo.
class GraficoCircularParcial extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoCircularParcial({super.key, required this.videoJuegos});

  List<charts.Series<_Segmento, String>> _crearSeries() {
    final juego = videoJuegos.first;
    final datos = [
      _Segmento(
        'Puntaje',
        juego.puntaje,
        charts.MaterialPalette.blue.shadeDefault,
      ),
      _Segmento(
        'Restante',
        10 - juego.puntaje,
        charts.MaterialPalette.gray.shadeDefault,
      ),
    ];

    return [
      charts.Series<_Segmento, String>(
        id: 'Puntaje sobre 10',
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
          'Medidor de puntaje: ${videoJuegos.first.nombre}',
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: charts.PieChart<String>(
            _crearSeries(),
            animate: true,
            defaultRenderer: charts.ArcRendererConfig(
              arcWidth: 40,
              // Deja abierto 1/5 del círculo, como un velocímetro.
              startAngle: 4 / 5 * pi,
              arcLength: 7 / 5 * pi,
            ),
          ),
        ),
      ],
    );
  }
}
