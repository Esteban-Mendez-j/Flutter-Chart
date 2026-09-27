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
  ];
}
