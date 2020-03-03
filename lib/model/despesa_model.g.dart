// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'despesa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DespesaModel _$DespesaModelFromJson(Map<String, dynamic> json) {
  return DespesaModel(
    id: json['id'] as String,
    tipoDespesa: json['tipoDespesa'] as String,
    tipoDocumento: json['tipoDocumento'] as String,
    dataDocumento: json['dataDocumento'] == null
        ? null
        : DateTime.parse(json['dataDocumento'] as String),
    valorDocumento: (json['valorDocumento'] as num)?.toDouble(),
    nomeFornecedor: json['nomeFornecedor'] as String,
    cnpjCpfFornecedor: json['cnpjCpfFornecedor'] as String,
  );
}

Map<String, dynamic> _$DespesaModelToJson(DespesaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tipoDespesa': instance.tipoDespesa,
      'tipoDocumento': instance.tipoDocumento,
      'dataDocumento': instance.dataDocumento?.toIso8601String(),
      'valorDocumento': instance.valorDocumento,
      'nomeFornecedor': instance.nomeFornecedor,
      'cnpjCpfFornecedor': instance.cnpjCpfFornecedor,
    };
