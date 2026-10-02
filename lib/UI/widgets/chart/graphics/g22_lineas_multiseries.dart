import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Precio promedio por año de lanzamiento: mundo abierto vs lineal.
class G22LineasMultiseries extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G22LineasMultiseries({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) return const Center(child: Text('Sin datos'));

    final years = videoJuegos.map((j) => j.yearLanzamiento).toSet().toList()
      ..sort();

    final data = <Map<String, dynamic>>[];
    for (final abierto in [true, false]) {
      for (final y in years) {
        final lista = videoJuegos
            .where((j) => j.yearLanzamiento == y && j.esMundoAbierto == abierto)
            .toList();
        if (lista.isEmpty) continue;
        data.add({
          'year': '$y',
          'val': lista.fold<double>(0, (a, j) => a + j.precio) / lista.length,
          'grupo': abierto ? 'Mundo abierto' : 'Lineal',
        });
      }
    }

    return SizedBox(
      height: 300,
      child: Chart(
        padding: (_) => const EdgeInsets.fromLTRB(50, 20, 20, 40),
        data: data,
        variables: {
          'year': Variable(accessor: (Map m) => m['year'] as String),
          'val': Variable(accessor: (Map m) => m['val'] as num),
          'grupo': Variable(accessor: (Map m) => m['grupo'] as String),
        },
        marks: [
          LineMark(
            // "/ Varset('grupo')" dibuja una línea por serie
            position: Varset('year') * Varset('val') / Varset('grupo'),
            color: ColorEncode(
              variable: 'grupo',
              values: [Colors.blue, Colors.teal],
            ),
          ),
        ],
        axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
      ),
    );
  }
}