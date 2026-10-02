import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Videojuegos lanzados por año, apilados por categoría (top 3).
class G12AreaApilada extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G12AreaApilada({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) return const Center(child: Text('Sin datos'));

    final conteo = <String, int>{};
    for (final j in videoJuegos) {
      conteo[j.categoria] = (conteo[j.categoria] ?? 0) + 1;
    }
    final cats = (conteo.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value)))
        .take(3)
        .map((e) => e.key)
        .toList();
    final years = videoJuegos.map((j) => j.yearLanzamiento).toSet().toList()
      ..sort();

    // Todas las categorías deben tener un valor en todos los años (0 si no hay)
    final data = <Map<String, dynamic>>[
      for (final c in cats)
        for (final y in years)
          {
            'year': '$y',
            'cat': c,
            'val': videoJuegos
                .where((j) => j.categoria == c && j.yearLanzamiento == y)
                .length,
          },
    ];

    return SizedBox(
      height: 300,
      child: Chart(
        padding: (_) => const EdgeInsets.fromLTRB(40, 20, 20, 40),
        data: data,
        variables: {
          'year': Variable(accessor: (Map m) => m['year'] as String),
          'cat': Variable(accessor: (Map m) => m['cat'] as String),
          'val': Variable(
            accessor: (Map m) => m['val'] as num,
            scale: LinearScale(min: 0),
          ),
        },
        marks: [
          AreaMark(
            position: Varset('year') * Varset('val') / Varset('cat'),
            color: ColorEncode(
              variable: 'cat',
              values: [Colors.amber, Colors.deepOrange, Colors.teal],
            ),
            modifiers: [StackModifier()],
          ),
        ],
        axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
      ),
    );
  }
}