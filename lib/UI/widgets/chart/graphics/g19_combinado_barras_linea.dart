import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class G19CombinadoBarrasLinea extends StatelessWidget {
  const G19CombinadoBarrasLinea({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'mes': 'Ene', 'real': 100, 'meta': 90},
      {'mes': 'Feb', 'real': 140, 'meta': 120},
      {'mes': 'Mar', 'real': 110, 'meta': 130},
      {'mes': 'Abr', 'real': 170, 'meta': 150},
    ];

    return Chart(
      data: data,
      variables: {
        'mes': Variable(accessor: (Map map) => map['mes'] as String),
        'real': Variable(accessor: (Map map) => map['real'] as num),
        'meta': Variable(accessor: (Map map) => map['meta'] as num),
      },
      marks: [
        IntervalMark(
          position: Varset('mes') * Varset('real'),
          color: ColorEncode(value: Colors.lightBlue),
        ),
        LineMark(
          position: Varset('mes') * Varset('meta'),
          color: ColorEncode(value: Colors.red),
          size: SizeEncode(value: 3),
        ),
      ],
      axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
    );
  }
}