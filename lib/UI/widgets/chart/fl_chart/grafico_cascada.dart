import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class GraficoCascada extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoCascada({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) {
      return const Center(
        child: Text('No hay datos para el gráfico de cascada'),
      );
    }

    final juego = videoJuegos.first;

    final double ingresosTotales = (juego.ingresosEstimados / 1000000);
    final double costoDesarrollo = (juego.costoDesarrollo / 1000000);
    final double marketingOps = ingresosTotales * 0.18;
    final double comisionesTienda = ingresosTotales * 0.30;
    final double utilidadNeta =
        ingresosTotales - costoDesarrollo - marketingOps - comisionesTienda;

    final double paso1Inicio = 0.0;
    final double paso1Fin = ingresosTotales;

    final double paso2Inicio = paso1Fin;
    final double paso2Fin = paso2Inicio - costoDesarrollo;

    final double paso3Inicio = paso2Fin;
    final double paso3Fin = paso3Inicio - marketingOps;

    final double paso4Inicio = paso3Fin;
    final double paso4Fin = paso4Inicio - comisionesTienda;

    final double paso5Inicio = 0.0;
    final double paso5Fin = utilidadNeta;

    final etapas = [
      {
        'nombre': 'Ingresos',
        'from': paso1Inicio,
        'to': paso1Fin,
        'color': Colors.green.shade600,
      },
      {
        'nombre': 'Dev Cost',
        'from': paso2Inicio,
        'to': paso2Fin,
        'color': Colors.red.shade400,
      },
      {
        'nombre': 'Mkt & Ops',
        'from': paso3Inicio,
        'to': paso3Fin,
        'color': Colors.red.shade400,
      },
      {
        'nombre': 'Tiendas',
        'from': paso4Inicio,
        'to': paso4Fin,
        'color': Colors.red.shade400,
      },
      {
        'nombre': 'Neto',
        'from': paso5Inicio,
        'to': paso5Fin,
        'color': Colors.blue.shade700,
      },
    ];

    return Column(
      children: [
        Text(
          'Flujo Financiero y Margen Neto - ${juego.nombre}',
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Expanded(
          child: BarChart(
            BarChartData(
              maxY: ingresosTotales * 1.15,
              minY: utilidadNeta < 0 ? utilidadNeta * 1.2 : 0,
              gridData: const FlGridData(show: true, drawVerticalLine: false),
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: AxisTitles(
                  axisNameWidget: const Text(
                    'Millones (\$M)',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                  ),
                  sideTitles: const SideTitles(
                    showTitles: true,
                    reservedSize: 60,
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 32,
                    getTitlesWidget: (value, meta) {
                      final idx = value.toInt();
                      if (idx < 0 || idx >= etapas.length) {
                        return const SizedBox();
                      }
                      return SideTitleWidget(
                        meta: meta,
                        child: Text(
                          etapas[idx]['nombre'] as String,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              barGroups: List.generate(etapas.length, (index) {
                final etapa = etapas[index];
                final fromY = etapa['from'] as double;
                final toY = etapa['to'] as double;
                final color = etapa['color'] as Color;

                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      fromY: fromY,
                      toY: toY,
                      color: color,
                      width: 28,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
