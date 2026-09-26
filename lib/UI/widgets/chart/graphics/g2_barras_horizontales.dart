import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class G2BarrasHorizontales extends StatelessWidget {
  const G2BarrasHorizontales({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'lenguaje': 'Dart', 'uso': 85},
      {'lenguaje': 'Java', 'uso': 70},
      {'lenguaje': 'Python', 'uso': 90},
      {'lenguaje': 'C++', 'uso': 60},
    ];

    return Chart(
      data: data,
      variables: {
        'lenguaje': Variable(accessor: (Map map) => map['lenguaje'] as String),
        'uso': Variable(accessor: (Map map) => map['uso'] as num),
      },
      coord: RectCoord(transposed: true),
      marks: [IntervalMark()],
      axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
    );
  }
}