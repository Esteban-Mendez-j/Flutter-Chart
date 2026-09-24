// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ventas_ohlc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VentasOhlc _$VentasOhlcFromJson(Map<String, dynamic> json) => VentasOhlc(
  open: (json['open'] as num).toDouble(),
  high: (json['high'] as num).toDouble(),
  low: (json['low'] as num).toDouble(),
  close: (json['close'] as num).toDouble(),
);

Map<String, dynamic> _$VentasOhlcToJson(VentasOhlc instance) =>
    <String, dynamic>{
      'open': instance.open,
      'high': instance.high,
      'low': instance.low,
      'close': instance.close,
    };
