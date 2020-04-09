// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropostaModel _$PropostaModelFromJson(Map<String, dynamic> json) {
  return PropostaModel(
    id: json['id'] as String,
    siglaTipo: json['siglaTipo'] as String,
    descricaoTipo: json['descricaoTipo'] as String,
    numero: json['numero'] as String,
    ano: json['ano'] as String,
    ementa: json['ementa'] as String,
    fotoPolitico: json['fotoPolitico'] as String,
    nomePolitico: json['nomePolitico'] as String,
    idPoliticoAutor: json['idPoliticoAutor'] as String,
    siglaPartido: json['siglaPartido'] as String,
    descricaoSituacao: json['descricaoSituacao'] as String,
    descricaoTramitacao: json['descricaoTramitacao'] as String,
    dataApresentacao: json['dataApresentacao'] as String,
    favorito: json['favorito'] as bool,
    dataDocumento: json['dataDocumento'] as String,
    tipoDocumento: json['tipoDocumento'] as String,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$PropostaModelToJson(PropostaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'siglaTipo': instance.siglaTipo,
      'descricaoTipo': instance.descricaoTipo,
      'numero': instance.numero,
      'ano': instance.ano,
      'ementa': instance.ementa,
      'nomePolitico': instance.nomePolitico,
      'idPoliticoAutor': instance.idPoliticoAutor,
      'fotoPolitico': instance.fotoPolitico,
      'siglaPartido': instance.siglaPartido,
      'dataDocumento': instance.dataDocumento,
      'tipoDocumento': instance.tipoDocumento,
      'descricaoSituacao': instance.descricaoSituacao,
      'descricaoTramitacao': instance.descricaoTramitacao,
      'dataApresentacao': instance.dataApresentacao,
      'status': instance.status,
      'favorito': instance.favorito,
    };
