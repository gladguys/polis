import 'package:equatable/equatable.dart';

class DespesaMensal extends Equatable {
  DespesaMensal({this.mes, this.valor});

  final String mes;
  final double valor;

  String get nomeMes {
    switch (mes) {
      case '01':
        return 'Janeiro';
      case '02':
        return 'Fevereiro';
      case '03':
        return 'Março';
      case '04':
        return 'Abril';
      case '05':
        return 'Maio';
      case '06':
        return 'Junho';
      case '07':
        return 'Julho';
      case '08':
        return 'Agosto';
      case '09':
        return 'Setembro';
      case '10':
        return 'Outubro';
      case '11':
        return 'Novembro';
      case '12':
        return 'Dezembro';
    }
    return null;
  }

  @override
  List<Object> get props => [mes, valor];

  @override
  String toString() {
    return 'DespesaMensal{mes: $mes, valor: $valor}';
  }
}
