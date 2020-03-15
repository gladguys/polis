// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'politico_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoliticoModel _$PoliticoModelFromJson(Map<String, dynamic> json) {
  return PoliticoModel(
    id: json['id'] as String,
    nomeCivil: json['nomeCivil'] as String,
    siglaPartido: json['siglaPartido'] as String,
    siglaUf: json['siglaUf'] as String,
    urlFoto: json['urlFoto'] as String,
    email: json['email'] as String,
    nomeEleitoral: json['nomeEleitoral'] as String,
    status: json['status'] as String,
    condicaoEleitoral: json['condicaoEleitoral'] as String,
    cpf: json['cpf'] as String,
    sexo: json['sexo'] as String,
    dataNascimento: json['dataNascimento'] == null
        ? null
        : DateTime.parse(json['dataNascimento'] as String),
    escolaridade: json['escolaridade'] as String,
  );
}

Map<String, dynamic> _$PoliticoModelToJson(PoliticoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nomeCivil': instance.nomeCivil,
      'siglaPartido': instance.siglaPartido,
      'siglaUf': instance.siglaUf,
      'urlFoto': instance.urlFoto,
      'email': instance.email,
      'nomeEleitoral': instance.nomeEleitoral,
      'status': instance.status,
      'condicaoEleitoral': instance.condicaoEleitoral,
      'cpf': instance.cpf,
      'sexo': instance.sexo,
      'dataNascimento': instance.dataNascimento?.toIso8601String(),
      'escolaridade': instance.escolaridade,
    };
