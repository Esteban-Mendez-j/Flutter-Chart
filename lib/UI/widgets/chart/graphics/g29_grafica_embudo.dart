import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Embudo: totales de ventas, jugadores activos y valoraciones positivas,
/// ordenados de mayor a menor.
class G29GraficoEmbudo extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G29GraficoEmbudo({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) return const Center(child: Text('Sin datos'));

    int suma(int Function(VideoJuego) f) =>
        videoJuegos.fold<int>(0, (acc, j) => acc + f(j));

    final etapas = <Map<String, dynamic>>[
      {'etapa': 'Ventas', 'n': suma((j) => j.numeroVentas)},
      {'etapa': 'Jugadores activos', 'n': suma((j) => j.jugadoresActivos)},
      {'etapa': 'Valoraciones +', 'n': suma((j) => j.valoracionesPositivas)},
    ]..sort((a, b) => (b['n'] as int).compareTo(a['n'] as int));

    return SizedBox(
      height: 300,
      child: Chart(
        padding: (_) => const EdgeInsets.fromLTRB(110, 20, 20, 20),
        data: etapas,
        variables: {
          'etapa': Variable(accessor: (Map m) => m['etapa'] as String),
          'n': Variable(
            accessor: (Map m) => m['n'] as num,
            scale: LinearScale(min: 0),
          ),
        },
        coord: RectCoord(transposed: true),
        marks: [
          IntervalMark(
            position: Varset('etapa') * Varset('n'),
            size: SizeEncode(value: 44),
            color: ColorEncode(variable: 'etapa', values: Defaults.colors10),
            modifiers: [SymmetricModifier()],
            label: LabelEncode(
              encoder: (tuple) => Label(
                '${tuple['n']}',
                LabelStyle(
                  textStyle: const TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        ],
        axes: [Defaults.horizontalAxis],
      ),
    );
  }
}
