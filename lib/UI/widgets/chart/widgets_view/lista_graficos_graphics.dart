// Importación de las 32 gráficas (librería graphic)
import 'package:graficos/UI/view_model/graficos_view_model.dart';
import 'package:graficos/UI/widgets/chart/graphics/g10_lineas_puntos.dart';
import 'package:graficos/UI/widgets/chart/graphics/g11_linea_escalonada.dart';
import 'package:graficos/UI/widgets/chart/graphics/g12_area_apilada.dart';
import 'package:graficos/UI/widgets/chart/graphics/g13_radar.dart';
import 'package:graficos/UI/widgets/chart/graphics/g14_rosa_polar.dart';
import 'package:graficos/UI/widgets/chart/graphics/g15_burbujas.dart';
import 'package:graficos/UI/widgets/chart/graphics/g16_mapa_calor.dart';
import 'package:graficos/UI/widgets/chart/graphics/g17_linea_suave_area.dart';
import 'package:graficos/UI/widgets/chart/graphics/g18_interactivo_tooltip.dart';
import 'package:graficos/UI/widgets/chart/graphics/g19_combinado_barras_linea.dart';
import 'package:graficos/UI/widgets/chart/graphics/g1_barras_verticales.dart';
import 'package:graficos/UI/widgets/chart/graphics/g20_piramide.dart';
import 'package:graficos/UI/widgets/chart/graphics/g21_intervalo_barras.dart';
import 'package:graficos/UI/widgets/chart/graphics/g22_lineas_multiseries.dart';
import 'package:graficos/UI/widgets/chart/graphics/g23_barras_porcentaje_100.dart';
import 'package:graficos/UI/widgets/chart/graphics/g24_gantt.dart';
import 'package:graficos/UI/widgets/chart/graphics/g25_barras_divergentes.dart';
import 'package:graficos/UI/widgets/chart/graphics/g26_puntos_tamano_color.dart';
import 'package:graficos/UI/widgets/chart/graphics/g27_area_escalonada.dart';
import 'package:graficos/UI/widgets/chart/graphics/g28_dispersion_tendencia.dart';
import 'package:graficos/UI/widgets/chart/graphics/g29_grafica_embudo.dart';
import 'package:graficos/UI/widgets/chart/graphics/g2_barras_horizontales.dart';
import 'package:graficos/UI/widgets/chart/graphics/g30_burbujas_categorias.dart';
import 'package:graficos/UI/widgets/chart/graphics/g31_linea_rango_sombra.dart';
import 'package:graficos/UI/widgets/chart/graphics/g32_coordeanadas_paralelas.dart';
import 'package:graficos/UI/widgets/chart/graphics/g3_linea_simple.dart';
import 'package:graficos/UI/widgets/chart/graphics/g4_puntos_scatter.dart';
import 'package:graficos/UI/widgets/chart/graphics/g5_area_simple.dart';
import 'package:graficos/UI/widgets/chart/graphics/g6_circular_pie.dart';
import 'package:graficos/UI/widgets/chart/graphics/g7_rea_banda.dart';
import 'package:graficos/UI/widgets/chart/graphics/g8_barras_agrupadas.dart';
import 'package:graficos/UI/widgets/chart/graphics/g9_barras_apiladas.dart';
import 'package:graficos/data/model/grafico_item.dart';

