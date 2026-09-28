import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/UI/widgets/chart/widgets_view/construir_ejes_combinables.dart';

class GraficoLineasConDispersion extends StatelessWidget {
  const GraficoLineasConDispersion({super.key});

  @override
  Widget build(BuildContext context) {
    final etiquetas = ['Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb', 'Dom'];
    final tendencia = [20.0, 28.0, 25.0, 34.0, 40.0, 38.0, 45.0];
    final real = [18.0, 31.0, 22.0, 37.0, 36.0, 41.0, 43.0];

    return Stack(
      children: [
        LineChart(
          LineChartData(
            minX: 0,
            maxX: etiquetas.length - 1,
            minY: 0,
            maxY: 50,
            titlesData: construirEjesCombinables(
              nombreEjeX: 'Día',
              nombreEjeY: 'Temperatura (°C)',
              etiquetasX: etiquetas,
            ),
            gridData: const FlGridData(show: true),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: Colors.grey.shade300),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: List.generate(
                  tendencia.length,
                  (i) => FlSpot(i.toDouble(), tendencia[i]),
                ),
                isCurved: true,
                color: Colors.deepPurple,
                barWidth: 3,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.deepPurple.withValues(alpha: 0.08),
                ),
              ),
            ],
          ),
        ),
        IgnorePointer(
          child: ScatterChart(
            ScatterChartData(
              minX: 0,
              maxX: etiquetas.length - 1,
              minY: 0,
              maxY: 50,
              titlesData: construirEjesCombinables(
                nombreEjeX: 'Día',
                nombreEjeY: 'Temperatura (°C)',
                etiquetasX: etiquetas,
                mostrarTextos: false,
              ),
              gridData: const FlGridData(show: false),
              borderData: FlBorderData(show: false),
              scatterSpots: List.generate(real.length, (i) {
                return ScatterSpot(
                  i.toDouble(),
                  real[i],
                  dotPainter: FlDotCirclePainter(
                    radius: 5,
                    color: Colors.orange,
                    strokeWidth: 1.5,
                    strokeColor: Colors.white,
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
