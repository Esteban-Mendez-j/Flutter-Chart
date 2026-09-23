// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videojuego.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoJuego _$VideoJuegoFromJson(Map<String, dynamic> json) => VideoJuego(
  id: (json['id'] as num).toInt(),
  nombre: json['nombre'] as String,
  categoria: json['categoria'] as String,
  subcategoria: json['subcategoria'] as String,
  compania: json['compania'] as String,
  plataformas: (json['plataformas'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  clasificacion: json['clasificacion'] as String,
  modoJuego: (json['modo_juego'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  precio: (json['precio'] as num).toDouble(),
  numeroVentas: (json['numero_ventas'] as num).toInt(),
  ingresosEstimados: (json['ingresos_estimados'] as num).toDouble(),
  costoDesarrollo: (json['costo_desarrollo'] as num).toDouble(),
  modeloNegocio: json['modelo_negocio'] as String,
  yearLanzamiento: (json['año_lanzamiento'] as num).toInt(),
  mesLanzamiento: (json['mes_lanzamiento'] as num).toInt(),
  jugadoresActivos: (json['jugadores_activos'] as num).toInt(),
  horasJugadasMensuales: (json['horas_jugadas_mensuales'] as num).toInt(),
  duracionPromedioHoras: (json['duracion_promedio_horas'] as num).toDouble(),
  actualizacionesAnuales: (json['actualizaciones_anuales'] as num).toInt(),
  puntaje: (json['puntaje'] as num).toDouble(),
  valoracionesPositivas: (json['valoraciones_positivas'] as num).toInt(),
  valoracionesNegativas: (json['valoraciones_negativas'] as num).toInt(),
  dificultad: json['dificultad'] as String,
  tipoCamara: json['tipo_camara'] as String,
  esMundoAbierto: json['es_mundo_abierto'] as bool,
  historialMensual: (json['historial_mensual'] as List<dynamic>)
      .map((e) => HistorialMensual.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$VideoJuegoToJson(VideoJuego instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'categoria': instance.categoria,
      'subcategoria': instance.subcategoria,
      'compania': instance.compania,
      'plataformas': instance.plataformas,
      'clasificacion': instance.clasificacion,
      'modo_juego': instance.modoJuego,
      'precio': instance.precio,
      'numero_ventas': instance.numeroVentas,
      'ingresos_estimados': instance.ingresosEstimados,
      'costo_desarrollo': instance.costoDesarrollo,
      'modelo_negocio': instance.modeloNegocio,
      'año_lanzamiento': instance.yearLanzamiento,
      'mes_lanzamiento': instance.mesLanzamiento,
      'jugadores_activos': instance.jugadoresActivos,
      'horas_jugadas_mensuales': instance.horasJugadasMensuales,
      'duracion_promedio_horas': instance.duracionPromedioHoras,
      'actualizaciones_anuales': instance.actualizacionesAnuales,
      'puntaje': instance.puntaje,
      'valoraciones_positivas': instance.valoracionesPositivas,
      'valoraciones_negativas': instance.valoracionesNegativas,
      'dificultad': instance.dificultad,
      'tipo_camara': instance.tipoCamara,
      'es_mundo_abierto': instance.esMundoAbierto,
      'historial_mensual': instance.historialMensual,
    };
