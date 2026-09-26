import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class G11LineaEscalonada extends StatelessWidget {
  const G11LineaEscalonada({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'fase': 'P1', 'nivel': 10},
      {'fase': 'P2', 'nivel': 20},
      {'fase': 'P3', 'nivel': 20},
      {'fase': 'P4', 'nivel': 40},
    ];

    return Chart(
      data: data,
      variables: {
        'fase': Variable(accessor: (Map map) => map['fase'] as String),
        'nivel': Variable(accessor: (Map map) => map['nivel'] as num),
      },
      marks: [
        LineMark(
          shape: ShapeEncode(value: BasicLineShape(smooth: false)),
          size: SizeEncode(value: 3),
        ),
      ],
      axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
    );
  }
}