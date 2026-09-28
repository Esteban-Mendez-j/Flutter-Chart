import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class GraficoBarrasAgrupadasApiladas extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBarrasAgrupadasApiladas({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    final juegos = videoJuegos.take(5).toList();

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 130,

        barGroups: List.generate(juegos.length, (index) {
          final juego = juegos[index];

          final jugadores = juego.jugadoresActivos.toDouble().clamp(0, 100);

          final horas = juego.horasJugadasMensuales.toDouble().clamp(0, 100);

          return BarChartGroupData(
            x: index,
            barsSpace: 5,
            barRods: [
              BarChartRodData(
                toY: jugadores.toDouble(),
                width: 18,
                rodStackItems: [
                  BarChartRodStackItem(0, jugadores * 0.6, Colors.blue),
                  BarChartRodStackItem(
                    jugadores * 0.6,
                    jugadores.toDouble(),
                    Colors.lightBlue,
                  ),
                ],
              ),
              BarChartRodData(
                toY: horas.toDouble(),
                width: 18,
                rodStackItems: [
                  BarChartRodStackItem(0, horas * 0.5, Colors.orange),
                  BarChartRodStackItem(
                    horas * 0.5,
                    horas.toDouble(),
                    Colors.deepOrange,
                  ),
                ],
              ),
            ],
          );
        }),

        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            axisNameWidget: const Text("Videojuegos"),
            axisNameSize: 30,
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 35,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();

                if (index < 0 || index >= juegos.length) {
                  return const SizedBox();
                }

                final nombre = juegos[index].nombre;

                // Acortar los nombres para evitar saturación
                final nombreCorto = nombre.length > 6
                    ? "${nombre.substring(0, 6)}..."
                    : nombre;

                return Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    nombreCorto,
                    style: const TextStyle(fontSize: 8),
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
          ),

          leftTitles: AxisTitles(
            axisNameWidget: const Text("Valor"),
            axisNameSize: 25,
            sideTitles: const SideTitles(showTitles: true, reservedSize: 35),
          ),

          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),

          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),

        gridData: const FlGridData(show: true),
      ),
    );
  }
}
