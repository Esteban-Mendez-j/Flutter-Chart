import 'package:flutter/material.dart';
import 'package:graficos/UI/view_model/graficos_view_model.dart';
import 'package:graficos/UI/widgets/chart/widgets_view/contenedor_lista_graficos.dart';
import 'package:graficos/UI/widgets/chart/widgets_view/lista_graficos_syncfusion.dart';
import 'package:graficos/data/model/grafico_item.dart';

class SyncfusionView extends StatefulWidget {
  const SyncfusionView({super.key});

  @override
  State<SyncfusionView> createState() => _SyncfusionView();
}

class _SyncfusionView extends State<SyncfusionView> {
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
            List<GraficoItem> todosGraficos = listaGraficosSyncfusion(
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
