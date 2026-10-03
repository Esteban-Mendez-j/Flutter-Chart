import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Puntaje por año: banda mínimo-máximo (sombra) y línea del promedio.
class G31LineaRangoSombra extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G31LineaRangoSombra({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) return const Center(child: Text('Sin datos'));

    final porYear = <int, List<double>>{};
    for (final j in videoJuegos) {
      porYear.putIfAbsent(j.yearLanzamiento, () => []).add(j.puntaje);
    }
    final years = porYear.keys.toList()..sort();

    final data = <Map<String, dynamic>>[
      for (final y in years)
        {
          't': '$y',
          'min': porYear[y]!.reduce(min),
          'max': porYear[y]!.reduce(max),
          'media': porYear[y]!.reduce((a, b) => a + b) / porYear[y]!.length,
        },
    ];

    // IMPORTANTE: min, max y media comparten la MISMA escala; si no, la
    // banda y la línea quedan desalineadas.
    final lo = data.map((d) => d['min'] as double).reduce(min) - 1;
    final hi = data.map((d) => d['max'] as double).reduce(max) + 1;

    return SizedBox(
      height: 300,
      child: Chart(
        padding: (_) => const EdgeInsets.fromLTRB(40, 20, 20, 40),
        data: data,
        variables: {
          't': Variable(accessor: (Map m) => m['t'] as String),
          'min': Variable(
            accessor: (Map m) => m['min'] as num,
            scale: LinearScale(min: lo, max: hi),
          ),
          'max': Variable(
            accessor: (Map m) => m['max'] as num,
            scale: LinearScale(min: lo, max: hi),
          ),
          'media': Variable(
            accessor: (Map m) => m['media'] as num,
            scale: LinearScale(min: lo, max: hi),
          ),
        },
        marks: [
          AreaMark(
            position: Varset('t') * (Varset('min') + Varset('max')),
            color: ColorEncode(value: Colors.lightGreen),
          ),
          LineMark(
            position: Varset('t') * Varset('media'),
            color: ColorEncode(value: Colors.green),
          ),
        ],
        axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
      ),
    );
  }
}
