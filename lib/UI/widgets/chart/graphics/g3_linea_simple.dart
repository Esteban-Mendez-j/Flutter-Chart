import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Puntaje promedio por año de lanzamiento.
class G3LineaSimple extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G3LineaSimple({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) return const Center(child: Text('Sin datos'));

    final porYear = <int, List<VideoJuego>>{};
    for (final j in videoJuegos) {
      porYear.putIfAbsent(j.yearLanzamiento, () => []).add(j);
    }
    final years = porYear.keys.toList()..sort();

    final data = <Map<String, dynamic>>[
      for (final y in years)
        {
          'year': '$y',
          'puntaje': porYear[y]!.fold<double>(0, (a, j) => a + j.puntaje) /
              porYear[y]!.length,
        },
    ];

    return SizedBox(
      height: 300,
      child: Chart(
        padding: (_) => const EdgeInsets.fromLTRB(40, 20, 20, 40),
        data: data,
        variables: {
          'year': Variable(accessor: (Map m) => m['year'] as String),
          'puntaje': Variable(accessor: (Map m) => m['puntaje'] as num),
        },
        marks: [LineMark()],
        axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
      ),
    );
  }
}