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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        PieChart(
          size: const Size(250, 250),
          maxHeight: 250,
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _buildLegendTiles(labels),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  List<Column> _buildLegendTiles(List<String> labels) {
    final tiles = <Column>[];
    for (var i = 0; i < labels.length; i++) {
      tiles.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: _getColorByIndex(i),
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                const SizedBox(width: 4),
                Flexible(
                  child: Container(
                    width: 400,
                    constraints: const BoxConstraints(minHeight: 14),
                    clipBehavior: Clip.none,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      labels[i],
                      style: const TextStyle(fontSize: 12, height: 1),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
          ],
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
