import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class G3LineaSimple extends StatelessWidget {
  const G3LineaSimple({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'dia': '1', 'temp': 22},
      {'dia': '2', 'temp': 25},
      {'dia': '3', 'temp': 19},
      {'dia': '4', 'temp': 28},
      {'dia': '5', 'temp': 24},
    ];

    return Chart(
      data: data,
      variables: {
        'dia': Variable(accessor: (Map map) => map['dia'] as String),
        'temp': Variable(accessor: (Map map) => map['temp'] as num),
      },
      marks: [LineMark()],
      axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
    );
  }
}