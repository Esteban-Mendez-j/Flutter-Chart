import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class G18InteractivoTooltip extends StatelessWidget {
  const G18InteractivoTooltip({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'p': 'Pt 1', 'val': 50},
      {'p': 'Pt 2', 'val': 90},
      {'p': 'Pt 3', 'val': 70},
      {'p': 'Pt 4', 'val': 110},
    ];

    return Chart(
      data: data,
      variables: {
        'p': Variable(accessor: (Map map) => map['p'] as String),
        'val': Variable(accessor: (Map map) => map['val'] as num),
      },
      marks: [
        LineMark(color: ColorEncode(value: Colors.green)),
        PointMark(size: SizeEncode(value: 8), color: ColorEncode(value: Colors.greenAccent)),
      ],
      selections: {
        'touch': PointSelection(on: {GestureType.tap, GestureType.longPress}),
      },
      tooltip: TooltipGuide(
        followPointer: [true, true],
        align: Alignment.topLeft,
      ),
      axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
    );
  }
}