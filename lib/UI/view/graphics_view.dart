import 'package:flutter/material.dart';
import 'package:graficos/UI/widgets/chart/graphics/g10_lineas_puntos.dart';
import 'package:graficos/UI/widgets/chart/graphics/g11_linea_escalonada.dart';
import 'package:graficos/UI/widgets/chart/graphics/g12_area_apilada.dart';
// Importación de las 8 Gráficas Avanzadas
import 'package:graficos/UI/widgets/chart/graphics/g13_radar.dart';
import 'package:graficos/UI/widgets/chart/graphics/g14_rosa_polar.dart';
import 'package:graficos/UI/widgets/chart/graphics/g15_burbujas.dart';
import 'package:graficos/UI/widgets/chart/graphics/g16_mapa_calor.dart';
import 'package:graficos/UI/widgets/chart/graphics/g17_linea_suave_area.dart';
import 'package:graficos/UI/widgets/chart/graphics/g18_interactivo_tooltip.dart';
import 'package:graficos/UI/widgets/chart/graphics/g19_combinado_barras_linea.dart';
// Importación de las 12 Gráficas Básicas
import 'package:graficos/UI/widgets/chart/graphics/g1_barras_verticales.dart';
import 'package:graficos/UI/widgets/chart/graphics/g20_piramide.dart';
import 'package:graficos/UI/widgets/chart/graphics/g2_barras_horizontales.dart';
import 'package:graficos/UI/widgets/chart/graphics/g3_linea_simple.dart';
import 'package:graficos/UI/widgets/chart/graphics/g4_puntos_scatter.dart';
import 'package:graficos/UI/widgets/chart/graphics/g5_area_simple.dart';
import 'package:graficos/UI/widgets/chart/graphics/g6_circular_pie.dart';
import 'package:graficos/UI/widgets/chart/graphics/g7_dona_donut.dart';
import 'package:graficos/UI/widgets/chart/graphics/g8_barras_agrupadas.dart';
import 'package:graficos/UI/widgets/chart/graphics/g9_barras_apiladas.dart';

class GraphicView extends StatefulWidget {
  const GraphicView({super.key});

  @override
  State<GraphicView> createState() => _GraphicViewState();
}

class _GraphicViewState extends State<GraphicView> {
  // Lista con los nombres e instancias de los 20 widgets
  final List<Map<String, dynamic>> listaGraficos = const [
    {'titulo': '1. Barras Verticales', 'widget': G1BarrasVerticales()},
    {'titulo': '2. Barras Horizontales', 'widget': G2BarrasHorizontales()},
    {'titulo': '3. Línea Simple', 'widget': G3LineaSimple()},
    {'titulo': '4. Puntos (Scatter)', 'widget': G4PuntosScatter()},
    {'titulo': '5. Área Simple', 'widget': G5AreaSimple()},
    {'titulo': '6. Circular (Pie)', 'widget': G6CircularPie()},
    {'titulo': '7. Dona (Donut)', 'widget': G7DonaDonut()},
    {'titulo': '8. Barras Agrupadas', 'widget': G8BarrasAgrupadas()},
    {'titulo': '9. Barras Apiladas', 'widget': G9BarrasApiladas()},
    {'titulo': '10. Líneas y Puntos', 'widget': G10LineasPuntos()},
    {'titulo': '11. Línea Escalonada', 'widget': G11LineaEscalonada()},
    {'titulo': '12. Área Apilada', 'widget': G12AreaApilada()},
    {'titulo': '13. Radar (Avanzada)', 'widget': G13Radar()},
    {'titulo': '14. Rosa Polar (Avanzada)', 'widget': G14RosaPolar()},
    {'titulo': '15. Burbujas (Avanzada)', 'widget': G15Burbujas()},
    {'titulo': '16. Mapa de Calor (Avanzada)', 'widget': G16MapaCalor()},
    {'titulo': '17. Línea Suave con Área (Avanzada)', 'widget': G17LineaSuaveArea()},
    {'titulo': '18. Interactivo con Tooltip (Avanzada)', 'widget': G18InteractivoTooltip()},
    {'titulo': '19. Combinado Barras + Línea (Avanzada)', 'widget': G19CombinadoBarrasLinea()},
    {'titulo': '20. Pirámide (Avanzada)', 'widget': G20Piramide()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gráficos con Library Graphic")),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "20 Visualizaciones Nativas (12 Básicas + 8 Avanzadas)",
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
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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