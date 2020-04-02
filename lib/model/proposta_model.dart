import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'proposta_model.g.dart';

@JsonSerializable()
class PropostaModel extends Equatable {
  PropostaModel(
      {this.id,
      this.siglaTipo,
      this.descricaoTipo,
      this.numero,
      this.ano,
      this.ementa,
      this.dataApresentacao,
      this.dataDocumento,
      this.tipoDocumento,
      this.status});

  final String id;
  final String siglaTipo;
  final String descricaoTipo;
  final String numero;
  final String ano;
  final String ementa;
  final String dataDocumento;
  final String tipoDocumento;
  final String dataApresentacao;
  final String status;

  factory PropostaModel.fromJson(Map<String, dynamic> json) =>
      _$PropostaModelFromJson(json);

  Map<String, dynamic> toJson() => _$PropostaModelToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() {
    return '''PropostaModel{id: $id, siglaTipo: $siglaTipo, descricaoTipo: $descricaoTipo, numero: $numero, ano: $ano, ementa: $ementa, dataApresentacao: $dataApresentacao, status: $status}''';
  }
}
