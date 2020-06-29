import 'package:equatable/equatable.dart';

class CommentModel extends Equatable {
  CommentModel({
    this.id,
    this.userId,
    this.texto,
    this.data,
    this.respostas,
  });

  final String id;
  final String userId;
  final String texto;
  final String data;
  final List<CommentModel> respostas;

  CommentModel copyWith({
    String id,
    String userId,
    String texto,
    String data,
    List<CommentModel> respostas,
  }) {
    return CommentModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      texto: texto ?? this.texto,
      data: data ?? this.data,
      respostas: respostas ?? this.respostas,
    );
  }

  @override
  String toString() {
    return '''CommentModel{id: $id, userId: $userId, texto: $texto, data: $data, respostas: $respostas}''';
  }

  @override
  List<Object> get props => [id, texto];
}
