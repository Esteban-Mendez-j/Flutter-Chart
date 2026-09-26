import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class G5AreaSimple extends StatelessWidget {
  const G5AreaSimple({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'hora': '08:00', 'usuarios': 50},
      {'hora': '12:00', 'usuarios': 180},
      {'hora': '16:00', 'usuarios': 120},
      {'hora': '20:00', 'usuarios': 250},
    ];

    return Chart(
      data: data,
      variables: {
        'hora': Variable(accessor: (Map map) => map['hora'] as String),
        'usuarios': Variable(accessor: (Map map) => map['usuarios'] as num),
      },
      marks: [AreaMark()],
      axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
    );
  }
}