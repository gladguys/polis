import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'despesa_model.g.dart';

@JsonSerializable()
class DespesaModel extends Equatable {
  DespesaModel(
      {this.id,
      this.tipoDespesa,
      this.tipoDocumento,
      this.dataDocumento,
      this.valorDocumento,
      this.nomeFornecedor,
      this.cnpjCpfFornecedor});

  final String id;
  final String tipoDespesa;
  final String tipoDocumento;
  final DateTime dataDocumento;
  final double valorDocumento;
  final String nomeFornecedor;
  final String cnpjCpfFornecedor;

  factory DespesaModel.fromJson(Map<String, dynamic> json) =>
      _$DespesaModelFromJson(json);

  Map<String, dynamic> toJson() => _$DespesaModelToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() {
    return '''DespesaModel{id: $id, tipoDespesa: $tipoDespesa, tipoDocumento: $tipoDocumento, dataDocumento: $dataDocumento, valorDocumento: $valorDocumento, nomeFornecedor: $nomeFornecedor, cnpjCpfFornecedor: $cnpjCpfFornecedor}''';
  }
}
