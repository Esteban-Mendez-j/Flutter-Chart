import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Puntaje de los 8 mejores videojuegos, con tooltip al tocar un punto.
class G18InteractivoTooltip extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G18InteractivoTooltip({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) return const Center(child: Text('Sin datos'));

    final top = [...videoJuegos]..sort((a, b) => b.puntaje.compareTo(a.puntaje));

    final data = <Map<String, dynamic>>[
      for (final j in top.take(8)) {'p': j.nombre, 'val': j.puntaje},
    ];

    return SizedBox(
      height: 300,
      child: Chart(
        padding: (_) => const EdgeInsets.fromLTRB(40, 20, 20, 40),
        data: data,
        variables: {
          'p': Variable(accessor: (Map m) => m['p'] as String),
          'val': Variable(accessor: (Map m) => m['val'] as num),
        },
        marks: [
          LineMark(color: ColorEncode(value: Colors.green)),
          PointMark(
            size: SizeEncode(value: 8),
            color: ColorEncode(value: Colors.greenAccent),
          ),
        ],
        selections: {
          // Cambié longPress por hover (longPress no es un GestureType válido
          // en todas las versiones).
          'touch': PointSelection(on: {GestureType.tap, GestureType.hover}),
        },
        tooltip: TooltipGuide(
          followPointer: [true, true],
          align: Alignment.topLeft,
        ),
        axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
      ),
    );
  }
}