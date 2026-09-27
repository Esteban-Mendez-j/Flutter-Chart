import 'package:graficos/UI/view_model/graficos_view_model.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_area_entre_lineas.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_area.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_barra_horizontal.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_barra_positiva_negativa.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_barras.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_barras_agrupadas.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_barras_apiladas.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_burbujas.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_cascada.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_circular.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_dispersion.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_dona.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_lienas_multiples.dart';
import 'package:graficos/UI/widgets/chart/fl_chart/grafico_linea_error.dart';
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
      titulo: null,
      categoria: "Composicion",
      descripcion: "El gráfico de dona sirve para mostrar como se distribuye un total entre diferentes categorías y visualizar qué proporcion representa cada una.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBarras(videoJuegos: fiveGame),
      titulo: null,
      categoria: "Comparacion",
      descripcion: "El gráfico de barras sirve para comparar valores entre diferentes videojuegos, categorías o grupos.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBarrasApiladas(
        categorias: viewModel.categorias(fiveGame),
        videoJuegos: fiveGame,
      ),
      titulo: null,
      categoria: "Composicion",
      descripcion: "El gráfico de barras apiladas sirve para mostrar la composicion de un valor y como diferentes partes contribuyen al total.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoCircular(videoJuegos: fiveGame),
      titulo: null,
      categoria: "Distribucion",
      descripcion: "El gráfico circular sirve para representar la distribucion proporcional de los datos entre diferentes categorías.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBarraHorizontal(videoJuegos: fiveGame),
      titulo: null,
      categoria: "Comparacion",
      descripcion: "El gráfico de barras horizontal sirve para comparar valores y facilita la lectura cuando los nombres de los elementos son largos.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoMedidor(videoJuegos: games),
      titulo: null,
      categoria: "Rendimiento",
      descripcion: "El gráfico medidor sirve para mostrar el nivel de una métrica respecto a un rango o valor de referencia.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBarrasAgrupadas(videoJuegos: games),
      titulo: null,
      categoria: "Comparacion",
      descripcion: "El gráfico de barras agrupadas sirve para comparar diferentes valores de varios grupos dentro de una misma categoría.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoPronostico(videoJuegos: games),
      titulo: null,
      categoria: "Pronostico",
      descripcion: "El gráfico de pronostico sirve para representar datos historicos y estimar posibles valores futuros a partir de su comportamiento.",
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
      titulo: null,
      categoria: "Tendencia",
      descripcion: "El gráfico de áreas sirve para observar como cambia una variable a través del tiempo y visualizar la magnitud de esos cambios.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoRadar(videoJuegos: games),
      titulo: null,
      categoria: "Comparacion",
      descripcion: "El gráfico radar sirve para comparar varias características de uno o más videojuegos y observar sus fortalezas y diferencias.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoDispersion(videoJuegos: games),
      titulo: null,
      categoria: "Relacion",
      descripcion: "El gráfico de dispersion sirve para analizar la relacion entre dos variables e identificar posibles patrones o agrupaciones en los datos.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoMedidorMultiAnillo(videoJuegos: games),
      titulo: null,
      categoria: "Rendimiento",
      descripcion: "El gráfico de múltiples anillos sirve para comparar simultáneamente el nivel alcanzado por varias métricas.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoVelas(videoJuegos: games),
      titulo: null,
      categoria: "Variabilidad",
      descripcion: "El gráfico de velas sirve para representar valores máximos, mínimos, iniciales y finales dentro de diferentes periodos.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBarraPositivasNegativas(videoJuegos: games),
      titulo: null,
      categoria: "Comparacion",
      descripcion: "El gráfico de barras positivas y negativas sirve para comparar valores que se encuentran por encima o por debajo de un punto de referencia.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoAreaEntreLineas(videoJuegos: games),
      titulo: null,
      categoria: "Relacion",
      descripcion: "El gráfico de área entre líneas sirve para comparar dos series y visualizar las diferencias entre sus valores a través del tiempo.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoLineaError(videoJuegos: games),
      titulo: null,
      categoria: "Variabilidad",
      descripcion: "El gráfico de línea con error sirve para representar valores junto con su margen de error o variacion estimada.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoLineasEscalonadas(videoJuegos: games),
      titulo: null,
      categoria: "Tendencia",
      descripcion: "El gráfico de líneas escalonadas sirve para representar cambios que ocurren por intervalos o pasos definidos.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoLineasMultiples(videoJuegos: games),
      titulo: null,
      categoria: "Tendencia",
      descripcion: "El gráfico de líneas múltiples sirve para comparar la evolucion de varias variables a través del tiempo.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoBurbujas(videoJuegos: games),
      titulo: null,
      categoria: "Relacion",
      descripcion: "El gráfico de burbujas sirve para analizar la relacion entre variables utilizando el tamaño de las burbujas para representar una variable adicional.",
      tituloVisible: false,
    ),

    GraficoItem(
      grafico: GraficoCascada(videoJuegos: games),
      titulo: null,
      categoria: "Composicion",
      descripcion: "El gráfico de cascada sirve para mostrar como diferentes valores positivos y negativos contribuyen al cambio de un valor inicial hasta un valor final.",
      tituloVisible: false,
    ),
  ];
}
