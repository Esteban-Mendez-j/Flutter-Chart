import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class G4PuntosScatter extends StatelessWidget {
  const G4PuntosScatter({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'x': 10, 'y': 20},
      {'x': 15, 'y': 35},
      {'x': 25, 'y': 10},
      {'x': 30, 'y': 45},
      {'x': 40, 'y': 30},
    ];

    return Chart(
      data: data,
      variables: {
        'x': Variable(accessor: (Map map) => map['x'] as num),
        'y': Variable(accessor: (Map map) => map['y'] as num),
      },
      marks: [
        PointMark(
          size: SizeEncode(value: 8),
          color: ColorEncode(value: Colors.deepPurple),
        ),
      ],
      axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
    );
  }
}