// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'despesa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DespesaModel _$DespesaModelFromJson(Map<String, dynamic> json) {
  return DespesaModel(
    ano: json['ano'] as String,
    mes: json['mes'] as String,
    cnpjCpfFornecedor: json['cnpjCpfFornecedor'] as String,
    codDocumento: json['codDocumento'] as String,
    codLote: json['codLote'] as String,
    codTipoDocumento: json['codTipoDocumento'] as String,
    dataDocumento: json['dataDocumento'] as String,
    idPolitico: json['idPolitico'] as String,
    nomeFornecedor: json['nomeFornecedor'] as String,
    nomePolitico: json['nomePolitico'] as String,
    numDocumento: json['numDocumento'] as String,
    fotoPolitico: json['fotoPolitico'] as String,
    numRessarcimento: json['numRessarcimento'] as String,
    parcela: json['parcela'] as String,
    favorito: json['favorito'] as bool,
    siglaPartido: json['siglaPartido'] as String,
    tipoAtividade: json['tipoAtividade'] as String,
    tipoDespesa: json['tipoDespesa'] as String,
    tipoDocumento: json['tipoDocumento'] as String,
    urlDocumento: json['urlDocumento'] as String,
    valorDocumento: json['valorDocumento'] as String,
    valorGlosa: json['valorGlosa'] as String,
    valorLiquido: json['valorLiquido'] as String,
  );
}

Map<String, dynamic> _$DespesaModelToJson(DespesaModel instance) =>
    <String, dynamic>{
      'ano': instance.ano,
      'mes': instance.mes,
      'cnpjCpfFornecedor': instance.cnpjCpfFornecedor,
      'codDocumento': instance.codDocumento,
      'codLote': instance.codLote,
      'codTipoDocumento': instance.codTipoDocumento,
      'fotoPolitico': instance.fotoPolitico,
      'dataDocumento': instance.dataDocumento,
      'idPolitico': instance.idPolitico,
      'nomeFornecedor': instance.nomeFornecedor,
      'nomePolitico': instance.nomePolitico,
      'numDocumento': instance.numDocumento,
      'numRessarcimento': instance.numRessarcimento,
      'parcela': instance.parcela,
      'siglaPartido': instance.siglaPartido,
      'tipoAtividade': instance.tipoAtividade,
      'tipoDespesa': instance.tipoDespesa,
      'tipoDocumento': instance.tipoDocumento,
      'urlDocumento': instance.urlDocumento,
      'valorDocumento': instance.valorDocumento,
      'valorGlosa': instance.valorGlosa,
      'valorLiquido': instance.valorLiquido,
      'favorito': instance.favorito,
    };
