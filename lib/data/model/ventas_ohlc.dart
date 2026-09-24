import 'package:json_annotation/json_annotation.dart';

part 'ventas_ohlc.g.dart';

@JsonSerializable()
class VentasOhlc {
  final double open;
  final double high;
  final double low;
  final double close;

  VentasOhlc({
    required this.open,
    required this.high,
    required this.low,
    required this.close,
  });

  factory VentasOhlc.fromJson(Map<String, dynamic> json) =>
      _$VentasOhlcFromJson(json);

  Map<String, dynamic> toJson() => _$VentasOhlcToJson(this);
}
