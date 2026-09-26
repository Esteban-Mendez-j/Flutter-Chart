import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class G12AreaApilada extends StatelessWidget {
  const G12AreaApilada({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'anio': '2021', 'cat': 'A', 'val': 20},
      {'anio': '2021', 'cat': 'B', 'val': 30},
      {'anio': '2022', 'cat': 'A', 'val': 40},
      {'anio': '2022', 'cat': 'B', 'val': 50},
    ];

    return Chart(
      data: data,
      variables: {
        'anio': Variable(accessor: (Map map) => map['anio'] as String),
        'cat': Variable(accessor: (Map map) => map['cat'] as String),
        'val': Variable(accessor: (Map map) => map['val'] as num),
      },
      marks: [
        AreaMark(
          position: Varset('anio') * Varset('val') / Varset('cat'),
          color: ColorEncode(variable: 'cat', values: [Colors.amber, Colors.deepOrange]),
          modifiers: [StackModifier()],
        ),
      ],
      axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
    );
  }
}