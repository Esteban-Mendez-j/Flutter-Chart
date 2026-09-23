// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historial_mensual.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistorialMensual _$HistorialMensualFromJson(Map<String, dynamic> json) =>
    HistorialMensual(
      periodo: json['periodo'] as String,
      ventas: (json['ventas'] as num).toInt(),
      jugadoresActivos: (json['jugadores_activos'] as num).toInt(),
      horasJugadas: (json['horas_jugadas'] as num).toInt(),
      valoracionesPositivas: (json['valoraciones_positivas'] as num).toInt(),
      valoracionesNegativas: (json['valoraciones_negativas'] as num).toInt(),
      ingresos: (json['ingresos'] as num).toDouble(),
    );

Map<String, dynamic> _$HistorialMensualToJson(HistorialMensual instance) =>
    <String, dynamic>{
      'periodo': instance.periodo,
      'ventas': instance.ventas,
      'jugadores_activos': instance.jugadoresActivos,
      'horas_jugadas': instance.horasJugadas,
      'valoraciones_positivas': instance.valoracionesPositivas,
      'valoraciones_negativas': instance.valoracionesNegativas,
      'ingresos': instance.ingresos,
    };
