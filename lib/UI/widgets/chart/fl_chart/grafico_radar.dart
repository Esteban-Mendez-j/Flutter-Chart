import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class GraficoRadar extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoRadar({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    final juego = videoJuegos.first;

    // Normalizamos todas las métricas a una escala estándar de 0 a 10
    final puntajeNorm = juego.puntaje;
    final ventasNorm = (juego.numeroVentas / 300000000).clamp(0.0, 1.0) * 10;
    final jugadoresNorm =
        (juego.jugadoresActivos / 200000000).clamp(0.0, 1.0) * 10;
    final horasNorm = (juego.duracionPromedioHoras / 100).clamp(0.0, 1.0) * 10;
    final totalVal = juego.valoracionesPositivas + juego.valoracionesNegativas;
    final aprobacionNorm = totalVal > 0
        ? (juego.valoracionesPositivas / totalVal) * 10
        : 5.0;

    return Column(
      children: [
        Text(
          'Perfil Multidimensional de Rendimiento - ${juego.nombre}',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: RadarChart(
            RadarChartData(
              radarBackgroundColor: Colors.transparent,
              borderData: FlBorderData(show: false),
              radarBorderData: const BorderSide(color: Colors.grey),
              gridBorderData: const BorderSide(color: Colors.grey),
              titleTextStyle: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
              getTitle: (index, angle) {
                const titulos = [
                  'Calificación',
                  'Ventas Totales',
                  'Jugadores Activos',
                  'Duración Promedio',
                  '% Aprobación',
                ];

                return RadarChartTitle(text: titulos[index], angle: angle);
              },
              dataSets: [
                RadarDataSet(
                  fillColor: Colors.blue.withValues(alpha: 0.35),
                  borderColor: Colors.blue,
                  borderWidth: 2,
                  entryRadius: 3,
                  dataEntries: [
                    RadarEntry(value: puntajeNorm),
                    RadarEntry(value: ventasNorm),
                    RadarEntry(value: jugadoresNorm),
                    RadarEntry(value: horasNorm),
                    RadarEntry(value: aprobacionNorm),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
