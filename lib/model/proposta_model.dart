import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'proposta_model.g.dart';

@JsonSerializable()
class PropostaModel extends Equatable {
  PropostaModel(
      {this.id,
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
      this.tipoDocumento,
      this.sequencia,
      this.status,
      this.visualizado,
      this.urlPartidoLogo});

  final String id;
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
  final String status;
  final bool visualizado;
  final int sequencia;
  final bool favorito;
  final String urlPartidoLogo;

  factory PropostaModel.fromJson(Map<String, dynamic> json) =>
      _$PropostaModelFromJson(json);

  Map<String, dynamic> toJson() => _$PropostaModelToJson(this);

  PropostaModel copyWith({
    String id,
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
    String status,
    bool visualizado,
    String sequencia,
    bool favorito,
    String urlPartidoLogo,
  }) {
    return PropostaModel(
      id: id ?? this.id,
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
      tipoDocumento: tipoDocumento ?? this.tipoDocumento,
      descricaoSituacao: descricaoSituacao ?? this.descricaoSituacao,
      descricaoTramitacao: descricaoTramitacao ?? this.descricaoTramitacao,
      status: status ?? this.status,
      visualizado: visualizado ?? this.visualizado,
      sequencia: sequencia ?? this.sequencia,
      favorito: favorito ?? this.favorito,
      urlPartidoLogo: urlPartidoLogo ?? this.urlPartidoLogo,
    );
  }

  @override
  List<Object> get props => [id];

  @override
  String toString() {
    return '''PropostaModel{id: $id, siglaTipo: $siglaTipo, descricaoTipo: $descricaoTipo, numero: $numero, ano: $ano, ementa: $ementa, ementaDetalhada: $ementaDetalhada, despacho: $despacho, nomePolitico: $nomePolitico, idPoliticoAutor: $idPoliticoAutor, fotoPolitico: $fotoPolitico, estadoPolitico: $estadoPolitico, siglaPartido: $siglaPartido, tipoDocumento: $tipoDocumento, descricaoSituacao: $descricaoSituacao, descricaoTramitacao: $descricaoTramitacao, dataAtualizacao: $dataAtualizacao, status: $status, visualizado: $visualizado, sequencia: $sequencia, favorito: $favorito, urlPartidoLogo: $urlPartidoLogo}''';
  }
}
