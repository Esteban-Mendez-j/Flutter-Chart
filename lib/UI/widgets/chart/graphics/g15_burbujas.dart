import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class G15Burbujas extends StatelessWidget {
  const G15Burbujas({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'x': 10, 'y': 20, 'radio': 10},
      {'x': 25, 'y': 45, 'radio': 25},
      {'x': 35, 'y': 15, 'radio': 18},
      {'x': 50, 'y': 35, 'radio': 30},
    ];

    return Chart(
      data: data,
      variables: {
        'x': Variable(accessor: (Map map) => map['x'] as num),
        'y': Variable(accessor: (Map map) => map['y'] as num),
        'radio': Variable(accessor: (Map map) => map['radio'] as num),
      },
      marks: [
        PointMark(
          size: SizeEncode(variable: 'radio', values: [8, 24]),
          color: ColorEncode(variable: 'radio', values: [const Color.fromARGB(255, 11, 77, 107), 
          const Color.fromARGB(255, 110, 89, 232)]),
        ),
      ],
      axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
    );
  }
}