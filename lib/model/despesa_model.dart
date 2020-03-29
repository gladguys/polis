import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'despesa_model.g.dart';

@JsonSerializable()
class DespesaModel extends Equatable {
  DespesaModel(
      {this.ano,
      this.mes,
      this.cnpjCpfFornecedor,
      this.codDocumento,
      this.codLote,
      this.codTipoDocumento,
      this.dataDocumento,
      this.idPolitico,
      this.nomeFornecedor,
      this.nomePolitico,
      this.numDocumento,
      this.numRessarcimento,
      this.parcela,
      this.siglaPartido,
      this.tipoAtividade,
      this.tipoDespesa,
      this.tipoDocumento,
      this.urlDocumento,
      this.valorDocumento,
      this.valorGlosa,
      this.valorLiquido});

  final String ano;
  final String mes;
  final String cnpjCpfFornecedor;
  final String codDocumento;
  final String codLote;
  final String codTipoDocumento;
  final String dataDocumento;
  final String idPolitico;
  final String nomeFornecedor;
  final String nomePolitico;
  final String numDocumento;
  final String numRessarcimento;
  final String parcela;
  final String siglaPartido;
  final String tipoAtividade;
  final String tipoDespesa;
  final String tipoDocumento;
  final String urlDocumento;
  final String valorDocumento;
  final String valorGlosa;
  final String valorLiquido;

  factory DespesaModel.fromJson(Map<String, dynamic> json) =>
      _$DespesaModelFromJson(json);

  Map<String, dynamic> toJson() => _$DespesaModelToJson(this);

  @override
  List<Object> get props => [codDocumento];

  @override
  String toString() {
    return '''DespesaModel{ano: $ano, mes: $mes, cnpjCpfFornecedor: $cnpjCpfFornecedor, codDocumento: $codDocumento, codLote: $codLote, codTipoDocumento: $codTipoDocumento, dataDocumento: $dataDocumento, idPolitico: $idPolitico, nomeFornecedor: $nomeFornecedor, nomePolitico: $nomePolitico, numDocumento: $numDocumento, numRessarcimento: $numRessarcimento, parcela: $parcela, siglaPartido: $siglaPartido, tipoAtividade: $tipoAtividade, tipoDespesa: $tipoDespesa, tipoDocumento: $tipoDocumento, urlDocumento: $urlDocumento, valorDocumento: $valorDocumento, valorGlosa: $valorGlosa, valorLiquido: $valorLiquido}''';
  }
}
