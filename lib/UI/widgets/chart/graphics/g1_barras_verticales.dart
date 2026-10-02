import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Top 6 videojuegos por número de ventas.
class G1BarrasVerticales extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G1BarrasVerticales({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) return const Center(child: Text('Sin datos'));

    final top = [...videoJuegos]
      ..sort((a, b) => b.numeroVentas.compareTo(a.numeroVentas));

    final data = <Map<String, dynamic>>[
      for (final j in top.take(6)) {'nombre': j.nombre, 'ventas': j.numeroVentas},
    ];

    return SizedBox(
      height: 300,
      child: Chart(
        padding: (_) => const EdgeInsets.fromLTRB(60, 20, 20, 40),
        data: data,
        variables: {
          'nombre': Variable(accessor: (Map m) => m['nombre'] as String),
          'ventas': Variable(
            accessor: (Map m) => m['ventas'] as num,
            scale: LinearScale(min: 0),
          ),
        },
        marks: [IntervalMark()],
        axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
      ),
    );
  }
}