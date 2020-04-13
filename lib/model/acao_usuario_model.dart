import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../enum/acao_type.dart';

part 'acao_usuario_model.g.dart';

@JsonSerializable()
class AcaoUsuarioModel extends Equatable {
  AcaoUsuarioModel(
      {this.idPolitico,
      this.nomePolitico,
      this.data,
      this.mensagem,
      this.tipo,
      this.urlFotoPolitico});

  final String idPolitico;
  final String nomePolitico;
  final String mensagem;
  @JsonKey(fromJson: _fromJsonTipo, toJson: _toJsonTipo)
  final AcaoType tipo;
  final String urlFotoPolitico;
  @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
  final DateTime data;

  static AcaoType _fromJsonTipo(String tipo) =>
      tipo == 'SEGUIR' ? AcaoType.follow : AcaoType.unfollow;
  static String _toJsonTipo(AcaoType tipo) =>
      tipo == AcaoType.follow ? 'SEGUIR' : 'DEIXAR_SEGUIR';

  static DateTime _fromJsonTimestamp(Timestamp timestamp) =>
      DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
  static Timestamp _toJsonTimestamp(DateTime date) => Timestamp.fromDate(date);

  factory AcaoUsuarioModel.fromJson(Map<String, dynamic> json) =>
      _$AcaoUsuarioModelFromJson(json);

  Map<String, dynamic> toJson() => _$AcaoUsuarioModelToJson(this);

  @override
  List<Object> get props => [idPolitico, mensagem];

  @override
  String toString() {
    return '''AcaoUsuarioModel{idPolitico: $idPolitico, nomePolitico: $nomePolitico, data: $data, mensagem: $mensagem, tipo: $tipo, urlFotoPolitico: $urlFotoPolitico}''';
  }
}
