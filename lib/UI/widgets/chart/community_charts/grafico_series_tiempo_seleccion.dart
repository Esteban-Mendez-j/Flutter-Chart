import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:graficos/data/model/historial_mensual.dart';
import 'package:graficos/data/model/videojuego.dart';

/// 30. Serie de tiempo interactiva: al tocar o arrastrar sobre la línea se
/// resalta el punto más cercano y se muestra su valor arriba.
class GraficoSeriesTiempoSeleccion extends StatefulWidget {
  final List<VideoJuego> videoJuegos;

  const GraficoSeriesTiempoSeleccion({super.key, required this.videoJuegos});

  @override
  State<GraficoSeriesTiempoSeleccion> createState() =>
      _GraficoSeriesTiempoSeleccionState();
}

class _GraficoSeriesTiempoSeleccionState
    extends State<GraficoSeriesTiempoSeleccion> {
  String? _periodoSeleccionado;
  int? _valorSeleccionado;

  DateTime _parsearPeriodo(String periodo) {
    final partes = periodo.split('-');
    return DateTime(int.parse(partes[0]), int.parse(partes[1]));
  }

  void _alCambiarSeleccion(charts.SelectionModel<DateTime> modelo) {
    String? periodo;
    int? valor;
    if (modelo.hasDatumSelection) {
      final h = modelo.selectedDatum.first.datum as HistorialMensual;
      periodo = h.periodo;
      valor = h.jugadoresActivos;
    }
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() {
        _periodoSeleccionado = periodo;
        _valorSeleccionado = valor;
      });
    });
  }

  List<charts.Series<HistorialMensual, DateTime>> _crearSeries() {
    final juego = widget.videoJuegos.first;
    return [
      charts.Series<HistorialMensual, DateTime>(
        id: 'Jugadores activos',
        domainFn: (HistorialMensual h, _) => _parsearPeriodo(h.periodo),
        measureFn: (HistorialMensual h, _) => h.jugadoresActivos,
        data: juego.historialMensual,
        colorFn: (_, _) => charts.MaterialPalette.deepOrange.shadeDefault,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final texto = _periodoSeleccionado == null
        ? 'Toca la línea para ver un valor'
        : '$_periodoSeleccionado: $_valorSeleccionado jugadores';

    return Column(
      children: [
        Text(
          texto,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: charts.TimeSeriesChart(
            _crearSeries(),
            animate: true,
            dateTimeFactory: const charts.LocalDateTimeFactory(),
            defaultRenderer: charts.LineRendererConfig<DateTime>(
              includePoints: true,
            ),
            behaviors: [
              charts.LinePointHighlighter(
                showHorizontalFollowLine:
                    charts.LinePointHighlighterFollowLineType.nearest,
                showVerticalFollowLine:
                    charts.LinePointHighlighterFollowLineType.nearest,
              ),
              charts.SelectNearest(
                eventTrigger: charts.SelectionTrigger.tapAndDrag,
              ),
            ],
            selectionModels: [
              charts.SelectionModelConfig<DateTime>(
                type: charts.SelectionModelType.info,
                changedListener: _alCambiarSeleccion,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
