import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class G9BarrasApiladas extends StatelessWidget {
  const G9BarrasApiladas({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'mes': 'Ene', 'tipo': 'Front', 'v': 30},
      {'mes': 'Ene', 'tipo': 'Back', 'v': 50},
      {'mes': 'Feb', 'tipo': 'Front', 'v': 40},
      {'mes': 'Feb', 'tipo': 'Back', 'v': 60},
    ];

    return Chart(
      data: data,
      variables: {
        'mes': Variable(accessor: (Map map) => map['mes'] as String),
        'tipo': Variable(accessor: (Map map) => map['tipo'] as String),
        'v': Variable(accessor: (Map map) => map['v'] as num),
      },
      marks: [
        IntervalMark(
          position: Varset('mes') * Varset('v') / Varset('tipo'),
          color: ColorEncode(variable: 'tipo', values: [Colors.teal, Colors.indigo]),
          modifiers: [StackModifier()],
        ),
      ],
      axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
    );
  }
}