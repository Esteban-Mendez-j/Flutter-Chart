import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class GraficoMedidor extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoMedidor({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) {
      return const Center(child: Text("No hay datos disponibles"));
    }

    final promedio =
        videoJuegos.map((juego) => juego.puntaje).reduce((a, b) => a + b) /
        videoJuegos.length;

    final progreso = (promedio / 10).clamp(0.0, 1.0);

    String nivel;

    if (promedio < 5) {
      nivel = "Bajo";
    } else if (promedio < 7) {
      nivel = "Medio";
    } else if (promedio < 8.5) {
      nivel = "Bueno";
    } else {
      nivel = "Excelente";
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Valoración general",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 4),

        const Text(
          "Puntaje promedio de los videojuegos",
          style: TextStyle(fontSize: 12, color: Colors.grey),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 10),

        SizedBox(
          height: 170,
          width: 250,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PieChart(
                PieChartData(
                  startDegreeOffset: 180,
                  sectionsSpace: 0,
                  centerSpaceRadius: 65,
                  sections: [
                    PieChartSectionData(
                      value: progreso,
                      color: Colors.blue,
                      radius: 28,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      value: 1 - progreso,
                      color: Colors.grey.withValues(alpha: 0.2),
                      radius: 28,
                      showTitle: false,
                    ),
                  ],
                ),
              ),

              Positioned(
                bottom: 25,
                child: Column(
                  children: [
                    Text(
                      promedio.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "de 10",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 5),

        Text(
          nivel,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 4),

        Text(
          "${videoJuegos.length} videojuegos analizados",
          style: const TextStyle(fontSize: 11, color: Colors.grey),
        ),
      ],
    );
  }
}
