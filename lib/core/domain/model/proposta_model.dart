import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'proposta_model.g.dart';

@JsonSerializable()
class PropostaModel extends Equatable {
  PropostaModel({
    this.id,
    this.idPropostaPolitico,
    this.siglaTipo,
    this.descricaoTipo,
    this.numero,
    this.ano,
    this.ementa,
    this.ementaDetalhada,
    this.despacho,
    this.fotoPolitico,
    this.estadoPolitico,
    this.nomePolitico,
    this.idPoliticoAutor,
    this.siglaPartido,
    this.descricaoSituacao,
    this.descricaoTramitacao,
    this.favorito,
    this.dataAtualizacao,
    this.dataPublicacao,
    this.tipoDocumento,
    this.sequencia,
    this.status,
    this.visualizado,
    this.foiAtualizada,
    this.urlPartidoLogo,
    this.urlInteiroTeor,
    this.nomesAutores,
    this.qtdCurtidas,
    this.qtdNaoCurtidas,
    this.qntComentarios,
  });

  final String id;
  final String idPropostaPolitico;
  final String siglaTipo;
  final String descricaoTipo;
  final String numero;
  final String ano;
  final String ementa;
  final String ementaDetalhada;
  final String despacho;
  final String nomePolitico;
  final String idPoliticoAutor;
  final String fotoPolitico;
  final String estadoPolitico;
  final String siglaPartido;
  final String tipoDocumento;
  final String descricaoSituacao;
  final String descricaoTramitacao;
  final String dataAtualizacao;
  final String dataPublicacao;
  final String status;
  final bool visualizado;
  final int sequencia;
  final bool favorito;
  final bool foiAtualizada;
  final String urlPartidoLogo;
  final String urlInteiroTeor;
  final List<String> nomesAutores;
  @JsonKey(defaultValue: 0)
  final int qtdCurtidas;
  @JsonKey(defaultValue: 0)
  final int qtdNaoCurtidas;
  @JsonKey(defaultValue: 0)
  final int qntComentarios;

  factory PropostaModel.fromJson(Map<String, dynamic> json) =>
      _$PropostaModelFromJson(json);

  Map<String, dynamic> toJson() => _$PropostaModelToJson(this);

  PropostaModel copyWith({
    String id,
    String idPropostaPolitico,
    String siglaTipo,
    String descricaoTipo,
    String numero,
    String ano,
    String ementa,
    String ementaDetalhada,
    String despacho,
    String nomePolitico,
    String idPoliticoAutor,
    String fotoPolitico,
    String estadoPolitico,
    String siglaPartido,
    String tipoDocumento,
    String descricaoSituacao,
    String descricaoTramitacao,
    String dataAtualizacao,
    String dataPublicacao,
    String status,
    bool visualizado,
    String sequencia,
    bool favorito,
    bool foiAtualizada,
    String urlPartidoLogo,
    String urlInteiroTeor,
    String nomesAutores,
    int qtdCurtidas,
    int qtdNaoCurtidas,
    int qntComentarios,
  }) {
    return PropostaModel(
      id: id ?? this.id,
      idPropostaPolitico: idPropostaPolitico ?? this.idPropostaPolitico,
      siglaTipo: siglaTipo ?? this.siglaTipo,
      descricaoTipo: descricaoTipo ?? this.descricaoTipo,
      numero: numero ?? this.numero,
      ano: ano ?? this.ano,
      ementa: ementa ?? this.ementa,
      ementaDetalhada: ementaDetalhada ?? this.ementaDetalhada,
      despacho: despacho ?? this.despacho,
      nomePolitico: nomePolitico ?? this.nomePolitico,
      idPoliticoAutor: idPoliticoAutor ?? this.idPoliticoAutor,
      fotoPolitico: fotoPolitico ?? this.fotoPolitico,
      estadoPolitico: estadoPolitico ?? this.estadoPolitico,
      siglaPartido: siglaPartido ?? this.siglaPartido,
      dataAtualizacao: dataAtualizacao ?? this.dataAtualizacao,
      dataPublicacao: dataPublicacao ?? this.dataPublicacao,
      tipoDocumento: tipoDocumento ?? this.tipoDocumento,
      descricaoSituacao: descricaoSituacao ?? this.descricaoSituacao,
      descricaoTramitacao: descricaoTramitacao ?? this.descricaoTramitacao,
      status: status ?? this.status,
      visualizado: visualizado ?? this.visualizado,
      sequencia: sequencia ?? this.sequencia,
      favorito: favorito ?? this.favorito,
      foiAtualizada: foiAtualizada ?? this.foiAtualizada,
      urlPartidoLogo: urlPartidoLogo ?? this.urlPartidoLogo,
      urlInteiroTeor: urlInteiroTeor ?? this.urlInteiroTeor,
      nomesAutores: nomesAutores ?? this.nomesAutores,
      qtdCurtidas: qtdCurtidas ?? this.qtdCurtidas,
      qtdNaoCurtidas: qtdNaoCurtidas ?? this.qtdNaoCurtidas,
      qntComentarios: qntComentarios ?? this.qntComentarios,
    );
  }

  @override
  List<Object> get props => [id];

  @override
  String toString() {
    return '''PropostaModel{id: $id, idPropostaPolitico: $idPropostaPolitico, siglaTipo: $siglaTipo, descricaoTipo: $descricaoTipo, numero: $numero, ano: $ano, ementa: $ementa, ementaDetalhada: $ementaDetalhada, despacho: $despacho, nomePolitico: $nomePolitico, idPoliticoAutor: $idPoliticoAutor, fotoPolitico: $fotoPolitico, estadoPolitico: $estadoPolitico, siglaPartido: $siglaPartido, tipoDocumento: $tipoDocumento, descricaoSituacao: $descricaoSituacao, descricaoTramitacao: $descricaoTramitacao, dataAtualizacao: $dataAtualizacao, status: $status, visualizado: $visualizado, sequencia: $sequencia, favorito: $favorito, foiAtualizada: $foiAtualizada, urlPartidoLogo: $urlPartidoLogo, urlInteiroTeor: $urlInteiroTeor, nomesAutores: $nomesAutores, qtdCurtidas: $qtdCurtidas, qtdNaoCurtidas: $qtdNaoCurtidas, qntComentarios: $qntComentarios}''';
  }
}
