import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Dispersión: precio (X) vs puntaje (Y).
class G4PuntosScatter extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G4PuntosScatter({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) return const Center(child: Text('Sin datos'));

    final data = <Map<String, dynamic>>[
      for (final j in videoJuegos.take(100)) {'x': j.precio, 'y': j.puntaje},
    ];

    return SizedBox(
      height: 300,
      child: Chart(
        padding: (_) => const EdgeInsets.fromLTRB(40, 20, 20, 40),
        data: data,
        variables: {
          'x': Variable(accessor: (Map m) => m['x'] as num),
          'y': Variable(accessor: (Map m) => m['y'] as num),
        },
        marks: [
          PointMark(
            size: SizeEncode(value: 8),
            color: ColorEncode(value: Colors.deepPurple),
          ),
        ],
        axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
      ),
    );
  }
}