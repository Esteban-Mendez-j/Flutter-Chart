import 'package:flutter/material.dart';
import 'package:graficos/UI/view_model/graficos_view_model.dart';
import 'package:graficos/UI/widgets/chart/widgets_view/contenedor_lista_graficos.dart';
import 'package:graficos/UI/widgets/chart/widgets_view/lista_graficos_community.dart';
import 'package:graficos/data/model/grafico_item.dart';

class CommunityChartsView extends StatefulWidget {
  const CommunityChartsView({super.key});

  @override
  State<CommunityChartsView> createState() => _CommunityChartsView();
}

class _CommunityChartsView extends State<CommunityChartsView> {
  late GraficosViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = GraficosViewModel();
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

            List<GraficoItem> todosGraficos = listaGraficosCommunity(
              viewModel: _viewModel,
            );
            final graficos = _viewModel.filtrarGraficos(todosGraficos);
            return ContenedorListaGraficos(
              viewModel: _viewModel,
              graficos: graficos,
            );
          },
        ),
      ),
    );
  }
}
