import 'package:flutter/material.dart';
import 'package:graficos/UI/view_model/fl_chart_view_model.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_barra_chispa.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_barra_horizontal.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_barra_horizontal_etiquetas.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_barra_linea_objetivo.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_barras_agrupadas.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_barras_agrupadas_apiladas.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_barras_apiladas.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_barras_patron.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_barras_simple.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_circular_parcial.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_circular_simple.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_combo_barra_linea.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_dispersion_burbuja.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_dispersion_simple.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_dona.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_linea_punteada.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_linea_puntos.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_linea_simple.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_lineas_multiples.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_series_tiempo.dart';

class CommunityChartsView extends StatefulWidget {
  const CommunityChartsView({super.key});

  @override
  State<CommunityChartsView> createState() => _CommunityChartsView();
}

class _CommunityChartsView extends State<CommunityChartsView> {
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
        title: const Center(
          child: Text(
            "Graficos de la librería community_charts_flutter",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: _viewModel,
          builder: (context, _) {
            if (_viewModel.cargando) {
              return const Center(child: CircularProgressIndicator());
            }

            List<Widget> graficos = _listaGraficos(viewModel: _viewModel);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
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
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
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

/// Arma la lista con los 20 gráficos pedidos para community_charts_flutter.
/// [games] es la lista completa de videojuegos; [fiveGame] son los primeros
/// 5, usados en los gráficos donde mostrar los 20 juegos sería ilegible.
List<Widget> _listaGraficos({required FlChartViewModel viewModel}) {
  final games = viewModel.videoJuegos;
  final fiveGame = viewModel.videoJuegos.take(5).toList();
  final eightGame = viewModel.videoJuegos.take(8).toList();

  return [
    // --- Barras (9) ---
    GraficoBarrasSimple(videoJuegos: eightGame),
    GraficoBarrasAgrupadas(videoJuegos: fiveGame),
    GraficoBarrasApiladas(videoJuegos: fiveGame),
    GraficoBarrasAgrupadasApiladas(videoJuegos: games),
    GraficoBarraHorizontal(videoJuegos: fiveGame),
    GraficoBarraHorizontalEtiquetas(videoJuegos: fiveGame),
    GraficoBarrasPatron(videoJuegos: fiveGame),
    GraficoBarraChispa(videoJuegos: games),
    GraficoBarraLineaObjetivo(videoJuegos: eightGame),
    // --- Líneas (4) ---
    GraficoLineaSimple(videoJuegos: games),
    GraficoLineaPuntos(videoJuegos: games),
    GraficoLineasMultiples(videoJuegos: games),
    GraficoLineaPunteada(videoJuegos: games),
    // --- Circulares (3) ---
    GraficoCircularSimple(videoJuegos: fiveGame),
    GraficoDona(videoJuegos: games),
    GraficoCircularParcial(videoJuegos: games),
    // --- Dispersión (2) ---
    GraficoDispersionSimple(videoJuegos: games),
    GraficoDispersionBurbuja(videoJuegos: games),
    // --- Serie de tiempo (1) ---
    GraficoSeriesTiempo(videoJuegos: games),
    // --- Combo (1) ---
    GraficoComboBarraLinea(videoJuegos: games),
  ];
}
