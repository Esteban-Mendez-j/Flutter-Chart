import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class G7DonaDonut extends StatelessWidget {
  const G7DonaDonut({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'item': 'A', 'valor': 30},
      {'item': 'B', 'valor': 50},
      {'item': 'C', 'valor': 20},
    ];

    return Chart(
      data: data,
      variables: {
        'item': Variable(accessor: (Map map) => map['item'] as String),
        'valor': Variable(accessor: (Map map) => map['valor'] as num),
      },
      transforms: [Proportion(variable: 'valor', as: 'percent')],
      marks: [
        IntervalMark(
          position: Varset('percent') / Varset('item'),
          color: ColorEncode(variable: 'item', values: Defaults.colors10),
          modifiers: [StackModifier()],
        ),
      ],
      coord: PolarCoord(transposed: true, dimCount: 1, endRadius: 0.5),
    );
  }
}