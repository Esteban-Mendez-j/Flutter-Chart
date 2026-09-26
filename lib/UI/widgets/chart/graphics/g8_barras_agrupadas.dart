import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class G8BarrasAgrupadas extends StatelessWidget {
  const G8BarrasAgrupadas({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'trimestre': 'Q1', 'equipo': 'A', 'v': 10},
      {'trimestre': 'Q1', 'equipo': 'B', 'v': 15},
      {'trimestre': 'Q2', 'equipo': 'A', 'v': 20},
      {'trimestre': 'Q2', 'equipo': 'B', 'v': 25},
    ];

    return Chart(
      data: data,
      variables: {
        'trimestre': Variable(accessor: (Map map) => map['trimestre'] as String),
        'equipo': Variable(accessor: (Map map) => map['equipo'] as String),
        'v': Variable(accessor: (Map map) => map['v'] as num),
      },
      marks: [
        IntervalMark(
          position: Varset('trimestre') * Varset('v') / Varset('equipo'),
          color: ColorEncode(variable: 'equipo', values: [Colors.blue, Colors.orange]),
          modifiers: [DodgeModifier()],
        ),
      ],
      axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
    );
  }
}