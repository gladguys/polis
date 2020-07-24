import 'package:flutter/material.dart';
import 'package:multi_charts/multi_charts.dart';

import '../../../core/domain/dto/despesa_por_tipo.dart';
import '../../../core/extension/extensions.dart';

class ExpensesByTypeChart extends StatelessWidget {
  ExpensesByTypeChart({this.despesasPorTipo});

  final List<DespesaPorTipo> despesasPorTipo;

  @override
  Widget build(BuildContext context) {
    final labels = [
      ...despesasPorTipo.map((despesa) => despesa.tipoCota).toList(),
    ];
    final values = [
      ...despesasPorTipo
          .map((despesa) => despesa.percentual.sanitizePercentageToDouble())
          .toList(),
    ];
    return Column(
      children: <Widget>[
        PieChart(
          size: const Size(150, 150),
          labels: labels,
          values: values,
          animationDuration: const Duration(milliseconds: 500),
          showLegend: false,
          sliceFillColors: [
            const Color(0xFF63B95C),
            const Color(0xFF5D66B7),
            const Color(0xFFCA56A6),
            const Color(0xFFFFD850),
            const Color(0xFFFF8F50),
            const Color(0xFFFF5050),
          ],
        ),
        ListView(
          shrinkWrap: true,
          children: _buildLegendTiles(labels),
        ),
      ],
    );
  }

  List<ListTile> _buildLegendTiles(List<String> labels) {
    final tiles = <ListTile>[];
    for (var i = 0; i < labels.length; i++) {
      tiles.add(
        ListTile(
          dense: true,
          leading: CircleAvatar(
            backgroundColor: _getColorByIndex(i),
          ),
          title: Text(labels[i]),
        ),
      );
    }
    return tiles;
  }

  Color _getColorByIndex(int index) {
    switch (index) {
      case 0:
        return const Color(0xFF63B95C);
      case 1:
        return const Color(0xFF5D66B7);
      case 2:
        return const Color(0xFFCA56A6);
      case 3:
        return const Color(0xFFFFD850);
      case 4:
        return const Color(0xFFFF8F50);
      case 5:
        return const Color(0xFFFF5050);
      default:
        return const Color(0xFF63B95C);
    }
  }
}
