import 'package:flutter/material.dart';
import 'package:graficos/UI/view/detalle_grafico_view.dart';
import 'package:graficos/data/model/grafico_item.dart';

class TarjetaGrafico extends StatelessWidget {
  final GraficoItem grafico;

  const TarjetaGrafico({super.key, required this.grafico});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalleGraficoView(grafico: grafico),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (grafico.tituloVisible) ...[
              Center(
                child: Text(
                  grafico.titulo ?? "Sin título",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 4),
            ],

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xFF201D35),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFF332E52)),
              ),
              child: Text(
                grafico.categoria,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: 6),

            Expanded(child: Center(child: grafico.grafico)),
          ],
        ),
      ),
    );
  }
}
