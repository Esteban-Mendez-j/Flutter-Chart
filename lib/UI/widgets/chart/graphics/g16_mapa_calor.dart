import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class G16MapaCalor extends StatelessWidget {
  const G16MapaCalor({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'dia': 'Lun', 'turno': 'Mañana', 'densidad': 15},
      {'dia': 'Lun', 'turno': 'Tarde', 'densidad': 85},
      {'dia': 'Mar', 'turno': 'Mañana', 'densidad': 40},
      {'dia': 'Mar', 'turno': 'Tarde', 'densidad': 60},
    ];

    return Chart(
      data: data,
      variables: {
        'dia': Variable(accessor: (Map map) => map['dia'] as String),
        'turno': Variable(accessor: (Map map) => map['turno'] as String),
        'densidad': Variable(accessor: (Map map) => map['densidad'] as num),
      },
      marks: [
        PolygonMark(
          color: ColorEncode(variable: 'densidad', values: [Colors.orange.shade100, Colors.deepOrange.shade900]),
        ),
      ],
      axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
    );
  }
}