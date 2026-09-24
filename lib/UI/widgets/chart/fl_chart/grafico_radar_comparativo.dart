import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class GraficoRadarComparativo extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoRadarComparativo({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    final juegos = videoJuegos.take(3).toList();
    final colors = [Colors.blue, Colors.orange, Colors.green];

    return Column(
      children: [
        const Text(
          'Comparativa Multidimensional: Top 3 Videojuegos',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 12,
          runSpacing: 4,
          alignment: WrapAlignment.center,
          children: juegos.asMap().entries.map((entry) {
            final color = colors[entry.key % colors.length];
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: 10, height: 10, color: color),
                const SizedBox(width: 4),
                Text(
                  entry.value.nombre,
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                ),
              ],
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: RadarChart(
            RadarChartData(
              radarShape: RadarShape.polygon,
              titleTextStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              getTitle: (index, angle) {
                const titulos = ['Puntaje', 'Ventas Totales', 'Jugadores', 'Duración'];
                return RadarChartTitle(text: titulos[index]);
              },
              dataSets: juegos.asMap().entries.map((entry) {
                final idx = entry.key;
                final juego = entry.value;
                final color = colors[idx % colors.length];

                final puntajeNorm = juego.puntaje; // 0 - 10
                final ventasNorm = (juego.numeroVentas / 300000000).clamp(0.0, 1.0) * 10;
                final jugadoresNorm = (juego.jugadoresActivos / 200000000).clamp(0.0, 1.0) * 10;
                final horasNorm = (juego.duracionPromedioHoras / 100).clamp(0.0, 1.0) * 10;

                return RadarDataSet(
                  fillColor: color.withValues(alpha: 0.2),
                  borderColor: color,
                  borderWidth: 2,
                  entryRadius: 3,
                  dataEntries: [
                    RadarEntry(value: puntajeNorm),
                    RadarEntry(value: ventasNorm),
                    RadarEntry(value: jugadoresNorm),
                    RadarEntry(value: horasNorm),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
