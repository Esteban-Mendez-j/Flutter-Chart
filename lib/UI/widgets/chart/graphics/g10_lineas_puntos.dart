import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Ventas totales por año de lanzamiento (línea + puntos).
class G10LineasPuntos extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G10LineasPuntos({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) return const Center(child: Text('Sin datos'));

    final ventas = <int, int>{};
    for (final j in videoJuegos) {
      ventas[j.yearLanzamiento] =
          (ventas[j.yearLanzamiento] ?? 0) + j.numeroVentas;
    }
    final years = ventas.keys.toList()..sort();

    final data = <Map<String, dynamic>>[
      for (final y in years) {'x': '$y', 'y': ventas[y]!},
    ];

    return SizedBox(
      height: 300,
      child: Chart(
        padding: (_) => const EdgeInsets.fromLTRB(60, 20, 20, 40),
        data: data,
        variables: {
          'x': Variable(accessor: (Map m) => m['x'] as String),
          'y': Variable(accessor: (Map m) => m['y'] as num),
        },
        marks: [
          LineMark(color: ColorEncode(value: Colors.redAccent)),
          PointMark(
            size: SizeEncode(value: 7),
            color: ColorEncode(value: Colors.redAccent),
          ),
        ],
        axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
      ),
    );
  }
}