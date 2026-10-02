import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Por categoría (top 5): eje Y = puntaje promedio, tamaño = cantidad de juegos.
class G30BurbujasCategorias extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G30BurbujasCategorias({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) return const Center(child: Text('Sin datos'));

    final conteo = <String, int>{};
    for (final j in videoJuegos) {
      conteo[j.categoria] = (conteo[j.categoria] ?? 0) + 1;
    }
    final cats = (conteo.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value)))
        .take(5)
        .map((e) => e.key)
        .toList();

    final data = <Map<String, dynamic>>[
      for (final c in cats)
        {
          'ejeX': c,
          'ejeY': videoJuegos
                  .where((j) => j.categoria == c)
                  .fold<double>(0, (a, j) => a + j.puntaje) /
              conteo[c]!,
          'tam': conteo[c]!,
        },
    ];

    return SizedBox(
      height: 300,
      child: Chart(
        padding: (_) => const EdgeInsets.fromLTRB(40, 20, 20, 40),
        data: data,
        variables: {
          'ejeX': Variable(accessor: (Map m) => m['ejeX'] as String),
          'ejeY': Variable(accessor: (Map m) => m['ejeY'] as num),
          'tam': Variable(accessor: (Map m) => m['tam'] as num),
        },
        marks: [
          PointMark(
            size: SizeEncode(variable: 'tam', values: [8, 28]),
            color: ColorEncode(variable: 'ejeX', values: Defaults.colors10),
          ),
        ],
        axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
      ),
    );
  }
}