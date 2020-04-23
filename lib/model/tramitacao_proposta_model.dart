import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tramitacao_proposta_model.g.dart';

@JsonSerializable()
class TramitacaoPropostaModel extends Equatable {
  TramitacaoPropostaModel(
      {this.ambito,
      this.dataHora,
      this.descricaoSituacao,
      this.descricaoTramitacao,
      this.despacho,
      this.regime,
      this.sequencia,
      this.siglaOrgao});

  final String ambito;
  final String dataHora;
  final String descricaoSituacao;
  final String descricaoTramitacao;
  final String despacho;
  final String regime;
  final String sequencia;
  final String siglaOrgao;

  factory TramitacaoPropostaModel.fromJson(Map<String, dynamic> json) =>
      _$TramitacaoPropostaModelFromJson(json);

  Map<String, dynamic> toJson() => _$TramitacaoPropostaModelToJson(this);

  @override
  List<Object> get props => [sequencia];

  @override
  String toString() {
    return '''TramitacaoPropostaModel{ambito: $ambito, dataHora: $dataHora, descricaoSituacao: $descricaoSituacao, descricaoTramitacao: $descricaoTramitacao, despacho: $despacho, regime: $regime, sequencia: $sequencia, siglaOrgao: $siglaOrgao}''';
  }
}
