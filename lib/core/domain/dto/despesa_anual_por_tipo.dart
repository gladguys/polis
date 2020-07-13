import 'package:equatable/equatable.dart';

import '../../extension/extensions.dart';
import 'despesa_por_tipo.dart';

class DespesaAnualPorTipo extends Equatable {
  DespesaAnualPorTipo({this.ano, this.despesas});

  final String ano;
  final List<DespesaPorTipo> despesas;

  List<String> get tipos => despesas.map((despesa) => despesa.tipo).toList();

  List<double> get valores => despesas
      .map((despesa) => despesa.percentual.sanitizePercentageToDouble())
      .toList();

  @override
  List<Object> get props => [ano, despesas];

  @override
  String toString() {
    return 'DespesaAnualPorTipo{ano: $ano, despesas: $despesas}';
  }
}
