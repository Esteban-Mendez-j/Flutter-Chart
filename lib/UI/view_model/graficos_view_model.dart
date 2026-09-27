import 'package:flutter/material.dart';
import 'package:graficos/data/model/grafico_item.dart';
import 'package:graficos/data/model/historial_mensual.dart';
import 'package:graficos/data/model/videojuego.dart';
import 'package:graficos/data/service/videojuego_service.dart';

class GraficosViewModel extends ChangeNotifier {
  final VideojuegoService videojuegoService = VideojuegoService();
  List<VideoJuego> _videoJuegos = [];
  String _mensajeError = "";
  bool _cargando = false;
  String _textoBusqueda = "";

  Future<void> getVideoJuegos() async {
    _cargando = true;
    _mensajeError = "";

    notifyListeners();

    try {
      _videoJuegos = await videojuegoService.getVideojuegos();
    } catch (e) {
      _mensajeError = "Error al cargar la lista de videojuegos";
    } finally {
      _cargando = false;
      notifyListeners();
    }
  }

  String get textoBusqueda => _textoBusqueda;

  void buscar(String texto) {
    _textoBusqueda = texto;

    notifyListeners();
  }

  List<GraficoItem> filtrarGraficos(List<GraficoItem> graficos) {
    final busqueda = _textoBusqueda.toLowerCase().trim();

    if (busqueda.isEmpty) {
      return graficos;
    }

    return graficos.where((grafico) {
      final titulo = grafico.titulo?.toLowerCase() ?? "";
      final categoria = grafico.categoria.toLowerCase();

      return titulo.contains(busqueda) || categoria.contains(busqueda);
    }).toList();
  }

  List<VideoJuego> get top5PorPuntaje {
    final lista = [..._videoJuegos];

    lista.sort((a, b) => b.puntaje.compareTo(a.puntaje));

    return lista.take(5).toList();
  }

  List<String> categorias(List<VideoJuego> videojuegos) {
    return videojuegos
        .map((videoJuego) => videoJuego.categoria)
        .toSet()
        .toList();
  }

  double obtenerMaximo(
    List<VideoJuego> videojuegos,
    double Function(HistorialMensual) obtenerValor,
  ) {
    double maximo = 0;

    for (final juego in videojuegos.take(5)) {
      for (final mes in juego.historialMensual) {
        final valor = obtenerValor(mes);

        if (valor > maximo) {
          maximo = valor;
        }
      }
    }

    return maximo;
  }

  List<VideoJuego> get videoJuegos => _videoJuegos;

  String get mensajeError => _mensajeError;

  bool get cargando => _cargando;

  set setCargando(bool cargando) {
    _cargando = cargando;
  }

  set setMensajeError(String mensaje) {
    _mensajeError = mensaje;
  }
}
