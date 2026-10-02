import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// % de videojuegos de mundo abierto vs lineales por categoría (top 5).
class G23BarrasPorcentaje100 extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G23BarrasPorcentaje100({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) return const Center(child: Text('Sin datos'));

    final conteo = <String, int>{};
    for (final j in videoJuegos) {
      conteo[j.categoria] = (conteo[j.categoria] ?? 0) + 1;
    }
    final cats = (conteo.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value)))
        .take(5)
        .map((e) => e.key)
        .toList();

    final data = <Map<String, dynamic>>[];
    for (final c in cats) {
      final total = conteo[c]!;
      final abiertos =
          videoJuegos.where((j) => j.categoria == c && j.esMundoAbierto).length;
      data.add({'cat': c, 'pct': abiertos / total * 100, 'tipo': 'Mundo abierto'});
      data.add({
        'cat': c,
        'pct': (total - abiertos) / total * 100,
        'tipo': 'Lineal',
      });
    }

    return SizedBox(
      height: 300,
      child: Chart(
        padding: (_) => const EdgeInsets.fromLTRB(50, 20, 20, 40),
        data: data,
        variables: {
          'cat': Variable(accessor: (Map m) => m['cat'] as String),
          'pct': Variable(
            accessor: (Map m) => m['pct'] as num,
            scale: LinearScale(min: 0, max: 100),
          ),
          'tipo': Variable(accessor: (Map m) => m['tipo'] as String),
        },
        marks: [
          IntervalMark(
            position: Varset('cat') * Varset('pct') / Varset('tipo'),
            modifiers: [StackModifier()],
            color: ColorEncode(
              variable: 'tipo',
              values: [Colors.blue, Colors.orange],
            ),
          ),
        ],
        axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
      ),
    );
  }
}