/// Ahora recibe los datos (ya no puede ser `const`, porque cada gráfica
/// depende de la lista de videojuegos).
List<GraficoItem> listaGraficosGraphic({required GraficosViewModel viewModel}) {
  final games = viewModel.videoJuegos;

  return [
    GraficoItem(
      grafico: G1BarrasVerticales(videoJuegos: games),
      titulo: "1. Barras verticales",
      categoria: "Comparacion",
      descripcion: "El grafico de barras verticales permite comparar los valores de diferentes categorias mediante barras, facilitando la identificación de diferencias entre los datos.",
    ),
    GraficoItem(
      grafico: G2BarrasHorizontales(videoJuegos: games),
      titulo: "2. Barras horizontales",
      categoria: "Comparacion",
      descripcion: "El grafico de barras horizontales permite comparar diferentes categorias mediante barras horizontales y facilita la lectura de nombres o etiquetas largas.",
    ),
    GraficoItem(
      grafico: G3LineaSimple(videoJuegos: games),
      titulo: "3. Linea simple",
      categoria: "Tendencia",
      descripcion: "El grafico de linea simple permite representar la evolución de una variable y observar tendencias, aumentos, disminuciones y cambios entre diferentes valores.",
    ),
    GraficoItem(
      grafico: G4PuntosScatter(videoJuegos: games),
      titulo: "4. Puntos (Scatter)",
      categoria: "Relacion",
      descripcion: "El grafico de dispersión representa pares de valores mediante puntos y permite analizar la Relacion, distribución y posibles patrones entre dos variables.",
    ),
    GraficoItem(
      grafico: G5AreaSimple(videoJuegos: games),
      titulo: "5. Area simple",
      categoria: "Tendencia",
      descripcion: "El grafico de area simple permite representar la evolución de una variable y resaltar visualmente la magnitud de los valores mediante el area situada debajo de la linea.",
    ),
    GraficoItem(
      grafico: G6CircularPie(videoJuegos: games),
      titulo: "6. Circular (Pie)",
      categoria: "Composición",
      descripcion: "El grafico circular permite mostrar cómo se divide un total entre diferentes categorias mediante segmentos que representan la proporción de cada una.",
    ),
    GraficoItem(
      grafico: GA7reaBanda(videoJuegos: games),
      titulo: "7. Area de banda",
      categoria: "Tendencia",
      descripcion: "El grafico de area de banda permite representar un rango de valores y visualizar la variación de una variable a lo largo del tiempo.",
    ),
    GraficoItem(
      grafico: G8BarrasAgrupadas(videoJuegos: games),
      titulo: "8. Barras agrupadas",
      categoria: "Comparacion",
      descripcion: "El grafico de barras agrupadas permite comparar varias series de datos dentro de diferentes categorias, mostrando cada valor de forma independiente.",
    ),
    GraficoItem(
      grafico: G9BarrasApiladas(videoJuegos: games),
      titulo: "9. Barras apiladas",
      categoria: "Composición",
      descripcion: "El grafico de barras apiladas permite representar un total dividido en diferentes partes y comparar simultaneamente la composición de varias categorias.",
    ),
    GraficoItem(
      grafico: G10LineasPuntos(videoJuegos: games),
      titulo: "10. Lineas y puntos",
      categoria: "Tendencia",
      descripcion: "El grafico de lineas y puntos combina una linea con marcadores individuales para representar una tendencia y destacar cada uno de los valores.",
    ),
    GraficoItem(
      grafico: G11LineaEscalonada(videoJuegos: games),
      titulo: "11. Linea escalonada",
      categoria: "Tendencia",
      descripcion: "El grafico de linea escalonada representa cambios mediante segmentos horizontales y verticales, siendo útil para datos que cambian en momentos especificos.",
    ),
    GraficoItem(
      grafico: G12AreaApilada(videoJuegos: games),
      titulo: "12. Area apilada",
      categoria: "Composición",
      descripcion: "El grafico de area apilada permite observar la evolución de varias series y, al mismo tiempo, visualizar cómo cada una contribuye al total.",
    ),
    GraficoItem(
      grafico: G13Radar(videoJuegos: games),
      titulo: "13. Radar",
      categoria: "Comparacion",
      descripcion: "El grafico de radar permite comparar varias variables o caracteristicas de diferentes elementos utilizando ejes distribuidos alrededor de un punto central.",
    ),
    GraficoItem(
      grafico: G14RosaPolar(videoJuegos: games),
      titulo: "14. Rosa polar",
      categoria: "Comparacion",
      descripcion: "El grafico de rosa polar representa valores mediante segmentos distribuidos radialmente y permite comparar magnitudes entre diferentes categorias.",
    ),
    GraficoItem(
      grafico: G15Burbujas(videoJuegos: games),
      titulo: "15. Burbujas",
      categoria: "Relacion",
      descripcion: "El grafico de burbujas permite analizar la Relacion entre varias variables utilizando la posición para representar datos y el tamaño de cada burbuja para representar una variable adicional.",
    ),
    GraficoItem(
      grafico: G16MapaCalor(videoJuegos: games),
      titulo: "16. Mapa de calor",
      categoria: "Distribución",
      descripcion: "El mapa de calor representa valores mediante diferentes intensidades visuales, permitiendo identificar concentraciones, patrones y diferencias dentro de una matriz de datos.",
    ),
    GraficoItem(
      grafico: G17LineaSuaveArea(videoJuegos: games),
      titulo: "17. Linea suave con area",
      categoria: "Tendencia",
      descripcion: "El grafico de linea suave con area representa la evolución de una variable utilizando una linea suavizada y un area que resalta visualmente la magnitud de los valores.",
    ),
    GraficoItem(
      grafico: G18InteractivoTooltip(videoJuegos: games),
      titulo: "18. Grafico interactivo con Tooltip",
      categoria: "Interactividad",
      descripcion: "El grafico interactivo con Tooltip permite consultar información adicional al interactuar con los elementos del grafico, facilitando la exploración detallada de los datos.",
    ),
    GraficoItem(
      grafico: G19CombinadoBarrasLinea(videoJuegos: games),
      titulo: "19. Combinado: barras + linea",
      categoria: "Comparacion",
      descripcion: "El grafico combinado de barras y lineas permite representar dos tipos de información en un mismo grafico para comparar magnitudes y observar tendencias simultaneamente.",
    ),
    GraficoItem(
      grafico: G20Piramide(videoJuegos: games),
      titulo: "20. Piramide",
      categoria: "Comparacion",
      descripcion: "El grafico de piramide permite comparar cantidades entre diferentes categorias o grupos mediante una distribución simétrica de los valores.",
    ),
    GraficoItem(
      grafico: G21IntervaloBarras(videoJuegos: games),
      titulo: "21. Intervalo de barras",
      categoria: "Comparacion",
      descripcion: "Muestra rangos flotantes entre valores mínimos y máximos para evaluar variaciones dentro de una categoría.",
    ),
    GraficoItem(
      grafico: G22LineasMultiseries(videoJuegos: games),
      titulo: "22. Líneas multiseries",
      categoria: "Tendencia",
      descripcion: "Permite comparar la evolución temporal de múltiples grupos de datos de forma simultánea en un mismo eje.",
    ),
    GraficoItem(
      grafico: G23BarrasPorcentaje100(videoJuegos: games),
      titulo: "23. Barras apiladas al 100%",
      categoria: "Composición",
      descripcion: "Representa la proporción relativa de cada componente dentro del total acumulado para cada categoría.",
    ),
    GraficoItem(
      grafico: G24Gantt(videoJuegos: games),
      titulo: "24. Gantt",
      categoria: "Tendencia",
      // Ajustada: habla del tipo de gráfica (rangos en el tiempo), no de "tareas"
      descripcion: "Visualiza la duración de distintos elementos como barras horizontales con un punto de inicio y uno de fin sobre un eje de tiempo, útil para comparar periodos y detectar solapamientos.",
    ),
    GraficoItem(
      grafico: G25BarrasDivergentes(videoJuegos: games),
      titulo: "25. Barras divergentes",
      categoria: "Comparacion",
      descripcion: "Permite comparar métricas que presentan valores positivos y negativos a partir de una línea base de origen.",
    ),
    GraficoItem(
      grafico: G26PuntosTamanoColor(videoJuegos: games),
      titulo: "26. Dispersión multivariable",
      categoria: "Relacion",
      descripcion: "Representa datos complejos mapeando simultáneamente variables en ejes X, Y, tamaño de punto y color.",
    ),
    GraficoItem(
      grafico: G27AreaEscalonada(videoJuegos: games),
      titulo: "27. Área escalonada",
      categoria: "Tendencia",
      descripcion: "Muestra acumulados en intervalos discretos mediante cambios bruscos entre niveles horizontales.",
    ),
    GraficoItem(
      grafico: G28DispersionTendencia(videoJuegos: games),
      titulo: "28. Dispersión con línea de tendencia",
      categoria: "Relacion",
      descripcion: "Visualiza la Relacion entre dos variables con puntos y una línea de tendencia resultante de regresión lineal.",
    ),
    GraficoItem(
      grafico: G29GraficoEmbudo(videoJuegos: games),
      titulo: "29. Embudo",
      categoria: "Composición",
      descripcion: "Muestra la evolución de una variable a través de distintas etapas, representando la pérdida o ganancia de valores.",
    ),
    GraficoItem(
      grafico: G30BurbujasCategorias(videoJuegos: games),
      titulo: "30. Burbujas por categoría",
      categoria: "Relacion",
      descripcion: "Muestra magnitud y diferenciación por categoría mediante puntos escalados por tamaño.",
    ),
    GraficoItem(
      grafico: G31LineaRangoSombra(videoJuegos: games),
      titulo: "31. Línea con rango e incertidumbre",
      categoria: "Tendencia",
      descripcion: "Combina una línea de valor promedio con un área sombreada que delimita los valores mínimos y máximos.",
    ),
    GraficoItem(
      grafico: G32CoordenadasParalelas(videoJuegos: games),
      titulo: "32. Coordenadas paralelas",
      categoria: "Relacion",
      descripcion: "Visualiza la Relacion entre múltiples variables utilizando líneas que conectan puntos en ejes paralelos.",
    ),
  ];
}
