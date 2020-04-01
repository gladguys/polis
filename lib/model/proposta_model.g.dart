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
    dataApresentacao: json['dataApresentacao'] as String,
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
      'dataApresentacao': instance.dataApresentacao,
      'status': instance.status,
    };
