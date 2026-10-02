import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Top 6 videojuegos por jugadores activos (barras horizontales).
class G2BarrasHorizontales extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G2BarrasHorizontales({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) return const Center(child: Text('Sin datos'));

    final top = [...videoJuegos]
      ..sort((a, b) => b.jugadoresActivos.compareTo(a.jugadoresActivos));

    final data = <Map<String, dynamic>>[
      for (final j in top.take(6))
        {'nombre': j.nombre, 'jugadores': j.jugadoresActivos},
    ];

    return SizedBox(
      height: 300,
      child: Chart(
        padding: (_) => const EdgeInsets.fromLTRB(110, 20, 20, 40),
        data: data,
        variables: {
          'nombre': Variable(accessor: (Map m) => m['nombre'] as String),
          'jugadores': Variable(
            accessor: (Map m) => m['jugadores'] as num,
            scale: LinearScale(min: 0),
          ),
        },
        coord: RectCoord(transposed: true),
        marks: [IntervalMark()],
        axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
      ),
    );
  }
}