import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Coordenadas paralelas: 5 métricas normalizadas (0-100) de los 5 mejores
/// videojuegos por puntaje. Cada métrica se normaliza contra su máximo.
class G32CoordenadasParalelas extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G32CoordenadasParalelas({super.key, required this.videoJuegos});

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

    // Máximo de cada métrica (evita dividir entre 0)
    final maximos = {
      for (final e in metricas.entries)
        e.key: max(1e-9, videoJuegos.map(e.value).reduce(max)),
    };

    final top = [...videoJuegos]..sort((a, b) => b.puntaje.compareTo(a.puntaje));

    final data = <Map<String, dynamic>>[
      for (final j in top.take(5))
        for (final e in metricas.entries)
          {
            'dim': e.key,
            'valor': e.value(j) / maximos[e.key]! * 100,
            'grupo': j.nombre,
          },
    ];

    return SizedBox(
      height: 320,
      child: Chart(
        padding: (_) => const EdgeInsets.fromLTRB(40, 20, 30, 40),
        data: data,
        variables: {
          'dim': Variable(accessor: (Map m) => m['dim'] as String),
          'valor': Variable(
            accessor: (Map m) => m['valor'] as num,
            scale: LinearScale(min: 0, max: 100),
          ),
          'grupo': Variable(accessor: (Map m) => m['grupo'] as String),
        },
        marks: [
          LineMark(
            position: Varset('dim') * Varset('valor') / Varset('grupo'),
            size: SizeEncode(value: 2.5),
            color: ColorEncode(
              variable: 'grupo',
              values: Defaults.colors10,
            ),
          ),
        ],
        axes: [
          // Si AxisGuide da error, usa Defaults.horizontalAxis
          AxisGuide(
            line: PaintStyle(strokeColor: Colors.grey, strokeWidth: 1),
            grid: PaintStyle(strokeColor: Colors.grey.shade400, strokeWidth: 1),
            label: LabelStyle(
              textStyle: const TextStyle(fontSize: 10, color: Colors.black54),
              offset: const Offset(0, 7.5),
            ),
          ),
          Defaults.verticalAxis,
        ],
      ),
    );
  }
}