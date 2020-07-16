import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sub_comment_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SubCommentModel extends Equatable {
  SubCommentModel({
    this.id,
    this.usuarioId,
    this.usuarioNome,
    this.postId,
    this.texto,
    this.diaHora,
    this.comentarioPaiId,
  });

  final int id;
  final String usuarioId;
  final String usuarioNome;
  final String postId;
  final String texto;
  final DateTime diaHora;
  final int comentarioPaiId;

  SubCommentModel copyWith({
    int id,
    String usuarioId,
    String usuarioNome,
    String postId,
    String texto,
    String diaHora,
    int comentarioPaiId,
  }) {
    return SubCommentModel(
      id: id ?? this.id,
      usuarioId: usuarioId ?? this.usuarioId,
      usuarioNome: usuarioNome ?? this.usuarioNome,
      postId: postId ?? this.postId,
      texto: texto ?? this.texto,
      diaHora: diaHora ?? this.diaHora,
      comentarioPaiId: comentarioPaiId ?? this.comentarioPaiId,
    );
  }

  factory SubCommentModel.fromJson(Map<String, dynamic> json) =>
      _$SubCommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubCommentModelToJson(this);

  @override
  String toString() {
    return '''SubCommentModel{id: $id, usuarioId: $usuarioId, usuarioNome: $usuarioNome, postId: $postId, texto: $texto, diaHora: $diaHora, comentarioPaiId: $comentarioPaiId}''';
  }

  @override
  List<Object> get props => [id, texto, comentarioPaiId];
}
