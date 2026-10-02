import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Precio (X), puntaje (Y), tamaño = horas jugadas mensuales,
/// color = mundo abierto / lineal. Usa los primeros 40 videojuegos.
class G26PuntosTamanoColor extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G26PuntosTamanoColor({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) return const Center(child: Text('Sin datos'));

    final data = <Map<String, dynamic>>[
      for (final j in videoJuegos.take(40))
        {
          'x': j.precio,
          'y': j.puntaje,
          'z': j.horasJugadasMensuales,
          'cat': j.esMundoAbierto ? 'Mundo abierto' : 'Lineal',
        },
    ];

    return SizedBox(
      height: 300,
      child: Chart(
        padding: (_) => const EdgeInsets.fromLTRB(40, 20, 20, 40),
        data: data,
        variables: {
          'x': Variable(accessor: (Map m) => m['x'] as num),
          'y': Variable(accessor: (Map m) => m['y'] as num),
          'z': Variable(accessor: (Map m) => m['z'] as num),
          'cat': Variable(accessor: (Map m) => m['cat'] as String),
        },
        marks: [
          PointMark(
            size: SizeEncode(variable: 'z', values: [6, 18]),
            color: ColorEncode(
              variable: 'cat',
              values: [Colors.purple, Colors.orange],
            ),
          ),
        ],
        axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
      ),
    );
  }
}