import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'despesa_por_tipo.g.dart';

@JsonSerializable()
class DespesaPorTipo extends Equatable {
  DespesaPorTipo({this.tipoCota, this.valor, this.percentual});

  final String tipoCota;
  final String valor;
  final String percentual;

  factory DespesaPorTipo.fromJson(Map<String, dynamic> json) =>
      _$DespesaPorTipoFromJson(json);

  Map<String, dynamic> toJson() => _$DespesaPorTipoToJson(this);

  @override
  List<Object> get props => [tipoCota, valor, percentual];

  @override
  String toString() {
    return '''DespesaPorTipo{tipoCota: $tipoCota, valor: $valor, percentual: $percentual}''';
  }
}
