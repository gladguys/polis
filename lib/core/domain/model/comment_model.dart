import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class CommentModel extends Equatable {
  CommentModel({
    this.id,
    this.usuarioId,
    this.usuarioNome,
    this.postId,
    this.texto,
    this.diaHora,
  });

  final String id;
  final String usuarioId;
  final String usuarioNome;
  final String postId;
  final String texto;
  final String diaHora;

  CommentModel copyWith({
    String id,
    String usuarioId,
    String usuarioNome,
    String postId,
    String texto,
    String diaHora,
  }) {
    return CommentModel(
      id: id ?? this.id,
      usuarioId: usuarioId ?? this.usuarioId,
      usuarioNome: usuarioNome ?? this.usuarioNome,
      postId: postId ?? this.postId,
      texto: texto ?? this.texto,
      diaHora: diaHora ?? this.diaHora,
    );
  }

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentModelToJson(this);

  @override
  String toString() {
    return '''CommentModel{id: $id, usuarioId: $usuarioId, usuarioNome: $usuarioNome, postId: $postId, texto: $texto, diaHora: $diaHora}''';
  }

  @override
  List<Object> get props => [id, texto];
}
