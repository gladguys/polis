import 'package:flutter/material.dart';
import 'package:multi_charts/multi_charts.dart';

import '../../../core/domain/dto/despesa_anual_por_tipo.dart';

class ExpensesByTypeChart extends StatelessWidget {
  ExpensesByTypeChart({this.despesasAnuaisPorTipo});

  final DespesaAnualPorTipo despesasAnuaisPorTipo;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      labels: [
        ...despesasAnuaisPorTipo.tipos,
      ],
      values: [
        ...despesasAnuaisPorTipo.valores,
      ],
      animationDuration: const Duration(milliseconds: 500),
      sliceFillColors: [
        const Color(0xFF4FC2D7),
        const Color(0xFF48C7B2),
        const Color(0xFF72C588),
        const Color(0xFFA0BE68),
      ],
      legendTextSize: 12,
    );
  }
}
