import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Distribución de videojuegos por modelo de negocio.
class G6CircularPie extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G6CircularPie({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) return const Center(child: Text('Sin datos'));

    final conteo = <String, int>{};
    for (final j in videoJuegos) {
      conteo[j.modeloNegocio] = (conteo[j.modeloNegocio] ?? 0) + 1;
    }

    final data = <Map<String, dynamic>>[
      for (final e in conteo.entries) {'categoria': e.key, 'valor': e.value},
    ];

    return SizedBox(
      height: 300,
      child: Chart(
        data: data,
        variables: {
          'categoria': Variable(accessor: (Map m) => m['categoria'] as String),
          'valor': Variable(accessor: (Map m) => m['valor'] as num),
        },
        transforms: [Proportion(variable: 'valor', as: 'percent')],
        marks: [
          IntervalMark(
            position: Varset('percent') / Varset('categoria'),
            color: ColorEncode(variable: 'categoria', values: Defaults.colors10),
            modifiers: [StackModifier()],
          ),
        ],
        coord: PolarCoord(transposed: true, dimCount: 1),
      ),
    );
  }
}