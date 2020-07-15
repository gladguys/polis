import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../enum/acao_type.dart';
import '../enum/post_type.dart';

part 'acao_usuario_model.g.dart';

@JsonSerializable()
class AcaoUsuarioModel extends Equatable {
  AcaoUsuarioModel(
      {this.idPolitico,
      this.nomePolitico,
      this.data,
      this.mensagem,
      this.sexoPolitico,
      this.tipo,
      this.idPost,
      this.tipoPost,
      this.urlFotoPolitico});

  final String idPolitico;
  final String nomePolitico;
  final String mensagem;
  final String sexoPolitico;
  final String idPost;
  @JsonKey(fromJson: _fromJsonTipoAcao, toJson: _toJsonTipoAcao)
  final AcaoType tipo;
  @JsonKey(fromJson: _fromJsonTipoPost, toJson: _toJsonTipoPost)
  final PostType tipoPost;
  final String urlFotoPolitico;
  @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
  final DateTime data;

  static AcaoType _fromJsonTipoAcao(String tipo) {
    switch (tipo) {
      case 'SEGUIR':
        return AcaoType.follow;
      case 'DEIXAR_SEGUIR':
        return AcaoType.unfollow;
      case 'CURTIR':
        return AcaoType.like;
      case 'NAO_CURTIR':
        return AcaoType.unlike;
    }
    return null;
  }

  static String _toJsonTipoAcao(AcaoType tipo) {
    switch (tipo) {
      case AcaoType.follow:
        return 'SEGUIR';
      case AcaoType.unfollow:
        return 'DEIXAR_SEGUIR';
      case AcaoType.like:
        return 'CURTIR';
      case AcaoType.unlike:
        return 'NAO_CURTIR';
    }
    return null;
  }

  static PostType _fromJsonTipoPost(String tipo) {
    switch (tipo) {
      case 'DESPESA':
        return PostType.DESPESA;
      case 'PROPOSICAO':
        return PostType.PROPOSICAO;
    }
    return null;
  }

  static String _toJsonTipoPost(PostType tipo) {
    switch (tipo) {
      case PostType.DESPESA:
        return 'DESPESA';
      case PostType.PROPOSICAO:
        return 'PROPOSICAO';
    }
    return null;
  }

  static DateTime _fromJsonTimestamp(Timestamp timestamp) =>
      DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
  static Timestamp _toJsonTimestamp(DateTime date) => Timestamp.fromDate(date);

  AcaoUsuarioModel copyWith({
    String idPolitico,
    String nomePolitico,
    String mensagem,
    String sexoPolitico,
    String idPost,
    AcaoType tipo,
    PostType tipoPost,
    String urlFotoPolitico,
    DateTime data,
  }) {
    return AcaoUsuarioModel(
      idPolitico: idPolitico ?? this.idPolitico,
      nomePolitico: nomePolitico ?? this.nomePolitico,
      mensagem: mensagem ?? this.mensagem,
      sexoPolitico: sexoPolitico ?? this.sexoPolitico,
      idPost: idPost ?? this.idPost,
      tipo: tipo ?? this.tipo,
      tipoPost: tipoPost ?? this.tipoPost,
      urlFotoPolitico: urlFotoPolitico ?? this.urlFotoPolitico,
      data: data ?? this.data,
    );
  }

  factory AcaoUsuarioModel.fromJson(Map<String, dynamic> json) =>
      _$AcaoUsuarioModelFromJson(json);

  Map<String, dynamic> toJson() => _$AcaoUsuarioModelToJson(this);

  @override
  List<Object> get props => [idPolitico, mensagem];

  @override
  String toString() {
    return '''AcaoUsuarioModel{idPolitico: $idPolitico, nomePolitico: $nomePolitico, mensagem: $mensagem, sexoPolitico: $sexoPolitico, idPost: $idPost, tipo: $tipo, tipoPost: $tipoPost, urlFotoPolitico: $urlFotoPolitico, data: $data}''';
  }
}
