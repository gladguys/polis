import 'package:flutter/material.dart';

class PoliticActivities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Atividades',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const Center(
          child: Text('Nenhuma atividade para o político!'),
        )
      ],
    );
  }
}
