import 'package:equatable/equatable.dart';

class DespesaPorTipo extends Equatable {
  DespesaPorTipo({this.tipo, this.valor, this.percentual});

  final String tipo;
  final String valor;
  final String percentual;

  @override
  List<Object> get props => [tipo, valor, percentual];

  @override
  String toString() {
    return '''DespesaPorTipo{tipo: $tipo, valor: $valor, percentual: $percentual}''';
  }
}
