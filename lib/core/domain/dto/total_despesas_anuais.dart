import 'package:equatable/equatable.dart';

import 'despesa_mensal.dart';

class TotalDespesasAnuais extends Equatable {
  TotalDespesasAnuais({this.ano, this.despesasPorMes});

  final String ano;
  final List<DespesaMensal> despesasPorMes;

  @override
  List<Object> get props => [ano, despesasPorMes];

  @override
  String toString() {
    return 'TotalDespesasAnuais{ano: $ano, despesasPorMes: $despesasPorMes}';
  }
}
