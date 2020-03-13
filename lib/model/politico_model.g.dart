// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'politico_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoliticoModel _$PoliticoModelFromJson(Map<String, dynamic> json) {
  return PoliticoModel(
    id: json['id'] as String,
    nome: json['nome'] as String,
    nomeEleitoral: json['nomeEleitoral'] as String,
    email: json['email'] as String,
    emailGabinete: json['emailGabinete'] as String,
    partido: json['partido'] as String,
    urlFoto: json['urlFoto'] as String,
    estado: json['estado'] as String,
    situacao: json['situacao'] as String,
    sexo: json['sexo'] as String,
    dataNascimento: json['dataNascimento'] == null
        ? null
        : DateTime.parse(json['dataNascimento'] as String),
    ufNascimento: json['ufNascimento'] as String,
    municipioNascimento: json['municipioNascimento'] as String,
    escolaridade: json['escolaridade'] as String,
  );
}

Map<String, dynamic> _$PoliticoModelToJson(PoliticoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'nomeEleitoral': instance.nomeEleitoral,
      'email': instance.email,
      'emailGabinete': instance.emailGabinete,
      'partido': instance.partido,
      'urlFoto': instance.urlFoto,
      'estado': instance.estado,
      'situacao': instance.situacao,
      'sexo': instance.sexo,
      'dataNascimento': instance.dataNascimento?.toIso8601String(),
      'ufNascimento': instance.ufNascimento,
      'municipioNascimento': instance.municipioNascimento,
      'escolaridade': instance.escolaridade,
    };
