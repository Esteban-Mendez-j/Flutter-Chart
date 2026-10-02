import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Ventas acumuladas por año de lanzamiento (línea escalonada).
class G11LineaEscalonada extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G11LineaEscalonada({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) return const Center(child: Text('Sin datos'));

    final ventas = <int, int>{};
    for (final j in videoJuegos) {
      ventas[j.yearLanzamiento] =
          (ventas[j.yearLanzamiento] ?? 0) + j.numeroVentas;
    }
    final years = ventas.keys.toList()..sort();

    var acumulado = 0;
    final data = <Map<String, dynamic>>[
      for (final y in years)
        {'year': '$y', 'acumulado': acumulado += ventas[y]!},
    ];

    return SizedBox(
      height: 300,
      child: Chart(
        padding: (_) => const EdgeInsets.fromLTRB(60, 20, 20, 40),
        data: data,
        variables: {
          'year': Variable(accessor: (Map m) => m['year'] as String),
          'acumulado': Variable(accessor: (Map m) => m['acumulado'] as num),
        },
        marks: [
          LineMark(
            
            shape: ShapeEncode(value: BasicLineShape(smooth: false)),
            size: SizeEncode(value: 3),
          ),
        ],
        axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
      ),
    );
  }
}