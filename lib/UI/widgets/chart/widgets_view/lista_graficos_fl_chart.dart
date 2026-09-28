import 'package:graficos/UI/view_model/graficos_view_model.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_barras_agrupadas_apiladas.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_area_entre_lineas.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_area.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_barra_agrupada_horizontal.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_barra_horizontal.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_barra_horizontal_apilada.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_barra_positiva_negativa.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_barras.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_barras_agrupadas.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_barras_agrupadas_error.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_barras_agrupadas_lineas.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_barras_apiladas.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_barras_con_error.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_barras_horizontal_linea.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_burbujas.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_cascada.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_circular.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_dispersion.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_dispersion_con_error.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_dona.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_dumbbell.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_lienas_multiples.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_linea_discontinua_area.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_linea_error.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_linea_escalonada.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_lineas_dispersion.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_lineas_escalonadas.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_medidor.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_medidor_multi_anillo.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_pronostico.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_radar.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_velas.dart';
import 'package:graficos/data/model/grafico_item.dart';

List<GraficoItem> listaGraficosFlChart({required GraficosViewModel viewModel}) {
  final games = viewModel.videoJuegos;
  final fiveGame = games.take(5).toList();

  return [
    GraficoItem(
      grafico: GraficoDona(videoJuegos: fiveGame),
      titulo: "Grafico de dona",
      categoria: "Composicion",
      descripcion: "El grafico de dona sirve para mostrar como se distribuye un total entre diferentes categorias y visualizar qué proporcion representa cada una.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBarras(videoJuegos: fiveGame),
      titulo: "Grafico de barras",
      categoria: "Comparacion",
      descripcion: "El grafico de barras sirve para comparar valores entre diferentes videojuegos, categorias o grupos.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBarrasApiladas(
        categorias: viewModel.categorias(fiveGame),
        videoJuegos: fiveGame,
      ),
      titulo: "Grafico de barras apiladas",
      categoria: "Composicion",
      descripcion: "El grafico de barras apiladas sirve para mostrar la composicion de un valor y como diferentes partes contribuyen al total.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoCircular(videoJuegos: fiveGame),
      titulo: "Grafico circular",
      categoria: "Distribucion",
      descripcion: "El grafico circular sirve para representar la distribucion proporcional de los datos entre diferentes categorias.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBarraHorizontal(videoJuegos: fiveGame),
      titulo: "Grafico de barras horizontal",
      categoria: "Comparacion",
      descripcion: "El grafico de barras horizontal sirve para comparar valores y facilita la lectura cuando los nombres de los elementos son largos.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoMedidor(videoJuegos: games),
      titulo: "Grafico medidor",
      categoria: "Rendimiento",
      descripcion: "El grafico medidor sirve para mostrar el nivel de una métrica respecto a un rango o valor de referencia.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBarrasAgrupadas(videoJuegos: games),
      titulo: "Grafico de barras agrupadas",
      categoria: "Comparacion",
      descripcion: "El grafico de barras agrupadas sirve para comparar diferentes valores de varios grupos dentro de una misma categoria.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoPronostico(videoJuegos: games),
      titulo: "Grafico de pronostico",
      categoria: "Pronostico",
      descripcion: "El grafico de pronostico sirve para representar datos historicos y estimar posibles valores futuros a partir de su comportamiento.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoAreas(
        videoJuegos: games,
        maxJugadores: viewModel.obtenerMaximo(
          games,
          (mes) => mes.jugadoresActivos.toDouble(),
        ),
      ),
      titulo: "Grafico de areas",
      categoria: "Tendencia",
      descripcion: "El grafico de areas sirve para observar como cambia una variable a través del tiempo y visualizar la magnitud de esos cambios.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoRadar(videoJuegos: games),
      titulo: "Grafico radar",
      categoria: "Comparacion",
      descripcion: "El grafico radar sirve para comparar varias caracteristicas de uno o mas videojuegos y observar sus fortalezas y diferencias.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoDispersion(videoJuegos: games),
      titulo: "Grafico de dispersion",
      categoria: "Relacion",
      descripcion: "El grafico de dispersion sirve para analizar la relacion entre dos variables e identificar posibles patrones o agrupaciones en los datos.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoMedidorMultiAnillo(videoJuegos: games),
      titulo: "Grafico medidor de múltiples anillos",
      categoria: "Rendimiento",
      descripcion: "El grafico de múltiples anillos sirve para comparar simultaneamente el nivel alcanzado por varias métricas.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoVelas(videoJuegos: games),
      titulo: "Grafico de velas",
      categoria: "Variabilidad",
      descripcion: "El grafico de velas sirve para representar valores maximos, minimos, iniciales y finales dentro de diferentes periodos.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBarraPositivasNegativas(videoJuegos: games),
      titulo: "Grafico de barras positivas y negativas",
      categoria: "Comparacion",
      descripcion: "El grafico de barras positivas y negativas sirve para comparar valores que se encuentran por encima o por debajo de un punto de referencia.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoAreaEntreLineas(videoJuegos: games),
      titulo: "Grafico de area entre lineas",
      categoria: "Relacion",
      descripcion: "El grafico de area entre lineas sirve para comparar dos series y visualizar las diferencias entre sus valores a través del tiempo.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoLineaError(videoJuegos: games),
      titulo: "Grafico de linea con error",
      categoria: "Variabilidad",
      descripcion: "El grafico de linea con error sirve para representar valores junto con su margen de error o variacion estimada.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoLineasEscalonadas(videoJuegos: games),
      titulo: "Grafico de lineas escalonadas",
      categoria: "Tendencia",
      descripcion: "El grafico de lineas escalonadas sirve para representar cambios que ocurren por intervalos o pasos definidos.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoLineasMultiples(videoJuegos: games),
      titulo: "Grafico de lineas múltiples",
      categoria: "Tendencia",
      descripcion: "El grafico de lineas múltiples sirve para comparar la evolucion de varias variables a través del tiempo.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBurbujas(videoJuegos: games),
      titulo: "Grafico de burbujas",
      categoria: "Relacion",
      descripcion: "El grafico de burbujas sirve para analizar la relacion entre variables utilizando el tamaño de las burbujas para representar una variable adicional.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoCascada(videoJuegos: games),
      titulo: "Grafico de cascada",
      categoria: "Composicion",
      descripcion: "El grafico de cascada sirve para mostrar como diferentes valores positivos y negativos contribuyen al cambio de un valor inicial hasta un valor final.",
      tituloVisible: false,
    ),
    GraficoItem(
      grafico: GraficoBarrasHorizontalesAgrupadas(videoJuegos: games),
      titulo: "Grafico de barras agrupadas horizontal",
      categoria: "Comparacion",
      descripcion: "Permite comparar dos métricas mediante barras horizontales agrupadas para cada videojuego.",
    ),

    GraficoItem(
      grafico: GraficoBarrasHorizontalesApiladas(videoJuegos: games),
      titulo: "Grafico de barras apiladas horizontal",
      categoria: "Composicion",
      descripcion: "Permite mostrar como diferentes métricas contribuyen al total de cada videojuego mediante barras horizontales apiladas.",
    ),

    GraficoItem(
      grafico: GraficoBarrasConError(videoJuegos: fiveGame),
      titulo: "Grafico Barras con error",
      categoria: "Variabilidad",
      descripcion: "Representa los valores mediante barras acompañadas de un margen de error para mostrar la variabilidad de los datos.",
    ),

    GraficoItem(
      grafico: GraficoDispersionConError(videoJuegos: games),
      titulo: "Grafico Dispersion Con Error",
      categoria: "Variabilidad",
      descripcion: "Muestra la relacion entre dos variables mediante puntos acompañados de margenes de error.",
    ),

    GraficoItem(
      grafico: GraficoLineaEscalonada(videoJuegos: games),
      titulo: "Grafico linea escalonada",
      categoria: "Tendencia",
      descripcion: "Combina una linea escalonada con un area para representar cambios por intervalos y resaltar la magnitud de los valores.",
    ),

    GraficoItem(
      grafico: GraficoLineaDiscontinuaArea(videoJuegos: games),
      titulo: "Grafico linea discontinua con area",
      categoria: "Tendencia",
      descripcion: "Utiliza una linea discontinua junto con un area para representar una tendencia de forma diferenciada.",
    ),

    GraficoItem(
      grafico: GraficoDumbbell(videoJuegos: games),
      titulo: "Grafico Dumbbell",
      categoria: "Comparacion",
      descripcion: "Compara dos valores de cada videojuego mediante puntos conectados, permitiendo observar la distancia entre ambas métricas.",
    ),

    GraficoItem(
      grafico: GraficoBarrasAgrupadasApiladas(videoJuegos: games),
      titulo: "Grafico de barras agrupadas apiladas",
      categoria: "Composicion",
      descripcion: "Combina barras agrupadas y apiladas para comparar diferentes métricas entre videojuegos y, al mismo tiempo, mostrar como se distribuye cada métrica en sus diferentes componentes.",
    ),

    GraficoItem(
      grafico: GraficoBarrasAgrupadasError(videoJuegos: games),
      titulo: "Grafico de barras agrupadas con error",
      categoria: "Variabilidad",
      descripcion: "Permite comparar dos métricas de diferentes videojuegos mediante barras agrupadas, incorporando un margen de error que representa la variabilidad o incertidumbre de los valores.",
    ),

    GraficoItem(
      grafico: GraficoLineasConDispersion(),
      titulo: "Grafico de lineas con dispersion",
      categoria: "Relacion",
      descripcion: "Combina lineas y puntos de dispersion para mostrar la evolucion de los datos y observar la distribucion de los valores en cada punto.",
    ),

    GraficoItem(
      grafico: GraficoBarrasHorizontalesConLinea(),
      titulo: "Grafico de barras horizontales con linea",
      categoria: "Comparacion",
      descripcion: "Combina barras horizontales con una linea para comparar los valores de diferentes elementos y visualizar simultaneamente su comportamiento.",
    ),

    GraficoItem(
      grafico: GraficoBarrasAgrupadasConTendencia(),
      titulo: "Grafico de barras agrupadas con tendencia",
      categoria: "Tendencia",
      descripcion: "Combina barras agrupadas con una linea de tendencia para comparar varias métricas entre videojuegos y observar el comportamiento general de los datos.",
    ),
  ];
}
