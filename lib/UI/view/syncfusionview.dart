import 'package:flutter/material.dart';
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
  State<SyncfusionView> createState() => _SyncfusionViewState();
}

class _SyncfusionViewState extends State<SyncfusionView> {
  final List<Map<String, dynamic>> listaGraficos = const [
    {'titulo': '1. Líneas (LineSeries)', 'widget': SfG1Linea()},
    {'titulo': '2. Columnas (ColumnSeries)', 'widget': SfG2Columna()},
    {'titulo': '3. Circular / Torta (PieSeries)', 'widget': SfG3Pie()},
    {'titulo': '4. Dona (DoughnutSeries)', 'widget': SfG4Dona()},
    {'titulo': '5. Barra Radial (RadialBarSeries)', 'widget': SfG5Radial()},
    {'titulo': '6. Área Suave (SplineAreaSeries)', 'widget': SfG6AreaSuave()},
    {'titulo': '7. Pirámide (PyramidSeries)', 'widget': SfG7Piramide()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gráficos Syncfusion")),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Visualizaciones con Syncfusion",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                mainAxisExtent: 320,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: listaGraficos.length,
              itemBuilder: (context, index) {
                final item = listaGraficos[index];
                return Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['titulo'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(child: item['widget'] as Widget),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
