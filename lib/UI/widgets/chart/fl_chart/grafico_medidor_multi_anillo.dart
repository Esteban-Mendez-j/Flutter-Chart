import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos/data/model/videojuego.dart';

class GraficoMedidorMultiAnillo extends StatelessWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoMedidorMultiAnillo({super.key, required this.videoJuegos});

  @override
  Widget build(BuildContext context) {
    final juego = videoJuegos.first;

    final calificacionPct = (juego.puntaje / 10.0).clamp(0.0, 1.0) * 100;

    final totalVal = juego.valoracionesPositivas + juego.valoracionesNegativas;
    final aprobacionPct = totalVal > 0
        ? ((juego.valoracionesPositivas / totalVal).clamp(0.0, 1.0) * 100)
        : 50.0;

    final rentabilidadPct = juego.ingresosEstimados > 0
        ? (((juego.ingresosEstimados - juego.costoDesarrollo) /
                      juego.ingresosEstimados)
                  .clamp(0.0, 1.0) *
              100)
        : 50.0;

    final alcanceJugadoresPct =
        (juego.jugadoresActivos / 200000000).clamp(0.0, 1.0) * 100;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Medidor Radial Multi-Anillo de KPIs (%)',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: 230,
          height: 230,
          child: Stack(
            alignment: Alignment.center,
            children: [
              _crearAnillo(
                valor: alcanceJugadoresPct,
                radio: 120,
                grosor: 16,
                color: Colors.purple,
              ),

              _crearAnillo(
                valor: rentabilidadPct,
                radio: 100,
                grosor: 16,
                color: Colors.orange,
              ),

              _crearAnillo(
                valor: aprobacionPct,
                radio: 79,
                grosor: 16,
                color: Colors.green,
              ),

              _crearAnillo(
                valor: calificacionPct,
                radio: 56,
                grosor: 16,
                color: Colors.blue,
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    juego.nombre,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${juego.puntaje}/10',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          runSpacing: 4,
          alignment: WrapAlignment.center,
          children: [
            _itemLeyenda(
              color: Colors.blue,
              texto: 'Score (${calificacionPct.toInt()}%)',
            ),
            _itemLeyenda(
              color: Colors.green,
              texto: 'Aprobación (${aprobacionPct.toInt()}%)',
            ),
            _itemLeyenda(
              color: Colors.orange,
              texto: 'Rentabilidad (${rentabilidadPct.toInt()}%)',
            ),
            _itemLeyenda(
              color: Colors.purple,
              texto: 'Jugadores (${alcanceJugadoresPct.toInt()}%)',
            ),
          ],
        ),
      ],
    );
  }

  Widget _itemLeyenda({required Color color, required String texto}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(
          texto,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _crearAnillo({
    required double valor,
    required double radio,
    required double grosor,
    required Color color,
  }) {
    return SizedBox(
      width: radio * 2,
      height: radio * 2,
      child: PieChart(
        PieChartData(
          startDegreeOffset: -135,
          sectionsSpace: 0,
          centerSpaceRadius: radio - grosor,

          sections: [
            PieChartSectionData(
              value: valor,
              color: color,
              radius: grosor,
              showTitle: false,
            ),
            PieChartSectionData(
              value: 100 - valor,
              color: color,
              radius: grosor,
              showTitle: false,
            ),
          ],
        ),
      ),
    );
  }
}
