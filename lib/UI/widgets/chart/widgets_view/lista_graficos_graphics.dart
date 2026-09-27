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
import 'package:graficos/data/model/grafico_item.dart';

List<GraficoItem> listaGraficosGraphic() {
  return [
    GraficoItem(
      grafico: G1BarrasVerticales(),
      titulo: "1. Barras verticales",
      categoria: "Comparación",
      descripcion: "El gráfico de barras verticales permite comparar los valores de diferentes categorías mediante barras, facilitando la identificación de diferencias entre los datos.",
    ),

    GraficoItem(
      grafico: G2BarrasHorizontales(),
      titulo: "2. Barras horizontales",
      categoria: "Comparación",
      descripcion: "El gráfico de barras horizontales permite comparar diferentes categorías mediante barras horizontales y facilita la lectura de nombres o etiquetas largas.",
    ),

    GraficoItem(
      grafico: G3LineaSimple(),
      titulo: "3. Línea simple",
      categoria: "Tendencia",
      descripcion: "El gráfico de línea simple permite representar la evolución de una variable y observar tendencias, aumentos, disminuciones y cambios entre diferentes valores.",
    ),

    GraficoItem(
      grafico: G4PuntosScatter(),
      titulo: "4. Puntos (Scatter)",
      categoria: "Relación",
      descripcion: "El gráfico de dispersión representa pares de valores mediante puntos y permite analizar la relación, distribución y posibles patrones entre dos variables.",
    ),

    GraficoItem(
      grafico: G5AreaSimple(),
      titulo: "5. Área simple",
      categoria: "Tendencia",
      descripcion: "El gráfico de área simple permite representar la evolución de una variable y resaltar visualmente la magnitud de los valores mediante el área situada debajo de la línea.",
    ),

    GraficoItem(
      grafico: G6CircularPie(),
      titulo: "6. Circular (Pie)",
      categoria: "Composición",
      descripcion: "El gráfico circular permite mostrar cómo se divide un total entre diferentes categorías mediante segmentos que representan la proporción de cada una.",
    ),

    GraficoItem(
      grafico: G7DonaDonut(),
      titulo: "7. Dona (Donut)",
      categoria: "Composición",
      descripcion: "El gráfico de dona permite representar la distribución proporcional de un conjunto de datos mediante segmentos circulares y un espacio central.",
    ),

    GraficoItem(
      grafico: G8BarrasAgrupadas(),
      titulo: "8. Barras agrupadas",
      categoria: "Comparación",
      descripcion: "El gráfico de barras agrupadas permite comparar varias series de datos dentro de diferentes categorías, mostrando cada valor de forma independiente.",
    ),

    GraficoItem(
      grafico: G9BarrasApiladas(),
      titulo: "9. Barras apiladas",
      categoria: "Composición",
      descripcion: "El gráfico de barras apiladas permite representar un total dividido en diferentes partes y comparar simultáneamente la composición de varias categorías.",
    ),

    GraficoItem(
      grafico: G10LineasPuntos(),
      titulo: "10. Líneas y puntos",
      categoria: "Tendencia",
      descripcion: "El gráfico de líneas y puntos combina una línea con marcadores individuales para representar una tendencia y destacar cada uno de los valores.",
    ),

    GraficoItem(
      grafico: G11LineaEscalonada(),
      titulo: "11. Línea escalonada",
      categoria: "Tendencia",
      descripcion: "El gráfico de línea escalonada representa cambios mediante segmentos horizontales y verticales, siendo útil para datos que cambian en momentos específicos.",
    ),

    GraficoItem(
      grafico: G12AreaApilada(),
      titulo: "12. Área apilada",
      categoria: "Composición",
      descripcion: "El gráfico de área apilada permite observar la evolución de varias series y, al mismo tiempo, visualizar cómo cada una contribuye al total.",
    ),

    GraficoItem(
      grafico: G13Radar(),
      titulo: "13. Radar",
      categoria: "Comparación",
      descripcion: "El gráfico de radar permite comparar varias variables o características de diferentes elementos utilizando ejes distribuidos alrededor de un punto central.",
    ),

    GraficoItem(
      grafico: G14RosaPolar(),
      titulo: "14. Rosa polar",
      categoria: "Comparación",
      descripcion: "El gráfico de rosa polar representa valores mediante segmentos distribuidos radialmente y permite comparar magnitudes entre diferentes categorías.",
    ),

    GraficoItem(
      grafico: G15Burbujas(),
      titulo: "15. Burbujas",
      categoria: "Relación",
      descripcion: "El gráfico de burbujas permite analizar la relación entre varias variables utilizando la posición para representar datos y el tamaño de cada burbuja para representar una variable adicional.",
    ),

    GraficoItem(
      grafico: G16MapaCalor(),
      titulo: "16. Mapa de calor",
      categoria: "Distribución",
      descripcion: "El mapa de calor representa valores mediante diferentes intensidades visuales, permitiendo identificar concentraciones, patrones y diferencias dentro de una matriz de datos.",
    ),

    GraficoItem(
      grafico: G17LineaSuaveArea(),
      titulo: "17. Línea suave con área",
      categoria: "Tendencia",
      descripcion: "El gráfico de línea suave con área representa la evolución de una variable utilizando una línea suavizada y un área que resalta visualmente la magnitud de los valores.",
    ),

    GraficoItem(
      grafico: G18InteractivoTooltip(),
      titulo: "18. Gráfico interactivo con Tooltip",
      categoria: "Interactividad",
      descripcion: "El gráfico interactivo con Tooltip permite consultar información adicional al interactuar con los elementos del gráfico, facilitando la exploración detallada de los datos.",
    ),

    GraficoItem(
      grafico: G19CombinadoBarrasLinea(),
      titulo: "19. Combinado: barras + línea",
      categoria: "Comparación",
      descripcion: "El gráfico combinado de barras y líneas permite representar dos tipos de información en un mismo gráfico para comparar magnitudes y observar tendencias simultáneamente.",
    ),

    GraficoItem(
      grafico: G20Piramide(),
      titulo: "20. Pirámide",
      categoria: "Comparación",
      descripcion: "El gráfico de pirámide permite comparar cantidades entre diferentes categorías o grupos mediante una distribución simétrica de los valores.",
    ),
  ];
}
