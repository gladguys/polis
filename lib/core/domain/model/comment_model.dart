import 'package:equatable/equatable.dart';

class CommentModel extends Equatable {
  CommentModel({
    this.id,
    this.userId,
    this.username,
    this.userPhoto,
    this.texto,
    this.data,
    this.respostas,
  });

  final String id;
  final String userId;
  final String username;
  final String userPhoto;
  final String texto;
  final String data;
  final List<CommentModel> respostas;

  CommentModel copyWith({
    String id,
    String userId,
    String username,
    String userPhoto,
    String texto,
    String data,
    List<CommentModel> respostas,
  }) {
    return CommentModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      username: username ?? this.username,
      userPhoto: userPhoto ?? this.userPhoto,
      texto: texto ?? this.texto,
      data: data ?? this.data,
      respostas: respostas ?? this.respostas,
    );
  }

  @override
  String toString() {
    return '''CommentModel{id: $id, userId: $userId, username: $username, userPhoto: $userPhoto, texto: $texto, data: $data, respostas: $respostas}''';
  }

  @override
  List<Object> get props => [id, texto];
}
