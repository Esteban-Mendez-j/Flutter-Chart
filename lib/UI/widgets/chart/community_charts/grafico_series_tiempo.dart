import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/historial_mensual.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 19. Time Series Chart: usa fechas reales (DateTime) en el eje horizontal,
/// en vez de simples etiquetas de texto como los gráficos de línea normales.
class GraficoSeriesTiempo extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoSeriesTiempo({super.key, required this.videoJuegos});

  /// Convierte "2025-10" en un DateTime(2025, 10).
  DateTime _parsearPeriodo(String periodo) {
    final partes = periodo.split('-');
    return DateTime(int.parse(partes[0]), int.parse(partes[1]));
  }

  List<charts.Series<HistorialMensual, DateTime>> _crearSeries() {
    final juego = videoJuegos.first;
    return [
      charts.Series<HistorialMensual, DateTime>(
        id: 'Ventas mensuales',
        domainFn: (HistorialMensual h, _) => _parsearPeriodo(h.periodo),
        measureFn: (HistorialMensual h, _) => h.ventas,
        data: juego.historialMensual,
        colorFn: (_, __) => charts.MaterialPalette.indigo.shadeDefault,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Serie de tiempo: ventas de ${videoJuegos.first.nombre}',
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: charts.TimeSeriesChart(
            _crearSeries(),
            animate: true,
            dateTimeFactory: const charts.LocalDateTimeFactory(),
          ),
        ),
      ],
    );
  }
}
