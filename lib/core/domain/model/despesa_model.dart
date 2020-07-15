import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'despesa_model.g.dart';

@JsonSerializable()
class DespesaModel extends Equatable {
  DespesaModel({
    this.id,
    this.ano,
    this.mes,
    this.cnpjCpfFornecedor,
    this.codDocumento,
    this.codLote,
    this.codTipoDocumento,
    this.dataDocumento,
    this.dataPublicacao,
    this.estadoPolitico,
    this.idPolitico,
    this.nomeFornecedor,
    this.nomePolitico,
    this.numDocumento,
    this.fotoPolitico,
    this.numRessarcimento,
    this.parcela,
    this.favorito,
    this.siglaPartido,
    this.tipoAtividade,
    this.tipoDespesa,
    this.tipoDocumento,
    this.urlDocumento,
    this.valorDocumento,
    this.valorGlosa,
    this.valorLiquido,
    this.visualizado,
    this.urlPartidoLogo,
    this.qtdCurtidas,
    this.qtdNaoCurtidas,
  });

  final String id;
  final String ano;
  final String mes;
  final String cnpjCpfFornecedor;
  final String codDocumento;
  final String codLote;
  final String codTipoDocumento;
  final String fotoPolitico;
  final String dataDocumento;
  final String dataPublicacao;
  final String estadoPolitico;
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
  final bool favorito;
  final bool visualizado;
  final String urlPartidoLogo;
  final int qtdCurtidas;
  final int qtdNaoCurtidas;

  factory DespesaModel.fromJson(Map<String, dynamic> json) =>
      _$DespesaModelFromJson(json);

  Map<String, dynamic> toJson() => _$DespesaModelToJson(this);

  DespesaModel copyWith({
    String id,
    String ano,
    String mes,
    String cnpjCpfFornecedor,
    String codDocumento,
    String codLote,
    String codTipoDocumento,
    String fotoPolitico,
    String dataDocumento,
    String dataPublicacao,
    String estadoPolitico,
    String idPolitico,
    String nomeFornecedor,
    String nomePolitico,
    String numDocumento,
    String numRessarcimento,
    String parcela,
    String siglaPartido,
    String tipoAtividade,
    String tipoDespesa,
    String tipoDocumento,
    String urlDocumento,
    String valorDocumento,
    String valorGlosa,
    String valorLiquido,
    bool favorito,
    bool visualizado,
    String urlPartidoLogo,
    int qtdCurtidas,
    int qtdNaoCurtidas,
  }) {
    return DespesaModel(
      id: id ?? this.id,
      ano: ano ?? this.ano,
      mes: mes ?? this.mes,
      cnpjCpfFornecedor: cnpjCpfFornecedor ?? this.cnpjCpfFornecedor,
      codDocumento: codDocumento ?? this.codDocumento,
      codLote: codLote ?? this.codLote,
      codTipoDocumento: codTipoDocumento ?? this.codTipoDocumento,
      fotoPolitico: fotoPolitico ?? this.fotoPolitico,
      dataDocumento: dataDocumento ?? this.dataDocumento,
      dataPublicacao: dataPublicacao ?? this.dataPublicacao,
      estadoPolitico: estadoPolitico ?? this.estadoPolitico,
      idPolitico: idPolitico ?? this.idPolitico,
      nomeFornecedor: nomeFornecedor ?? this.nomeFornecedor,
      nomePolitico: nomePolitico ?? this.nomePolitico,
      numDocumento: numDocumento ?? this.numDocumento,
      numRessarcimento: numRessarcimento ?? this.numRessarcimento,
      parcela: parcela ?? this.parcela,
      siglaPartido: siglaPartido ?? this.siglaPartido,
      tipoAtividade: tipoAtividade ?? this.tipoAtividade,
      tipoDespesa: tipoDespesa ?? this.tipoDespesa,
      tipoDocumento: tipoDocumento ?? this.tipoDocumento,
      urlDocumento: urlDocumento ?? this.urlDocumento,
      valorDocumento: valorDocumento ?? this.valorDocumento,
      valorGlosa: valorGlosa ?? this.valorGlosa,
      favorito: favorito ?? this.favorito,
      valorLiquido: valorLiquido ?? this.valorLiquido,
      visualizado: visualizado ?? this.visualizado,
      urlPartidoLogo: urlPartidoLogo ?? this.urlPartidoLogo,
      qtdCurtidas: qtdCurtidas ?? this.qtdCurtidas,
      qtdNaoCurtidas: qtdNaoCurtidas ?? this.qtdNaoCurtidas,
    );
  }

  @override
  List<Object> get props => [codDocumento];

  @override
  String toString() {
    return '''DespesaModel{id: $id, ano: $ano, mes: $mes, cnpjCpfFornecedor: $cnpjCpfFornecedor, codDocumento: $codDocumento, codLote: $codLote, codTipoDocumento: $codTipoDocumento, fotoPolitico: $fotoPolitico, dataDocumento: $dataDocumento, dataPublicacao: $dataPublicacao, estadoPolitico: $estadoPolitico, idPolitico: $idPolitico, nomeFornecedor: $nomeFornecedor, nomePolitico: $nomePolitico, numDocumento: $numDocumento, numRessarcimento: $numRessarcimento, parcela: $parcela, siglaPartido: $siglaPartido, tipoAtividade: $tipoAtividade, tipoDespesa: $tipoDespesa, tipoDocumento: $tipoDocumento, urlDocumento: $urlDocumento, valorDocumento: $valorDocumento, valorGlosa: $valorGlosa, valorLiquido: $valorLiquido, favorito: $favorito, visualizado: $visualizado, urlPartidoLogo: $urlPartidoLogo, qtdCurtidas: $qtdCurtidas, qtdNaoCurtidas: $qtdNaoCurtidas}''';
  }
}
