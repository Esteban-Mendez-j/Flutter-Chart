import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class G13Radar extends StatelessWidget {
  const G13Radar({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'attr': 'Ataque', 'val': 80},
      {'attr': 'Defensa', 'val': 70},
      {'attr': 'Velocidad', 'val': 90},
      {'attr': 'Magia', 'val': 65},
      {'attr': 'Alcance', 'val': 85},
    ];

    return Chart(
      data: data,
      variables: {
        'attr': Variable(accessor: (Map map) => map['attr'] as String),
        'val': Variable(accessor: (Map map) => map['val'] as num),
      },
      coord: PolarCoord(),
      marks: [
        LineMark(color: ColorEncode(value: Colors.purple)),
        PointMark(color: ColorEncode(value: Colors.purple), size: SizeEncode(value: 6)),
      ],
      axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
    );
  }
}