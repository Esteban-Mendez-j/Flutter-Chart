import 'package:flutter/material.dart';

class GraficoItem {
  final String? titulo;
  final String categoria;
  final String descripcion;
  final Widget grafico;
  final bool tituloVisible;

  const GraficoItem({
    this.titulo,
    required this.categoria,
    required this.descripcion,
    required this.grafico,
    this.tituloVisible = true,
  });
}
