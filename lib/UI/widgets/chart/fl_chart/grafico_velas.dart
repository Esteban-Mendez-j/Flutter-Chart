import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class GraficoVelas extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoVelas({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    final juego = videoJuegos.first;

    final datos = juego.historialMensual;

    return Column(
      children: [
        Text(
          'Comportamiento Financiero OHLC - ${juego.nombre}',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: CandlestickChart(
            CandlestickChartData(
              minX: 0,
              maxX: (datos.length - 1).toDouble(),
              candlestickSpots: datos.asMap().entries.map((entry) {
                final index = entry.key;
                final mes = entry.value;

                return CandlestickSpot(
                  x: index.toDouble(),
                  open: mes.ventasOhlc.open,
                  high: mes.ventasOhlc.high,
                  low: mes.ventasOhlc.low,
                  close: mes.ventasOhlc.close,
                );
              }).toList(),
              gridData: const FlGridData(show: true),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: const AxisTitles(
                  axisNameWidget: Text(
                    'Volumen OHLC',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                  axisNameSize: 22,
                  sideTitles: SideTitles(showTitles: true, reservedSize: 60),
                ),
                bottomTitles: AxisTitles(
                  axisNameWidget: const Text(
                    'Período Mensual',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                  axisNameSize: 22,
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      final index = value.toInt();

                      if (index < 0 || index >= datos.length) {
                        return const SizedBox();
                      }

                      final periodo = datos[index].periodo;

                      return SideTitleWidget(
                        meta: meta,
                        child: Text(
                          periodo.substring(5),
                          style: const TextStyle(fontSize: 10),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
