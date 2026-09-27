import 'package:graficos/UI/view_model/graficos_view_model.dart';
import 'package:graficos/data/model/grafico_item.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_cascada.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_barra_error.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_barras_intervalo.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_burbuja.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_caja_bigote.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_dispersion.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_histograma.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_barra_horizontal.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_linea_escalonada.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_columnas_apiladas.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_velas.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_area_rango.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_embudo.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/grafico_columnas_100.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/sf_g1_linea.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/sf_g2_columna.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/sf_g3_pie.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/sf_g4_dona.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/sf_g5_radial.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/sf_g6_area_suave.dart';
import 'package:graficos/UI/widgets/chart/syncfusion_charts/sf_g7_piramide.dart';

List<GraficoItem> listaGraficosSyncfusion({
  required GraficosViewModel viewModel,
}) {
  final games = viewModel.videoJuegos;

  return [
    GraficoItem(
      grafico: GraficoBarraError(videoJuegos: games),
      titulo: "Grafico de barras con error",
      categoria: "Variabilidad",
      descripcion: "El grafico de barras con error sirve para representar valores junto con un margen de error o variacion, permitiendo visualizar la incertidumbre o dispersion asociada a cada dato.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBarraIntervalo(videoJuegos: games),
      titulo: "Grafico de barras de intervalo",
      categoria: "Variabilidad",
      descripcion: "El grafico de barras de intervalo sirve para representar un rango de valores, mostrando los limites inferior y superior de una medida para facilitar la comparacion entre diferentes elementos.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBurbuja(videoJuegos: games),
      titulo: "Grafico de burbujas",
      categoria: "Relacion",
      descripcion: "El grafico de burbujas sirve para analizar la relacion entre varias variables. La posicion de cada burbuja representa dos variables y su tamaño permite representar una tercera variable.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoCajaBigote(videoJuegos: games),
      titulo: "Grafico de caja y bigotes",
      categoria: "Distribucion",
      descripcion: "El grafico de caja y bigotes sirve para representar la distribucion de un conjunto de datos mediante valores como el minimo, los cuartiles, la mediana y el maximo, ademas de facilitar la identificacion de valores atipicos.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoCascada(videoJuegos: games),
      titulo: "Grafico de cascada",
      categoria: "Composicion",
      descripcion: "El grafico de cascada sirve para mostrar como diferentes valores positivos y negativos contribuyen progresivamente al cambio de un valor inicial hasta alcanzar un resultado final.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoDispersion(videoJuegos: games),
      titulo: "Grafico de dispersion",
      categoria: "Relacion",
      descripcion: "El grafico de dispersion sirve para analizar la relacion entre dos variables numéricas, permitiendo identificar patrones, tendencias, agrupaciones o posibles valores atipicos.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoHistograma(videoJuegos: games),
      titulo: "Histograma",
      categoria: "Distribucion",
      descripcion: "El histograma sirve para representar la distribucion de una variable numérica agrupando los datos en intervalos y mostrando la frecuencia de observaciones dentro de cada intervalo.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBarraHorizontal(videoJuegos: games),
      titulo: "Grafico de barras horizontal",
      categoria: "Comparacion",
      descripcion: "El grafico de barras horizontal sirve para comparar valores entre diferentes elementos y facilita especialmente la lectura cuando las categorias o nombres son largos.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoLineaEscalonada(videoJuegos: games),
      titulo: "Grafico de lineas escalonadas",
      categoria: "Tendencia",
      descripcion: "El grafico de lineas escalonadas sirve para representar cambios que ocurren en momentos o intervalos definidos, mostrando cada variacion mediante segmentos horizontales y verticales.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoColumnasApiladas(videoJuegos: games),
      titulo: "Grafico de columnas apiladas",
      categoria: "Composicion",
      descripcion: "El grafico de columnas apiladas sirve para comparar diferentes categorias y mostrar al mismo tiempo como se compone el total de cada una mediante varias partes apiladas.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoVelas(videoJuegos: games),
      titulo: "Grafico de velas",
      categoria: "Variabilidad",
      descripcion: "El grafico de velas sirve para representar valores de apertura, cierre, maximo y minimo durante diferentes periodos, permitiendo analizar cambios y variaciones dentro de cada periodo.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoAreaRango(videoJuegos: games),
      titulo: "Grafico de area de rango",
      categoria: "Variabilidad",
      descripcion: "El grafico de area de rango sirve para representar la variacion entre un valor minimo y uno maximo a través del tiempo, permitiendo visualizar la amplitud de un conjunto de valores.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoEmbudo(videoJuegos: games),
      titulo: "Grafico de embudo",
      categoria: "Distribucion",
      descripcion: "El grafico de embudo sirve para representar etapas consecutivas de un proceso y mostrar como disminuye o cambia la cantidad de elementos a medida que avanzan por cada etapa.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoColumnas100(videoJuegos: games),
      titulo: "Grafico de columnas 100%",
      categoria: "Composicion",
      descripcion: "El grafico de columnas 100% sirve para comparar la composicion porcentual de diferentes grupos, haciendo que cada columna represente el 100% y mostrando qué proporcion ocupa cada categoria.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: SfG1Linea(),
      titulo: "Grafico de lineas",
      categoria: "Tendencia",
      descripcion: "El grafico de lineas sirve para representar la evolucion de una o mas variables a través del tiempo y permite identificar tendencias, aumentos, disminuciones y cambios entre periodos.",
    ),

    GraficoItem(
      grafico: SfG2Columna(),
      titulo: "Grafico de columnas",
      categoria: "Comparacion",
      descripcion: "El grafico de columnas sirve para comparar valores entre diferentes categorias mediante columnas verticales, permitiendo identificar facilmente diferencias de magnitud.",
    ),

    GraficoItem(
      grafico: SfG3Pie(),
      titulo: "Grafico circular",
      categoria: "Composicion",
      descripcion: "El grafico circular sirve para representar como se divide un total entre diferentes categorias, mostrando visualmente la proporcion que corresponde a cada una.",
    ),

    GraficoItem(
      grafico: SfG4Dona(),
      titulo: "Grafico de dona",
      categoria: "Composicion",
      descripcion: "El grafico de dona sirve para mostrar como se distribuye un total entre diferentes categorias y permite visualizar la proporcion que representa cada una.",
    ),

    GraficoItem(
      grafico: SfG5Radial(),
      titulo: "Grafico radial",
      categoria: "Comparacion",
      descripcion: "El grafico radial sirve para representar y comparar valores alrededor de un eje central, siendo útil para visualizar diferencias entre varias categorias o dimensiones.",
    ),

    GraficoItem(
      grafico: SfG6AreaSuave(),
      titulo: "Grafico de area suave",
      categoria: "Tendencia",
      descripcion: "El grafico de area suave sirve para representar la evolucion de una variable a través del tiempo y resaltar visualmente la magnitud de los valores y sus cambios.",
    ),

    GraficoItem(
      grafico: SfG7Piramide(),
      titulo: "Grafico de piramide",
      categoria: "Comparacion",
      descripcion: "El grafico de piramide sirve para comparar cantidades distribuidas entre diferentes categorias o grupos, organizando los valores de manera visual para facilitar la comparacion.",
    ),
  ];
}
