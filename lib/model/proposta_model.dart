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
      this.fotoPolitico,
      this.nomePolitico,
      this.siglaPartido,
      this.descricaoSituacao,
      this.descricaoTramitacao,
      this.dataApresentacao,
      this.favorito,
      this.dataDocumento,
      this.tipoDocumento,
      this.status});

  final String id;
  final String siglaTipo;
  final String descricaoTipo;
  final String numero;
  final String ano;
  final String ementa;
  final String nomePolitico;
  final String fotoPolitico;
  final String siglaPartido;
  final String dataDocumento;
  final String tipoDocumento;
  final String descricaoSituacao;
  final String descricaoTramitacao;
  final String dataApresentacao;
  final String status;
  final bool favorito;

  factory PropostaModel.fromJson(Map<String, dynamic> json) =>
      _$PropostaModelFromJson(json);

  Map<String, dynamic> toJson() => _$PropostaModelToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() {
    return '''PropostaModel{id: $id, siglaTipo: $siglaTipo, descricaoTipo: $descricaoTipo, numero: $numero, ano: $ano, ementa: $ementa, nomePolitico: $nomePolitico, fotoPolitico: $fotoPolitico, siglaPartido: $siglaPartido, dataDocumento: $dataDocumento, tipoDocumento: $tipoDocumento, descricaoSituacao: $descricaoSituacao, descricaoTramitacao: $descricaoTramitacao, dataApresentacao: $dataApresentacao, status: $status, favorito: $favorito}''';
  }
}
