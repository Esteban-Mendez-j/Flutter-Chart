import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Cantidad acumulada de videojuegos lanzados por año.
/// Nota: graphic no tiene área escalonada; el área es normal y la línea
/// superior sí es escalonada.
class G27AreaEscalonada extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G27AreaEscalonada({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) return const Center(child: Text('Sin datos'));

    final conteo = <int, int>{};
    for (final j in videoJuegos) {
      conteo[j.yearLanzamiento] = (conteo[j.yearLanzamiento] ?? 0) + 1;
    }
    final years = conteo.keys.toList()..sort();

    var acumulado = 0;
    final data = <Map<String, dynamic>>[
      for (final y in years) {'paso': '$y', 'val': acumulado += conteo[y]!},
    ];

    return SizedBox(
      height: 300,
      child: Chart(
        padding: (_) => const EdgeInsets.fromLTRB(40, 20, 20, 40),
        data: data,
        variables: {
          'paso': Variable(accessor: (Map m) => m['paso'] as String),
          'val': Variable(
            accessor: (Map m) => m['val'] as num,
            scale: LinearScale(min: 0),
          ),
        },
        marks: [
          AreaMark(color: ColorEncode(value: Colors.cyan)),
          LineMark(
            shape: ShapeEncode(value: BasicLineShape(smooth: false)),
            color: ColorEncode(value: Colors.cyanAccent),
          ),
        ],
        axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
      ),
    );
  }
}
