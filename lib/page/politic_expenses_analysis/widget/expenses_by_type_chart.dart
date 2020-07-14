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
    return PieChart(
      labels: labels,
      values: values,
      animationDuration: const Duration(milliseconds: 500),
      sliceFillColors: [
        const Color(0xFF63B95C),
        const Color(0xFF5D66B7),
        const Color(0xFFCA56A6),
        const Color(0xFFFFD850),
        const Color(0xFFFF8F50),
        const Color(0xFFFF5050),
      ],
      legendTextSize: 12,
    );
  }
}
