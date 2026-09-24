import 'package:graficos/data/model/ventas_ohlc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'historial_mensual.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class HistorialMensual {
  final String periodo;
  final int ventas;
  final int jugadoresActivos;
  final int horasJugadas;
  final int valoracionesPositivas;
  final int valoracionesNegativas;
  final double ingresos;
  final VentasOhlc ventasOhlc;

  HistorialMensual({
    required this.periodo,
    required this.ventas,
    required this.jugadoresActivos,
    required this.horasJugadas,
    required this.valoracionesPositivas,
    required this.valoracionesNegativas,
    required this.ingresos,
    required this.ventasOhlc,
  });

  factory HistorialMensual.fromJson(Map<String, dynamic> json) =>
      _$HistorialMensualFromJson(json);

  Map<String, dynamic> toJson() => _$HistorialMensualToJson(this);
}
