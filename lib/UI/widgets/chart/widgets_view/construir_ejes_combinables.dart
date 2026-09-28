import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

FlTitlesData construirEjesCombinables({
  required String nombreEjeX,
  required String nombreEjeY,
  required List<String> etiquetasX,
  bool mostrarTextos = true,
  double espacioIzquierdo = 36,
  double espacioInferior = 26,
  double espacioNombreEje = 20,
}) {
  Widget nombreEje(String texto) => mostrarTextos
      ? Text(
          texto,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
        )
      : const SizedBox.shrink();

  return FlTitlesData(
    show: true,
    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    bottomTitles: AxisTitles(
      axisNameWidget: nombreEje(nombreEjeX),
      axisNameSize: espacioNombreEje,
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: espacioInferior,
        getTitlesWidget: (valor, meta) {
          if (!mostrarTextos) return const SizedBox.shrink();
          final indice = valor.toInt();
          if (indice < 0 || indice >= etiquetasX.length) {
            return const SizedBox.shrink();
          }
          final texto = etiquetasX[indice];
          return Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              texto.length > 7 ? '${texto.substring(0, 7)}…' : texto,
              style: const TextStyle(fontSize: 9),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
      ),
    ),
    leftTitles: AxisTitles(
      axisNameWidget: nombreEje(nombreEjeY),
      axisNameSize: espacioNombreEje,
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: espacioIzquierdo,
        getTitlesWidget: (valor, meta) {
          if (!mostrarTextos) return const SizedBox.shrink();
          return Text(
            valor.toInt().toString(),
            style: const TextStyle(fontSize: 9),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          );
        },
      ),
    ),
  );
}
