import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class G6CircularPie extends StatelessWidget {
  const G6CircularPie({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'categoria': 'Móvil', 'valor': 40},
      {'categoria': 'Web', 'valor': 35},
      {'categoria': 'Desktop', 'valor': 25},
    ];

    return Chart(
      data: data,
      variables: {
        'categoria': Variable(accessor: (Map map) => map['categoria'] as String),
        'valor': Variable(accessor: (Map map) => map['valor'] as num),
      },
      transforms: [Proportion(variable: 'valor', as: 'percent')],
      marks: [
        IntervalMark(
          position: Varset('percent') / Varset('categoria'),
          color: ColorEncode(variable: 'categoria', values: Defaults.colors10),
          modifiers: [StackModifier()],
        ),
      ],
      coord: PolarCoord(transposed: true, dimCount: 1),
    );
  }
}