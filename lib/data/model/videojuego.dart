import 'package:graficos/data/model/historial_mensual.dart';
import 'package:json_annotation/json_annotation.dart';

part 'videojuego.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class VideoJuego {
  int id;
  String nombre;
  String categoria;
  String subcategoria;
  String compania;
  List<String> plataformas;
  String clasificacion;
  List<String> modoJuego;
  double precio;
  int numeroVentas;
  double ingresosEstimados;
  double costoDesarrollo;
  String modeloNegocio;
  @JsonKey(name: "año_lanzamiento")
  int yearLanzamiento;
  int mesLanzamiento;
  int jugadoresActivos;
  int horasJugadasMensuales;
  double duracionPromedioHoras;
  int actualizacionesAnuales;
  double puntaje;
  int valoracionesPositivas;
  int valoracionesNegativas;
  String dificultad;
  String tipoCamara;
  bool esMundoAbierto;
  List<HistorialMensual> historialMensual;

  VideoJuego({
    required this.id,
    required this.nombre,
    required this.categoria,
    required this.subcategoria,
    required this.compania,
    required this.plataformas,
    required this.clasificacion,
    required this.modoJuego,
    required this.precio,
    required this.numeroVentas,
    required this.ingresosEstimados,
    required this.costoDesarrollo,
    required this.modeloNegocio,
    required this.yearLanzamiento,
    required this.mesLanzamiento,
    required this.jugadoresActivos,
    required this.horasJugadasMensuales,
    required this.duracionPromedioHoras,
    required this.actualizacionesAnuales,
    required this.puntaje,
    required this.valoracionesPositivas,
    required this.valoracionesNegativas,
    required this.dificultad,
    required this.tipoCamara,
    required this.esMundoAbierto,
    required this.historialMensual,
  });

  factory VideoJuego.fromJson(Map<String, dynamic> json) =>
      _$VideoJuegoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoJuegoToJson(this);

  String get nombreCorto {
    if (nombre.length <= 10) {
      return nombre;
    }

    return '${nombre.substring(0, 10)}...';
  }
}
