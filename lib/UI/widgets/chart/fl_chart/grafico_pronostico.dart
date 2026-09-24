import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class GraficoPronostico extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoPronostico({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    if (videoJuegos.isEmpty) {
      return const Center(child: Text('No hay datos para mostrar'));
    }

    final videojuego = videoJuegos.first;

    final historial = videojuego.historialMensual;

    if (historial.isEmpty) {
      return const Center(child: Text('No hay historial mensual disponible'));
    }

    final datosHistoricos = historial.length > 6
        ? historial.sublist(historial.length - 6)
        : historial;

    const mesesPronostico = 3;

    final ventasHistoricas = datosHistoricos
        .map((dato) => dato.ventas.toDouble())
        .toList();

    final pronostico = _calcularPronostico(ventasHistoricas, mesesPronostico);

    final valores = [...ventasHistoricas, ...pronostico];

    final maxY = _calcularMaxY(valores);

    return Column(
      children: [
        Text(
          'Pronóstico de ventas - ${videojuego.nombre}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 20),

        Expanded(
          child: BarChart(
            BarChartData(
              maxY: maxY,

              minY: 0,

              barTouchData: const BarTouchData(enabled: false),

              gridData: const FlGridData(show: true, drawVerticalLine: false),

              borderData: FlBorderData(show: false),

              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  axisNameWidget: const Text(
                    'Meses / Período Pronosticado',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                  axisNameSize: 22,
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    getTitlesWidget: (value, meta) {
                      return _getBottomTitle(
                        value,
                        meta,
                        datosHistoricos,
                        mesesPronostico,
                      );
                    },
                  ),
                ),
                leftTitles: const AxisTitles(
                  axisNameWidget: Text(
                    'Unidades Vendidas',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                  axisNameSize: 22,
                  sideTitles: SideTitles(showTitles: true, reservedSize: 50),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),

              barGroups: [
                ..._crearBarrasHistoricas(ventasHistoricas),

                ..._crearBarrasPronostico(pronostico, ventasHistoricas.length),
              ],
            ),
          ),
        ),

        const SizedBox(height: 10),

        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Leyenda(texto: 'Histórico', esPronostico: false),
            SizedBox(width: 25),
            _Leyenda(texto: 'Pronóstico', esPronostico: true),
          ],
        ),
      ],
    );
  }

  List<double> _calcularPronostico(List<double> datos, int cantidad) {
    if (datos.isEmpty) {
      return List.filled(cantidad, 0);
    }

    final cantidadPromedio = datos.length >= 3 ? 3 : datos.length;

    final ultimosDatos = datos.sublist(datos.length - cantidadPromedio);

    final promedio = ultimosDatos.reduce((a, b) => a + b) / ultimosDatos.length;

    return List.generate(cantidad, (_) => promedio);
  }

  List<BarChartGroupData> _crearBarrasHistoricas(List<double> datos) {
    return List.generate(datos.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: datos[index],
            width: 25,
            borderRadius: BorderRadius.zero,
          ),
        ],
      );
    });
  }

  List<BarChartGroupData> _crearBarrasPronostico(
    List<double> pronostico,
    int inicio,
  ) {
    return List.generate(pronostico.length, (index) {
      final valor = pronostico[index];

      final margen = valor * 0.10;

      return BarChartGroupData(
        x: inicio + index,
        barRods: [
          BarChartRodData(
            toY: valor,

            toYErrorRange: FlErrorRange(lowerBy: margen, upperBy: margen),

            width: 25,

            borderRadius: BorderRadius.zero,

            color: Colors.transparent,

            borderSide: const BorderSide(color: Colors.blue, width: 2),

            borderDashArray: const [5, 4],
          ),
        ],
      );
    });
  }

  Widget _getBottomTitle(
    double value,
    TitleMeta meta,
    List<dynamic> datosHistoricos,
    int mesesPronostico,
  ) {
    final index = value.toInt();

    final total = datosHistoricos.length + mesesPronostico;

    if (index < 0 || index >= total) {
      return const SizedBox();
    }

    String texto;

    if (index < datosHistoricos.length) {
      texto = _obtenerMes(datosHistoricos[index].periodo);
    } else {
      texto = 'P${index - datosHistoricos.length + 1}';
    }

    return SideTitleWidget(
      meta: meta,
      child: Text(
        texto,
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
      ),
    );
  }

  String _obtenerMes(String periodo) {
    final partes = periodo.split('-');

    if (partes.length != 2) {
      return periodo;
    }

    switch (partes[1]) {
      case '01':
        return 'ENE';
      case '02':
        return 'FEB';
      case '03':
        return 'MAR';
      case '04':
        return 'ABR';
      case '05':
        return 'MAY';
      case '06':
        return 'JUN';
      case '07':
        return 'JUL';
      case '08':
        return 'AGO';
      case '09':
        return 'SEP';
      case '10':
        return 'OCT';
      case '11':
        return 'NOV';
      case '12':
        return 'DIC';
      default:
        return periodo;
    }
  }

  double _calcularMaxY(List<double> valores) {
    if (valores.isEmpty) {
      return 100;
    }

    final maximo = valores.reduce((a, b) => a > b ? a : b);

    return maximo * 1.2;
  }
}

class _Leyenda extends StatelessWidget {
  final String texto;
  final bool esPronostico;

  const _Leyenda({required this.texto, required this.esPronostico});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            border: esPronostico
                ? Border.all(color: Colors.blue, width: 2)
                : null,
          ),
        ),
        const SizedBox(width: 6),
        Text(texto),
      ],
    );
  }
}
