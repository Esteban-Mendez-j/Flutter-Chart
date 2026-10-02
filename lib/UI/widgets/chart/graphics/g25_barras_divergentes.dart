import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Diferencia del puntaje contra el promedio general: 4 mejores y 4 peores.
class G25BarrasDivergentes extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G25BarrasDivergentes({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) return const Center(child: Text('Sin datos'));

    final promedio =
        videoJuegos.fold<double>(0, (a, j) => a + j.puntaje) / videoJuegos.length;

    final orden = [...videoJuegos]..sort((a, b) => b.puntaje.compareTo(a.puntaje));
    final muestra = orden.length <= 8
        ? orden
        : [...orden.take(4), ...orden.skip(orden.length - 4)];

    final data = <Map<String, dynamic>>[
      for (final j in muestra)
        {
          'item': j.nombre,
          'val': j.puntaje - promedio,
          'signo': j.puntaje >= promedio ? 'Sobre el promedio' : 'Bajo el promedio',
        },
    ];

    final maxAbs = max(
      1e-6,
      data.map((d) => (d['val'] as double).abs()).reduce(max),
    );

    return SizedBox(
      height: 300,
      child: Chart(
        padding: (_) => const EdgeInsets.fromLTRB(110, 20, 20, 40),
        data: data,
        variables: {
          'item': Variable(accessor: (Map m) => m['item'] as String),
          'val': Variable(
            accessor: (Map m) => m['val'] as num,
            // Escala simétrica para que el 0 quede al centro
            scale: LinearScale(min: -maxAbs * 1.1, max: maxAbs * 1.1),
          ),
          'signo': Variable(accessor: (Map m) => m['signo'] as String),
        },
        coord: RectCoord(transposed: true),
        marks: [
          IntervalMark(
            position: Varset('item') * Varset('val'),
            color: ColorEncode(
              variable: 'signo',
              values: [Colors.indigoAccent, Colors.redAccent],
            ),
          ),
        ],
        axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
      ),
    );
  }
}