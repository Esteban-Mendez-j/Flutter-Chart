import 'package:flutter/material.dart';

class BuscadorGraficos extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const BuscadorGraficos({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "Buscar gráfico por título o categoría...",
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
