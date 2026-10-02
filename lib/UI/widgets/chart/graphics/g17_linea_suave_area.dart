import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Horas jugadas mensuales promedio por año de lanzamiento (línea suave + área).
class G17LineaSuaveArea extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G17LineaSuaveArea({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) return const Center(child: Text('Sin datos'));

    final porYear = <int, List<VideoJuego>>{};
    for (final j in videoJuegos) {
      porYear.putIfAbsent(j.yearLanzamiento, () => []).add(j);
    }
    final years = porYear.keys.toList()..sort();

    final data = <Map<String, dynamic>>[
      for (final y in years)
        {
          't': '$y',
          'v': porYear[y]!
                  .fold<int>(0, (a, j) => a + j.horasJugadasMensuales) /
              porYear[y]!.length,
        },
    ];

    return SizedBox(
      height: 300,
      child: Chart(
        padding: (_) => const EdgeInsets.fromLTRB(60, 20, 20, 40),
        data: data,
        variables: {
          't': Variable(accessor: (Map m) => m['t'] as String),
          'v': Variable(
            accessor: (Map m) => m['v'] as num,
            scale: LinearScale(min: 0),
          ),
        },
        marks: [
          AreaMark(
            shape: ShapeEncode(value: BasicAreaShape(smooth: true)),
            color: ColorEncode(value: Colors.cyan.withValues(alpha: 0.4)),
          ),
          LineMark(
            shape: ShapeEncode(value: BasicLineShape(smooth: true)),
            size: SizeEncode(value: 3),
            color: ColorEncode(value: Colors.amberAccent),
          ),
        ],
        axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
      ),
    );
  }
}