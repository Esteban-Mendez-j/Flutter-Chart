import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class G14RosaPolar extends StatelessWidget {
  const G14RosaPolar({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'dir': 'Norte', 'fuerza': 40},
      {'dir': 'Este', 'fuerza': 25},
      {'dir': 'Sur', 'fuerza': 60},
      {'dir': 'Oeste', 'fuerza': 30},
    ];

    return Chart(
      data: data,
      variables: {
        'dir': Variable(accessor: (Map map) => map['dir'] as String),
        'fuerza': Variable(accessor: (Map map) => map['fuerza'] as num),
      },
      coord: PolarCoord(),
      marks: [
        IntervalMark(
          color: ColorEncode(variable: 'dir', values: Defaults.colors10),
        ),
      ],
    );
  }
}