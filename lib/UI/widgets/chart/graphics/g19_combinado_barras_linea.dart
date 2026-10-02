import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Barras = ingresos estimados; línea = costo de desarrollo, por categoría (top 6).
class G19CombinadoBarrasLinea extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G19CombinadoBarrasLinea({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) return const Center(child: Text('Sin datos'));

    final conteo = <String, int>{};
    for (final j in videoJuegos) {
      conteo[j.categoria] = (conteo[j.categoria] ?? 0) + 1;
    }
    final cats = (conteo.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value)))
        .take(6)
        .map((e) => e.key)
        .toList();

    final data = <Map<String, dynamic>>[
      for (final c in cats)
        {
          'categoria': c,
          'real': videoJuegos
              .where((j) => j.categoria == c)
              .fold<double>(0, (a, j) => a + j.ingresosEstimados),
          'meta': videoJuegos
              .where((j) => j.categoria == c)
              .fold<double>(0, (a, j) => a + j.costoDesarrollo),
        },
    ];

    // Misma escala para ambas variables, si no la línea y las barras no
    // se pueden comparar.
    final maxV = data
        .map((d) => max(d['real'] as double, d['meta'] as double))
        .reduce(max);

    return SizedBox(
      height: 300,
      child: Chart(
        padding: (_) => const EdgeInsets.fromLTRB(70, 20, 20, 40),
        data: data,
        variables: {
          'categoria': Variable(accessor: (Map m) => m['categoria'] as String),
          'real': Variable(
            accessor: (Map m) => m['real'] as num,
            scale: LinearScale(min: 0, max: maxV * 1.1),
          ),
          'meta': Variable(
            accessor: (Map m) => m['meta'] as num,
            scale: LinearScale(min: 0, max: maxV * 1.1),
          ),
        },
        marks: [
          IntervalMark(
            position: Varset('categoria') * Varset('real'),
            color: ColorEncode(value: Colors.lightBlue),
          ),
          LineMark(
            position: Varset('categoria') * Varset('meta'),
            color: ColorEncode(value: Colors.red),
            size: SizeEncode(value: 3),
          ),
        ],
        axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
      ),
    );
  }
}