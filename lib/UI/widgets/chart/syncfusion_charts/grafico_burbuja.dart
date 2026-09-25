import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoBurbuja extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoBurbuja({super.key, required this.videoJuegos});

  static const Map<String, Color> _coloresCategorias = {
    'Sandbox': Colors.green,
    'Acción': Colors.red,
    'RPG': Colors.purple,
    'Aventura': Colors.orange,
    'Battle Royale': Colors.cyan,
    'Casual': Colors.yellow,
    'MOBA': Colors.blue,
    'Shooter': Colors.brown,
    'Deportes': Colors.teal,
    'Estrategia': Colors.indigo,
  };

  @override
  Widget build(BuildContext context) {
    final juegosDePago = videoJuegos
        .where(
          (juego) =>
              juego.precio > 0 &&
              juego.numeroVentas > 0 &&
              juego.jugadoresActivos > 0,
        )
        .toList();

    if (juegosDePago.isEmpty) {
      return const Center(
        child: Text('No hay datos suficientes para mostrar el gráfico'),
      );
    }

    return SfCartesianChart(
      title: ChartTitle(text: 'Relación entre precio, ventas y jugadores'),

      primaryXAxis: NumericAxis(title: AxisTitle(text: 'Precio (USD)')),

      primaryYAxis: NumericAxis(
        title: AxisTitle(text: 'Número de ventas (millones)'),
      ),

      tooltipBehavior: TooltipBehavior(enable: true),

      onTooltipRender: (TooltipArgs args) {
        final index = args.pointIndex;

        if (index == null || index < 0 || index >= juegosDePago.length) {
          return;
        }

        final juego = juegosDePago[index.toInt()];

        args.header = juego.nombre;

        args.text =
            'Categoría: ${juego.categoria}\n'
            'Precio: \$${juego.precio.toStringAsFixed(2)}\n'
            'Ventas: ${(juego.numeroVentas / 1000000).toStringAsFixed(2)} M\n'
            'Jugadores activos: ${juego.jugadoresActivos}';
      },

      legend: const Legend(isVisible: true, position: LegendPosition.bottom),

      series: <CartesianSeries<VideoJuego, double>>[
        BubbleSeries<VideoJuego, double>(
          dataSource: juegosDePago,

          xValueMapper: (VideoJuego juego, _) => juego.precio,

          yValueMapper: (VideoJuego juego, _) => juego.numeroVentas / 1000000,

          sizeValueMapper: (VideoJuego juego, _) =>
              juego.jugadoresActivos.toDouble(),

          pointColorMapper: (VideoJuego juego, _) =>
              _coloresCategorias[juego.categoria] ?? Colors.grey,

          name: 'Videojuegos',

          enableTooltip: true,
        ),
      ],
    );
  }
}
