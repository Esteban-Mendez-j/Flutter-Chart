import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class G1BarrasVerticales extends StatelessWidget {
  const G1BarrasVerticales({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'mes': 'Ene', 'ventas': 120},
      {'mes': 'Feb', 'ventas': 200},
      {'mes': 'Mar', 'ventas': 150},
      {'mes': 'Abr', 'ventas': 300},
    ];

    return Chart(
      data: data,
      variables: {
        'mes': Variable(accessor: (Map map) => map['mes'] as String),
        'ventas': Variable(accessor: (Map map) => map['ventas'] as num),
      },
      marks: [IntervalMark()],
      axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
    );
  }
}