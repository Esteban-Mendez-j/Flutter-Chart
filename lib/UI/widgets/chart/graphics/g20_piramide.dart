import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Pirámide: cantidad de videojuegos por clasificación, de mayor a menor.
class G20Piramide extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G20Piramide({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) return const Center(child: Text('Sin datos'));

    final conteo = <String, int>{};
    for (final j in videoJuegos) {
      conteo[j.clasificacion] = (conteo[j.clasificacion] ?? 0) + 1;
    }
    final orden = conteo.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    final data = <Map<String, dynamic>>[
      for (final e in orden) {'fase': e.key, 'cant': e.value},
    ];

    return SizedBox(
      height: 300,
      child: Chart(
        padding: (_) => const EdgeInsets.fromLTRB(80, 20, 20, 20),
        data: data,
        variables: {
          'fase': Variable(accessor: (Map m) => m['fase'] as String),
          'cant': Variable(
            accessor: (Map m) => m['cant'] as num,
            scale: LinearScale(min: 0),
          ),
        },
        coord: RectCoord(transposed: true),
        marks: [
          IntervalMark(
            position: Varset('fase') * Varset('cant'),
            size: SizeEncode(value: 40),
            color: ColorEncode(variable: 'fase', values: Defaults.colors10),
            // Centra las barras para que tomen forma de pirámide
            modifiers: [SymmetricModifier()],
          ),
        ],
        axes: [Defaults.horizontalAxis],
      ),
    );
  }
}