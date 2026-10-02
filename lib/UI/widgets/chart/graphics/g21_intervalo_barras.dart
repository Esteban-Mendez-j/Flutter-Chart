import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Precio mínimo y máximo por categoría (top 5).
class G21IntervaloBarras extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G21IntervaloBarras({super.key, required this.videoJuegos});

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

    final data = <Map<String, dynamic>>[];
    for (final c in cats) {
      final precios =
          videoJuegos.where((j) => j.categoria == c).map((j) => j.precio);
      data.add({'x': c, 'val': precios.reduce(min), 'tipo': 'Mínimo'});
      data.add({'x': c, 'val': precios.reduce(max), 'tipo': 'Máximo'});
    }

    return SizedBox(
      height: 300,
      child: Chart(
        padding: (_) => const EdgeInsets.fromLTRB(50, 20, 20, 40),
        data: data,
        variables: {
          'x': Variable(accessor: (Map m) => m['x'] as String),
          'val': Variable(
            accessor: (Map m) => m['val'] as num,
            scale: LinearScale(min: 0),
          ),
          'tipo': Variable(accessor: (Map m) => m['tipo'] as String),
        },
        marks: [
          IntervalMark(
            // "/ Varset('tipo')" agrupa para que Dodge ponga las barras lado a lado
            position: Varset('x') * Varset('val') / Varset('tipo'),
            modifiers: [DodgeModifier()],
            color: ColorEncode(
              variable: 'tipo',
              values: [Colors.orange.shade300, Colors.deepOrange],
            ),
          ),
        ],
        axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
      ),
    );
  }
}