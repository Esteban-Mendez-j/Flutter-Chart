import 'package:flutter/material.dart';
import 'package:graficos/UI/view_model/fl_chart_view_model.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_area_entre_lineas.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_area.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_barra_horizontal.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_barra_positiva_negativa.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_barras.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_barras_agrupadas.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_barras_apiladas.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_burbujas.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_cascada.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_circular.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_dispersion.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_dona.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_lienas_multiples.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_linea_error.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_lineas_escalonadas.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_medidor.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_medidor_multi_anillo.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_pronostico.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_radar.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_velas.dart';

class FlChartView extends StatefulWidget {
  const FlChartView({super.key});

  @override
  State<FlChartView> createState() => _FlChartView();
}

class _FlChartView extends State<FlChartView> {
  late FlChartViewModel _viewModel;
  @override
  void initState() {
    super.initState();
    _viewModel = FlChartViewModel();
    _viewModel.getVideoJuegos();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Graficos de la librería fl_chart",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: _viewModel,
          builder: (context, _) {
            List<Widget> graficos = _listaGraficos(viewModel: _viewModel);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      int crossAxisCount = 2;
                      if (constraints.maxWidth <= 900) {
                        crossAxisCount = 1;
                      }
                      return GridView.builder(
                        padding: const EdgeInsets.all(16),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          crossAxisCount: crossAxisCount,
                          childAspectRatio: 1.5,
                        ),
                        itemCount: graficos.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: BoxBorder.all(color: Colors.grey),
                              borderRadius: BorderRadiusGeometry.circular(10),
                            ),
                            child: Center(child: graficos[index]),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

List<Widget> _listaGraficos({required FlChartViewModel viewModel}) {
  final games = viewModel.videoJuegos;
  final fiveGame = viewModel.videoJuegos.take(5).toList();
  return [
    GraficoDona(videoJuegos: fiveGame),
    GraficoBarras(videoJuegos: fiveGame),
    GraficoBarrasApiladas(
      categorias: viewModel.categorias(fiveGame),
      videoJuegos: fiveGame,
    ),
    GraficoCircular(videoJuegos: fiveGame),
    GraficoBarraHorizontal(videoJuegos: fiveGame),
    GraficoMedidor(videoJuegos: games),
    GraficoBarrasAgrupadas(videoJuegos: games),
    GraficoPronostico(videoJuegos: games),
    GraficoAreas(
      videoJuegos: games,
      maxJugadores: viewModel.obtenerMaximo(
        games,
        (mes) => mes.jugadoresActivos.toDouble(),
      ),
    ),
    GraficoRadar(videoJuegos: games),
    GraficoDispersion(videoJuegos: games),
    GraficoMedidorMultiAnillo(videoJuegos: games),
    GraficoVelas(videoJuegos: games),
    GraficoBarraPositivasNegativas(videoJuegos: games),
    GraficoAreaEntreLineas(videoJuegos: games),
    GraficoLineaError(videoJuegos: games),
    GraficoLineasEscalonadas(videoJuegos: games),
    GraficoLineasMultiples(videoJuegos: games),
    GraficoBurbujas(videoJuegos: games),
    GraficoCascada(videoJuegos: games),
  ];
}
