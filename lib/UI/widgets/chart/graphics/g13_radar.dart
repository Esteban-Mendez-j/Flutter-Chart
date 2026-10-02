import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Radar del videojuego con mejor puntaje: 5 métricas normalizadas (0-100)
/// contra el máximo de todos los videojuegos.
class G13Radar extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G13Radar({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) return const Center(child: Text('Sin datos'));

    final metricas = <String, double Function(VideoJuego)>{
      'Puntaje': (j) => j.puntaje,
      'Duración': (j) => j.duracionPromedioHoras,
      'Precio': (j) => j.precio,
      'Jugadores': (j) => j.jugadoresActivos.toDouble(),
      'Ventas': (j) => j.numeroVentas.toDouble(),
    };

    final mejor =
        ([...videoJuegos]..sort((a, b) => b.puntaje.compareTo(a.puntaje))).first;

    final data = <Map<String, dynamic>>[
      for (final e in metricas.entries)
        {
          'attr': e.key,
          'val': e.value(mejor) /
              max(1e-9, videoJuegos.map(e.value).reduce(max)) *
              100,
        },
    ];


    return SizedBox(
      height: 340,
      child: Column(
        children: [
          Text(
            mejor.nombre,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Chart(
              padding: (_) => const EdgeInsets.all(36),
              data: data,
              variables: {
                'attr': Variable(accessor: (Map m) => m['attr'] as String),
                'val': Variable(
                  accessor: (Map m) => m['val'] as num,
                  scale: LinearScale(min: 0, max: 100),
                ),
              },
              coord: PolarCoord(),
              marks: [
                LineMark(
                

                  shape: ShapeEncode(value: BasicLineShape(loop: true)),
                  size: SizeEncode(value: 2),
                  color: ColorEncode(value: Colors.purple),
                ),
                PointMark(
                  color: ColorEncode(value: Colors.purple),
                  size: SizeEncode(value: 6),
                ),
              ],

              axes: [Defaults.circularAxis, Defaults.radialAxis],
            ),
          ),
        ],
      ),
    );
  }
}