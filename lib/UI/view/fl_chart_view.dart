import 'package:flutter/material.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_barras.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_circular.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_lineas.dart';

class FlChartView extends StatefulWidget {
  const FlChartView({super.key});

  @override
  State<FlChartView> createState() => _FlChartView();
}

class _FlChartView extends State<FlChartView> {
  List<Widget> graficos = [GraficoLineas(), GraficoBarras(), GraficoCircular()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Graficos fl_chart")),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Graficos de la librería fl_chart",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 500,
                mainAxisExtent: 340,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: graficos.length,
              itemBuilder: (context, index) {
                return Card(child: Center(child: graficos[index]));
              },
            ),
          ),
        ],
      ),
    );
  }
}
