import 'package:flutter/material.dart';
import 'package:graficos/UI/view_model/graficos_view_model.dart';
import 'package:graficos/UI/widgets/chart/widgets_view/buscador_graficos.dart';
import 'package:graficos/UI/widgets/chart/widgets_view/not_found.dart';
import 'package:graficos/UI/widgets/chart/widgets_view/tarjeta_grafico.dart';
import 'package:graficos/data/model/grafico_item.dart';

class ContenedorListaGraficos extends StatelessWidget {
  final GraficosViewModel _viewModel;
  final List<GraficoItem> graficos;
  const ContenedorListaGraficos({
    super.key,
    required this._viewModel,
    required this.graficos,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: BuscadorGraficos(onChanged: _viewModel.buscar),
        ),
        SizedBox(height: 20),

        if (graficos.isEmpty)
          Notfound(
            texto: "No se encontró ningun resultado. Intenta cambiando la busqueda",
          ),
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
                  childAspectRatio: 1.4,
                ),
                itemCount: graficos.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: TarjetaGrafico(grafico: graficos[index]),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
