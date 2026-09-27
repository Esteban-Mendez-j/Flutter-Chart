import 'package:flutter/material.dart';
import 'package:graficos/UI/view_model/graficos_view_model.dart';
import 'package:graficos/UI/widgets/chart/widgets_view/contenedor_lista_graficos.dart';
import 'package:graficos/UI/widgets/chart/widgets_view/lista_graficos_graphics.dart';
import 'package:graficos/data/model/grafico_item.dart';

class GraphicView extends StatefulWidget {
  const GraphicView({super.key});

  @override
  State<GraphicView> createState() => _GraphicViewState();
}

class _GraphicViewState extends State<GraphicView> {
  late GraficosViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = GraficosViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gráficos con Library Graphic")),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: _viewModel,
          builder: (context, _) {
            List<GraficoItem> todosGraficos = listaGraficosGraphic();

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
