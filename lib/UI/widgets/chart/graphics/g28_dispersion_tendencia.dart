import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Dispersión: duración promedio (horas) vs puntaje, con línea de tendencia.
class G28DispersionTendencia extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G28DispersionTendencia({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    final juegos = videoJuegos.take(40).toList();
    if (juegos.length < 2) return const Center(child: Text('Sin datos'));

    final xs = juegos.map((j) => j.duracionPromedioHoras).toList();
    final ys = juegos.map((j) => j.puntaje).toList();
    final n = xs.length;

    // Regresión lineal simple: y = a + b*x
    final mx = xs.reduce((a, b) => a + b) / n;
    final my = ys.reduce((a, b) => a + b) / n;
    var numerador = 0.0, denominador = 0.0;
    for (var i = 0; i < n; i++) {
      numerador += (xs[i] - mx) * (ys[i] - my);
      denominador += (xs[i] - mx) * (xs[i] - mx);
    }
    final b = denominador == 0 ? 0.0 : numerador / denominador;
    final a = my - b * mx;

    final tendencia = xs.map((x) => a + b * x).toList();
    final data = <Map<String, dynamic>>[
      for (var i = 0; i < n; i++)
        {'x': xs[i], 'y': ys[i], 'tendencia': tendencia[i]},
    ];

    final minX = xs.reduce(min), maxX = xs.reduce(max);
    final todosY = [...ys, ...tendencia];
    final minYv = todosY.reduce(min), maxYv = todosY.reduce(max);
    final padY = (maxYv - minYv) * 0.1 + 0.1;

    return SizedBox(
      height: 300,
      child: Chart(
        padding: (_) => const EdgeInsets.fromLTRB(40, 20, 20, 40),
        data: data,
        variables: {
          'x': Variable(
            accessor: (Map m) => m['x'] as num,
            scale: LinearScale(min: minX - 1, max: maxX + 1),
          ),
          'y': Variable(
            accessor: (Map m) => m['y'] as num,
            scale: LinearScale(min: minYv - padY, max: maxYv + padY),
          ),
          'tendencia': Variable(
            accessor: (Map m) => m['tendencia'] as num,
            scale: LinearScale(min: minYv - padY, max: maxYv + padY),
          ),
        },
        marks: [
          PointMark(
            position: Varset('x') * Varset('y'),
            size: SizeEncode(value: 8),
            color: ColorEncode(value: Colors.blue),
          ),
          LineMark(
            position: Varset('x') * Varset('tendencia'),
            size: SizeEncode(value: 2),
            color: ColorEncode(value: Colors.red),
          ),
        ],
        axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
      ),
    );
  }
}
