import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graphic/graphic.dart';

/// Duración promedio (horas) por categoría, separando mundo abierto / lineal.
/// Usa las 5 categorías con más videojuegos.
class G8BarrasAgrupadas extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const G8BarrasAgrupadas({super.key, required this.videoJuegos});

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

    // Se rellenan combinaciones vacías con 0 para que las barras se alineen
    final data = <Map<String, dynamic>>[];
    for (final c in cats) {
      for (final abierto in [true, false]) {
        final lista = videoJuegos
            .where((j) => j.categoria == c && j.esMundoAbierto == abierto)
            .toList();
        final prom = lista.isEmpty
            ? 0.0
            : lista.fold<double>(0, (a, j) => a + j.duracionPromedioHoras) /
                lista.length;
        data.add({
          'categoria': c,
          'tipo': abierto ? 'Mundo abierto' : 'Lineal',
          'v': prom,
        });
      }
    }

    return SizedBox(
      height: 300,
      child: Chart(
        padding: (_) => const EdgeInsets.fromLTRB(40, 20, 20, 40),
        data: data,
        variables: {
          'categoria': Variable(accessor: (Map m) => m['categoria'] as String),
          'tipo': Variable(accessor: (Map m) => m['tipo'] as String),
          'v': Variable(
            accessor: (Map m) => m['v'] as num,
            scale: LinearScale(min: 0),
          ),
        },
        marks: [
          IntervalMark(
            position: Varset('categoria') * Varset('v') / Varset('tipo'),
            color: ColorEncode(
              variable: 'tipo',
              values: [Colors.blue, Colors.orange],
            ),
            modifiers: [DodgeModifier()],
          ),
        ],
        axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
      ),
    );
  }
}