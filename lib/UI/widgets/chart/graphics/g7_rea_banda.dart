import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Banda de puntaje (mínimo -> máximo) por año de lanzamiento.
class GA7reaBanda extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GA7reaBanda({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    final porYear = <int, List<double>>{};
    for (final j in videoJuegos) {
      porYear.putIfAbsent(j.yearLanzamiento, () => []).add(j.puntaje);
    }
    final years = porYear.keys.toList()..sort();
    if (years.isEmpty) return const Center(child: Text('Sin datos'));

    final data = <Map<String, dynamic>>[
      for (final y in years)
        {'year': '$y', 'val': porYear[y]!.reduce(min), 'serie': '1_Base'},
      for (final y in years)
        {
          'year': '$y',
          'val': porYear[y]!.reduce(max) - porYear[y]!.reduce(min),
          'serie': '2_Rango',
        },
    ];

    return SizedBox(
      height: 300,
      child: Chart(
        padding: (_) => const EdgeInsets.fromLTRB(40, 20, 20, 40),
        data: data,
        variables: {
          'year': Variable(accessor: (Map m) => m['year'] as String),
          'val': Variable(
            accessor: (Map m) => m['val'] as num,
            scale: LinearScale(min: 0),
          ),
          'serie': Variable(accessor: (Map m) => m['serie'] as String),
        },
        marks: [
          AreaMark(
            position: Varset('year') * Varset('val') / Varset('serie'),
            shape: ShapeEncode(value: BasicAreaShape(smooth: true)),
            color: ColorEncode(
              variable: 'serie',
              values: const [Color(0x00000000), Color(0x992196F3)],
            ),
            modifiers: [StackModifier()],
          ),
        ],
        axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
      ),
    );
  }
}