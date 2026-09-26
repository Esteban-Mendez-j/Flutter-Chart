import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class G17LineaSuaveArea extends StatelessWidget {
  const G17LineaSuaveArea({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'t': '0s', 'v': 10},
      {'t': '2s', 'v': 45},
      {'t': '4s', 'v': 20},
      {'t': '6s', 'v': 60},
      {'t': '8s', 'v': 35},
    ];

    return Chart(
      data: data,
      variables: {
        't': Variable(accessor: (Map map) => map['t'] as String),
        'v': Variable(accessor: (Map map) => map['v'] as num),
      },
      marks: [
        AreaMark(
          shape: ShapeEncode(value: BasicAreaShape(smooth: true)),
          color: ColorEncode(value: Colors.cyan.withValues(alpha: 0.4)),
        ),
        LineMark(
          shape: ShapeEncode(value: BasicLineShape(smooth: true)),
          size: SizeEncode(value: 3),
          color: ColorEncode(value: Colors.amberAccent),
        ),
      ],
      axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
    );
  }
}