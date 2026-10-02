import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Gantt: periodo de lanzamientos (primer año -> último año) de las 8
/// categorías con más videojuegos.
///
/// Se dibuja con barras apiladas: un tramo transparente (desde el año mínimo
/// hasta el inicio) + un tramo visible (la duración). Es más compatible entre
/// versiones de graphic que la barra de rango "(inicio + fin)".
class G24Gantt extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G24Gantt({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) return const Center(child: Text('Sin datos'));

    final rangos = <String, List<int>>{};
    final conteo = <String, int>{};
    for (final j in videoJuegos) {
      final r = rangos.putIfAbsent(
        j.categoria,
        () => [j.yearLanzamiento, j.yearLanzamiento],
      );
      r[0] = min(r[0], j.yearLanzamiento);
      r[1] = max(r[1], j.yearLanzamiento);
      conteo[j.categoria] = (conteo[j.categoria] ?? 0) + 1;
    }

    // Solo las 8 categorías más frecuentes, para que se lea bien
    final cats = (conteo.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value)))
        .take(8)
        .map((e) => e.key)
        .toList();

    final minY = cats.map((c) => rangos[c]![0]).reduce(min);
    final maxY = cats.map((c) => rangos[c]![1]).reduce(max) + 1;
    final span = (maxY - minY).toDouble();

    // Valores relativos al año mínimo; la etiqueta del eje suma minY de vuelta.
    final data = <Map<String, dynamic>>[
      for (final c in cats)
        {'categoria': c, 'tramo': '1_Inicio', 'v': rangos[c]![0] - minY},
      for (final c in cats)
        {
          'categoria': c,
          'tramo': '2_Duracion',
          'v': rangos[c]![1] + 1 - rangos[c]![0], // +1: un solo año = 1 de ancho
        },
    ];

    return SizedBox(
      height: 300,
      child: Chart(
        padding: (_) => const EdgeInsets.fromLTRB(100, 20, 20, 40),
        data: data,
        variables: {
          'categoria': Variable(accessor: (Map m) => m['categoria'] as String),
          'tramo': Variable(accessor: (Map m) => m['tramo'] as String),
          'v': Variable(
            accessor: (Map m) => m['v'] as num,
            scale: LinearScale(
              min: 0,
              max: span,
              formatter: (n) => (n + minY).toInt().toString(),
            ),
          ),
        },
        coord: RectCoord(transposed: true),
        marks: [
          IntervalMark(
            position: Varset('categoria') * Varset('v') / Varset('tramo'),
            size: SizeEncode(value: 16),
            color: ColorEncode(
              variable: 'tramo',
              values: const [
                Color(0x00000000), // tramo vacío
                Color(0xFF42A5F5), // barra visible
              ],
            ),
            modifiers: [StackModifier()],
          ),
        ],
        axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
      ),
    );
  }
}