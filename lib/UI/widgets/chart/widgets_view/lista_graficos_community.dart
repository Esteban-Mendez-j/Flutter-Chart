import 'package:graficos/UI/view_model/graficos_view_model.dart';
import 'package:graficos/data/model/grafico_item.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_barra_chispa.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_barra_horizontal.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_barra_horizontal_etiquetas.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_barra_linea_objetivo.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_barras_agrupadas.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_barras_agrupadas_apiladas.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_barras_apiladas.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_barras_patron.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_barras_simple.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_circular_parcial.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_circular_simple.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_combo_barra_linea.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_dispersion_burbuja.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_dispersion_simple.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_dona.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_linea_punteada.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_linea_puntos.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_linea_simple.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_lineas_multiples.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_series_tiempo.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_area_simple.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_area_apilada_community.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_barras_horizontales_apiladas.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_barras_horizontales_agrupadas.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_barras_positivas_negativas.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_barras_redondeadas.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_circular_etiquetas_externas.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_barras_apiladas_porcentaje.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_linea_anotacion_rango.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_series_tiempo_seleccion.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_dispersion_tendencia.dart';
import 'package:graficos/UI/widgets/chart/community_charts/grafico_barras_doble_eje.dart';

List<GraficoItem> listaGraficosCommunity({
  required GraficosViewModel viewModel,
}) {
  final games = viewModel.videoJuegos;
  final fiveGame = games.take(5).toList();
  final eightGame = games.take(8).toList();

  return [
    // --- Barras (9) ---

    GraficoItem(
      grafico: GraficoBarrasSimple(videoJuegos: eightGame),
      titulo: "Grafico de barras simple",
      categoria: "Comparacion",
      descripcion: "El grafico de barras simple sirve para comparar los valores de diferentes elementos mediante barras, permitiendo identificar facilmente las diferencias entre ellos.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBarrasAgrupadas(videoJuegos: fiveGame),
      titulo: "Grafico de barras agrupadas",
      categoria: "Comparacion",
      descripcion: "El grafico de barras agrupadas permite comparar varias series de datos dentro de diferentes categorias, mostrando los valores de cada grupo de forma independiente.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBarrasApiladas(videoJuegos: fiveGame),
      titulo: "Grafico de barras apiladas",
      categoria: "Composicion",
      descripcion: "El grafico de barras apiladas permite mostrar un valor total dividido en diferentes partes, facilitando el analisis de la composicion de cada categoria.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBarrasAgrupadasApiladas(videoJuegos: games),
      titulo: "Grafico de barras agrupadas y apiladas",
      categoria: "Composicion",
      descripcion: "Este grafico combina barras agrupadas y apiladas para comparar diferentes grupos y, al mismo tiempo, mostrar como se compone cada uno de ellos.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBarraHorizontal(videoJuegos: fiveGame),
      titulo: "Grafico de barras horizontal",
      categoria: "Comparacion",
      descripcion: "El grafico de barras horizontal permite comparar valores mediante barras horizontales y facilita la lectura cuando las categorias tienen nombres largos.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBarraHorizontalEtiquetas(videoJuegos: fiveGame),
      titulo: "Barras horizontales con etiquetas",
      categoria: "Comparacion",
      descripcion: "Este grafico utiliza barras horizontales acompañadas de etiquetas para facilitar la identificacion de los valores correspondientes a cada categoria.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBarrasPatron(videoJuegos: fiveGame),
      titulo: "Grafico de barras con patron",
      categoria: "Comparacion",
      descripcion: "El grafico de barras con patron permite diferenciar visualmente las categorias mediante distintos patrones ademas del tamaño de las barras.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBarraChispa(videoJuegos: games),
      titulo: "Grafico de barras tipo chispa",
      categoria: "Tendencia",
      descripcion: "El grafico de barras tipo chispa permite representar de forma compacta pequeñas variaciones o tendencias en los datos ocupando poco espacio visual.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBarraLineaObjetivo(videoJuegos: eightGame),
      titulo: "Grafico de barras con linea objetivo",
      categoria: "Rendimiento",
      descripcion: "El grafico de barras con linea objetivo permite comparar los valores obtenidos con un valor de referencia o meta para identificar qué elementos alcanzan o superan el objetivo.",
      tituloVisible: false,
    ),

    // --- Lineas (4) ---
    GraficoItem(
      grafico: GraficoLineaSimple(videoJuegos: games),
      titulo: "Grafico de lineas simple",
      categoria: "Tendencia",
      descripcion: "El grafico de lineas simple permite representar la evolucion de una variable y observar aumentos, disminuciones y cambios entre diferentes puntos.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoLineaPuntos(videoJuegos: games),
      titulo: "Grafico de lineas con puntos",
      categoria: "Tendencia",
      descripcion: "El grafico de lineas con puntos representa una tendencia mediante una linea y puntos individuales que permiten identificar con mayor claridad cada valor.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoLineasMultiples(videoJuegos: games),
      titulo: "Grafico de lineas múltiples",
      categoria: "Comparacion",
      descripcion: "El grafico de lineas múltiples permite comparar la evolucion de varias variables o series de datos dentro de un mismo grafico.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoLineaPunteada(videoJuegos: games),
      titulo: "Grafico de lineas punteadas",
      categoria: "Tendencia",
      descripcion: "El grafico de lineas punteadas representa la evolucion de los datos utilizando segmentos discontinuos, permitiendo diferenciar visualmente una serie o destacar una tendencia.",
      tituloVisible: false,
    ),

    // --- Circulares (3) ---
    GraficoItem(
      grafico: GraficoCircularSimple(videoJuegos: fiveGame),
      titulo: "Grafico circular simple",
      categoria: "Composicion",
      descripcion: "El grafico circular simple permite mostrar como se distribuye un total entre diferentes categorias mediante proporciones representadas como segmentos de un circulo.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoDona(videoJuegos: games),
      titulo: "Grafico de dona",
      categoria: "Composicion",
      descripcion: "El grafico de dona sirve para mostrar como se distribuye un total entre diferentes categorias y visualizar la proporcion que representa cada una.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoCircularParcial(videoJuegos: games),
      titulo: "Grafico circular parcial",
      categoria: "Composicion",
      descripcion: "El grafico circular parcial permite representar una distribucion utilizando una seccion del circulo, siendo útil para mostrar proporciones o valores parciales.",
      tituloVisible: false,
    ),

    // --- Dispersion (2) ---
    GraficoItem(
      grafico: GraficoDispersionSimple(videoJuegos: games),
      titulo: "Grafico de dispersion simple",
      categoria: "Relacion",
      descripcion: "El grafico de dispersion simple permite analizar la relacion entre dos variables numéricas mediante puntos, ayudando a identificar patrones, tendencias o valores atipicos.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoDispersionBurbuja(videoJuegos: games),
      titulo: "Grafico de dispersion con burbujas",
      categoria: "Relacion",
      descripcion: "El grafico de dispersion con burbujas permite relacionar varias variables al utilizar la posicion para representar datos y el tamaño de las burbujas para representar una variable adicional.",
      tituloVisible: false,
    ),

    // --- Serie de tiempo (1) ---
    GraficoItem(
      grafico: GraficoSeriesTiempo(videoJuegos: games),
      titulo: "Grafico de series de tiempo",
      categoria: "Tendencia",
      descripcion: "El grafico de series de tiempo permite analizar como cambia una variable a través de diferentes periodos y facilita la identificacion de tendencias y variaciones temporales.",
      tituloVisible: false,
    ),

    // --- Combo (1) ---
    GraficoItem(
      grafico: GraficoComboBarraLinea(videoJuegos: games),
      titulo: "Grafico combinado de barras y lineas",
      categoria: "Comparacion",
      descripcion: "El grafico combinado de barras y lineas permite representar dos tipos de informacion en un mismo grafico, facilitando la comparacion entre valores y tendencias.",
      tituloVisible: false,
    ),
    // --- Nuevos (12) ---

    GraficoItem(
      grafico: GraficoAreaSimple(videoJuegos: games),
      titulo: "Grafico de area simple",
      categoria: "Tendencia",
      descripcion: "El grafico de area simple representa la evolucion de una variable con una linea y rellena el espacio inferior, resaltando el volumen acumulado a lo largo del tiempo.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoAreaApiladaCommunity(videoJuegos: games),
      titulo: "Grafico de area apilada",
      categoria: "Composicion",
      descripcion: "El grafico de area apilada superpone varias series para mostrar como cada una contribuye al total en cada periodo.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBarrasHorizontalesApiladas(videoJuegos: fiveGame),
      titulo: "Barras horizontales apiladas",
      categoria: "Composicion",
      descripcion: "Las barras horizontales apiladas dividen el total de cada categoria en partes, con una lectura comoda cuando los nombres son largos.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBarrasHorizontalesAgrupadas(videoJuegos: fiveGame),
      titulo: "Barras horizontales agrupadas",
      categoria: "Comparacion",
      descripcion: "Las barras horizontales agrupadas comparan varias series dentro de cada categoria, colocando las barras una junto a otra.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBarrasPositivasNegativas(videoJuegos: eightGame),
      titulo: "Grafico de barras positivas y negativas",
      categoria: "Comparacion",
      descripcion: "El grafico de barras positivas y negativas muestra desviaciones respecto a una referencia, diferenciando con color los valores que quedan por encima y por debajo.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBarrasRedondeadas(videoJuegos: fiveGame),
      titulo: "Grafico de barras redondeadas con etiquetas",
      categoria: "Comparacion",
      descripcion: "Este grafico usa barras con esquinas redondeadas y escribe el valor sobre cada una para leer los datos sin consultar el eje.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoCircularEtiquetasExternas(videoJuegos: fiveGame),
      titulo: "Grafico circular con etiquetas externas",
      categoria: "Composicion",
      descripcion: "El grafico circular con etiquetas externas coloca el nombre y el porcentaje fuera de cada porcion, evitando que el texto se amontone dentro del circulo.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBarrasApiladasPorcentaje(videoJuegos: fiveGame),
      titulo: "Barras apiladas al 100%",
      categoria: "Composicion",
      descripcion: "Las barras apiladas al 100% muestran la proporcion de cada parte dentro del total, permitiendo comparar la composicion entre categorias sin importar su tamaño.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoLineaAnotacionRango(videoJuegos: games),
      titulo: "Grafico de lineas con anotacion de rango",
      categoria: "Tendencia",
      descripcion: "El grafico de lineas con anotacion de rango resalta con una franja sombreada un periodo de interes, como el pico de una serie.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoSeriesTiempoSeleccion(videoJuegos: games),
      titulo: "Serie de tiempo interactiva",
      categoria: "Tendencia",
      descripcion: "La serie de tiempo interactiva permite tocar o arrastrar sobre la linea para resaltar el punto mas cercano y consultar su valor.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoDispersionTendencia(videoJuegos: games),
      titulo: "Grafico de dispersion con linea de tendencia",
      categoria: "Relacion",
      descripcion: "El grafico de dispersion con linea de tendencia añade una recta de regresion que resume la direccion general de la relacion entre dos variables.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBarrasDobleEje(videoJuegos: fiveGame),
      titulo: "Grafico de barras con doble eje",
      categoria: "Comparacion",
      descripcion: "El grafico de barras con doble eje compara dos medidas de escalas muy distintas usando un eje vertical a cada lado.",
      tituloVisible: false,
    ),
  ];
}
