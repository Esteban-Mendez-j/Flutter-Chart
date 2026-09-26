import 'package:flutter/material.dart';
import 'package:graficos/UI/view_model/fl_chart_view_model.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_cascada.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_barra_error.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_barras_intervalo.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_burbuja.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_caja_bigote.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_dispersion.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_histograma.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_barra_horizontal.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_linea_escalonada.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_columnas_apiladas.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_velas.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_area_rango.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_embudo.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_columnas_100.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/sf_g1_linea.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/sf_g2_columna.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/sf_g3_pie.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/sf_g4_dona.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/sf_g5_radial.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/sf_g6_area_suave.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/sf_g7_piramide.dart';

class SyncfusionView extends StatefulWidget {
  const SyncfusionView({super.key});

  @override
  State<SyncfusionView> createState() => _SyncfusionView();
}

class _SyncfusionView extends State<SyncfusionView> {
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
            "Graficos de la librería Syncfunsion_chart",
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
  return [
    GraficoBarraError(videoJuegos: games),
    GraficoBarraIntervalo(videoJuegos: games),
    GraficoBurbuja(videoJuegos: games),
    GraficoCajaBigote(videoJuegos: games),
    GraficoCascada(videoJuegos: games),
    GraficoDispersion(videoJuegos: games),
    GraficoHistograma(videoJuegos: games),
    GraficoBarraHorizontal(videoJuegos: games),
    GraficoLineaEscalonada(videoJuegos: games),
    GraficoColumnasApiladas(videoJuegos: games),
    GraficoVelas(videoJuegos: games),
    GraficoAreaRango(videoJuegos: games),
    GraficoEmbudo(videoJuegos: games),
    GraficoColumnas100(videoJuegos: games),
    SfG1Linea(),
    SfG2Columna(),
    SfG3Pie(),
    SfG4Dona(),
    SfG5Radial(),
    SfG6AreaSuave(),
    SfG7Piramide(),
  ];
}