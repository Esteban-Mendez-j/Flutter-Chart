import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class GraficoDona extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoDona({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Cuota de Mercado por Ingresos Estimados (Dona)',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 14,
          runSpacing: 6,
          alignment: WrapAlignment.center,
          children: List.generate(videoJuegos.length, (index) {
            final game = videoJuegos[index];

            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.primaries[index % Colors.primaries.length],
                  ),
                ),
                const SizedBox(width: 4),
                Text(game.nombre, style: const TextStyle(fontSize: 11)),
              ],
            );
          }),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: PieChart(
            PieChartData(
              sectionsSpace: 3,
              centerSpaceRadius: 35,
              sections: List.generate(videoJuegos.length, (index) {
                final game = videoJuegos[index];
                final color = Colors.primaries[index % Colors.primaries.length];
                final ingresosB = game.ingresosEstimados / 1000000000;

                return PieChartSectionData(
                  value: ingresosB > 0 ? ingresosB : 1.0,
                  title: '\$${ingresosB.toStringAsFixed(1)}B',
                  color: color,
                  radius: 65,
                  titleStyle: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
