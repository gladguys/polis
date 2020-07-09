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
    this.foiEditado,
    this.qntSubComentarios,
  });

  final int id;
  final String usuarioId;
  final String usuarioNome;
  final String postId;
  final String texto;
  final DateTime diaHora;
  final bool foiEditado;
  @JsonKey(defaultValue: 0)
  final int qntSubComentarios;

  CommentModel copyWith({
    int id,
    String usuarioId,
    String usuarioNome,
    String postId,
    String texto,
    String diaHora,
    bool foiEditado,
    int qntSubComentarios,
  }) {
    return CommentModel(
      id: id ?? this.id,
      usuarioId: usuarioId ?? this.usuarioId,
      usuarioNome: usuarioNome ?? this.usuarioNome,
      postId: postId ?? this.postId,
      texto: texto ?? this.texto,
      diaHora: diaHora ?? this.diaHora,
      foiEditado: foiEditado ?? this.foiEditado,
      qntSubComentarios: qntSubComentarios ?? this.qntSubComentarios,
    );
  }

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentModelToJson(this);

  @override
  String toString() {
    return '''CommentModel{id: $id, usuarioId: $usuarioId, usuarioNome: $usuarioNome, postId: $postId, texto: $texto, diaHora: $diaHora, foiEditado: $foiEditado, qntSubComentarios: $qntSubComentarios}''';
  }

  @override
  List<Object> get props => [id, texto];
}
