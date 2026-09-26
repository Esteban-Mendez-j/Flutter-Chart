import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class G20Piramide extends StatelessWidget {
  const G20Piramide({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'fase': 'Visitas', 'cant': 1000},
      {'fase': 'Registros', 'cant': 600},
      {'fase': 'Checkout', 'cant': 250},
      {'fase': 'Venta', 'cant': 100},
    ];

    return Chart(
      data: data,
      variables: {
        'fase': Variable(accessor: (Map map) => map['fase'] as String),
        'cant': Variable(accessor: (Map map) => map['cant'] as num),
      },
      coord: RectCoord(transposed: true),
      marks: [
        IntervalMark(
          color: ColorEncode(variable: 'fase', values: Defaults.colors10),
        ),
      ],
      axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
    );
  }
}