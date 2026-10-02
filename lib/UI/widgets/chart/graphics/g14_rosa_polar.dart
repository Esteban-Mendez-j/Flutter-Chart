import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Cantidad de videojuegos por plataforma (top 8).
class G14RosaPolar extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G14RosaPolar({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) return const Center(child: Text('Sin datos'));

    final conteo = <String, int>{};
    for (final j in videoJuegos) {
      for (final p in j.plataformas) {
        conteo[p] = (conteo[p] ?? 0) + 1;
      }
    }
    final top = (conteo.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value)))
        .take(8)
        .toList();

    final data = <Map<String, dynamic>>[
      for (final e in top) {'plataforma': e.key, 'cantidad': e.value},
    ];

    return SizedBox(
      height: 300,
      child: Chart(
        data: data,
        variables: {
          'plataforma': Variable(accessor: (Map m) => m['plataforma'] as String),
          'cantidad': Variable(accessor: (Map m) => m['cantidad'] as num),
        },
        coord: PolarCoord(),
        marks: [
          IntervalMark(
            color: ColorEncode(variable: 'plataforma', values: Defaults.colors10),
          ),
        ],
      ),
    );
  }
}