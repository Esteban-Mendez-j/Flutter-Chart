import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Mapa de calor: cantidad de videojuegos por categoría (top 6) y dificultad.
class G16MapaCalor extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G16MapaCalor({super.key, required this.videoJuegos});

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
    final dificultades = videoJuegos.map((j) => j.dificultad).toSet().toList()
      ..sort();

    // Todas las celdas (categoría x dificultad), con 0 si no hay juegos
    final data = <Map<String, dynamic>>[
      for (final c in cats)
        for (final d in dificultades)
          {
            'categoria': c,
            'dificultad': d,
            'cantidad': videoJuegos
                .where((j) => j.categoria == c && j.dificultad == d)
                .length,
          },
    ];

    return SizedBox(
      height: 300,
      child: Chart(
        padding: (_) => const EdgeInsets.fromLTRB(80, 20, 20, 40),
        data: data,
        variables: {
          'categoria': Variable(accessor: (Map m) => m['categoria'] as String),
          'dificultad': Variable(accessor: (Map m) => m['dificultad'] as String),
          'cantidad': Variable(accessor: (Map m) => m['cantidad'] as num),
        },
        marks: [
          PolygonMark(
            position: Varset('categoria') * Varset('dificultad'),
            color: ColorEncode(
              variable: 'cantidad',
              values: [Colors.orange.shade100, Colors.deepOrange.shade900],
            ),
            label: LabelEncode(
              encoder: (tuple) => Label(
                '${tuple['cantidad']}',
                LabelStyle(textStyle: const TextStyle(fontSize: 11)),
              ),
            ),
          ),
        ],
        axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
      ),
    );
  }
}