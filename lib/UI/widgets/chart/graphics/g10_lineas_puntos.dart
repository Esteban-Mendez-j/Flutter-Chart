import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class G10LineasPuntos extends StatelessWidget {
  const G10LineasPuntos({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'x': 'Sem 1', 'y': 100},
      {'x': 'Sem 2', 'y': 130},
      {'x': 'Sem 3', 'y': 110},
      {'x': 'Sem 4', 'y': 170},
    ];

    return Chart(
      data: data,
      variables: {
        'x': Variable(accessor: (Map map) => map['x'] as String),
        'y': Variable(accessor: (Map map) => map['y'] as num),
      },
      marks: [
        LineMark(color: ColorEncode(value: Colors.redAccent)),
        PointMark(size: SizeEncode(value: 7), color: ColorEncode(value: Colors.redAccent)),
      ],
      axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
    );
  }
}