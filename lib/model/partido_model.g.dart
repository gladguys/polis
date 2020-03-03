// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partido_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartidoModel _$PartidoModelFromJson(Map<String, dynamic> json) {
  return PartidoModel(
    id: json['id'] as String,
    sigla: json['sigla'] as String,
    nome: json['nome'] as String,
    situacao: json['situacao'] as String,
    totalPosse: json['totalPosse'] as int,
    totalMembros: json['totalMembros'] as int,
    lider: json['lider'] as String,
  );
}

Map<String, dynamic> _$PartidoModelToJson(PartidoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sigla': instance.sigla,
      'nome': instance.nome,
      'situacao': instance.situacao,
      'totalPosse': instance.totalPosse,
      'totalMembros': instance.totalMembros,
      'lider': instance.lider,
    };
