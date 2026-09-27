import 'package:flutter/material.dart';
import 'package:graficos/UI/view_model/graficos_view_model.dart';
import 'package:graficos/UI/widgets/chart/widgets_view/contenedor_lista_graficos.dart';
import 'package:graficos/UI/widgets/chart/widgets_view/lista_graficos_fl_chart.dart';
import 'package:graficos/data/model/grafico_item.dart';

class FlChartView extends StatefulWidget {
  const FlChartView({super.key});

  @override
  State<FlChartView> createState() => _FlChartView();
}

class _FlChartView extends State<FlChartView> {
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
            "Graficos de la librería fl_chart",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: _viewModel,
          builder: (context, _) {
            List<GraficoItem> todosGraficos = listaGraficosFlChart(
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
