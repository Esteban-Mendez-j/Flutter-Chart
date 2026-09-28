import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraficoBarrasHorizontalesConLinea extends StatelessWidget {
  const GraficoBarrasHorizontalesConLinea({super.key});

  @override
  Widget build(BuildContext context) {
    final categorias = [
      'Producto A',
      'Producto B',
      'Producto C',
      'Producto D',
      'Producto E',
    ];
    final valores = [65.0, 40.0, 82.0, 55.0, 30.0];
    final meta = [70.0, 45.0, 75.0, 60.0, 35.0];

    Widget rotarTexto(Widget hijo) => RotatedBox(quarterTurns: -1, child: hijo);

    FlTitlesData construirEjesRotados({required bool mostrarTextos}) {
      return FlTitlesData(
        show: true,
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          axisNameWidget: mostrarTextos
              ? rotarTexto(
                  const Text(
                    'Producto',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                  ),
                )
              : const SizedBox.shrink(),
          axisNameSize: 60,
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 70,
            getTitlesWidget: (valor, m) {
              if (!mostrarTextos) return const SizedBox.shrink();
              final i = valor.toInt();
              if (i < 0 || i >= categorias.length) return SizedBox.shrink();
              return rotarTexto(
                Text(
                  categorias[i],
                  style: const TextStyle(fontSize: 9),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            },
          ),
        ),
        leftTitles: AxisTitles(
          axisNameWidget: mostrarTextos
              ? rotarTexto(
                  RotatedBox(
                    quarterTurns: 1,
                    child: const Text(
                      'Ventas (k)',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          axisNameSize: 20,
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 28,
            getTitlesWidget: (valor, m) {
              if (!mostrarTextos) return const SizedBox.shrink();
              return rotarTexto(
                Text(
                  valor.toInt().toString(),
                  style: const TextStyle(fontSize: 9),
                ),
              );
            },
          ),
        ),
      );
    }

    return ClipRect(
      child: Stack(
        children: [
          Positioned.fill(
            child: RotatedBox(
              quarterTurns: 1,
              child: BarChart(
                BarChartData(
                  minY: 0,
                  maxY: 100,
                  titlesData: construirEjesRotados(mostrarTextos: true),
                  gridData: const FlGridData(
                    show: true,
                    drawHorizontalLine: false,
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  barGroups: List.generate(valores.length, (i) {
                    return BarChartGroupData(
                      x: i,
                      barRods: [
                        BarChartRodData(
                          toY: valores[i],
                          width: 16,
                          color: Colors.cyan.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: RotatedBox(
                quarterTurns: 1,
                child: LineChart(
                  LineChartData(
                    minX: -0.5,
                    maxX: valores.length - 0.5,
                    minY: 0,
                    maxY: 100,
                    titlesData: construirEjesRotados(mostrarTextos: false),
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: List.generate(
                          meta.length,
                          (i) => FlSpot(i.toDouble(), meta[i]),
                        ),
                        isCurved: false,
                        color: Colors.redAccent,
                        barWidth: 2,
                        dotData: const FlDotData(show: true),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
