import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/historial_mensual.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 8. Spark Bar Chart: mini gráfico de barras sin ejes, ideal para mostrar
/// una tendencia rápida dentro de una tarjeta o lista.
class GraficoBarraChispa extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBarraChispa({super.key, required this.videoJuegos});

  List<charts.Series<HistorialMensual, String>> _crearSeries() {
    final juego = videoJuegos.first;
    return [
      charts.Series<HistorialMensual, String>(
        id: 'Ventas mensuales',
        domainFn: (HistorialMensual h, _) => h.periodo,
        measureFn: (HistorialMensual h, _) => h.ventas,
        data: juego.historialMensual,
        colorFn: (_, _) => charts.MaterialPalette.deepOrange.shadeDefault,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Spark Bar: ventas mensuales de ${videoJuegos.first.nombre}',
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 50,
          child: charts.BarChart(
            _crearSeries(),
            animate: true,
            // Ocultamos ambos ejes y reducimos los márgenes al mínimo.
            primaryMeasureAxis: const charts.NumericAxisSpec(
              renderSpec: charts.NoneRenderSpec(),
            ),
            domainAxis: const charts.OrdinalAxisSpec(
              showAxisLine: true,
              renderSpec: charts.NoneRenderSpec(),
            ),
            layoutConfig: charts.LayoutConfig(
              leftMarginSpec: charts.MarginSpec.fixedPixel(0),
              topMarginSpec: charts.MarginSpec.fixedPixel(0),
              rightMarginSpec: charts.MarginSpec.fixedPixel(0),
              bottomMarginSpec: charts.MarginSpec.fixedPixel(0),
            ),
          ),
        ),
      ],
    );
  }
}
