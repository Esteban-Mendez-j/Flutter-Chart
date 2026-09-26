import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 18. Dispersión con burbujas: el tamaño del punto (radiusPxFn) representa
/// el número de ventas de cada juego.
class GraficoDispersionBurbuja extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoDispersionBurbuja({super.key, required this.videoJuegos});

  List<charts.Series<VideoJuego, num>> _crearSeries() {
    return [
      charts.Series<VideoJuego, num>(
        id: 'Precio vs ingresos (tamaño = ventas)',
        domainFn: (VideoJuego juego, _) => juego.precio,
        measureFn: (VideoJuego juego, _) => juego.ingresosEstimados / 1000000,
        radiusPxFn: (VideoJuego juego, _) =>
            (juego.numeroVentas / 20000000) + 2,
        data: videoJuegos,
        colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Precio vs ingresos (M). Tamaño = ventas',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: charts.ScatterPlotChart(_crearSeries(), animate: true),
        ),
      ],
    );
  }
}
