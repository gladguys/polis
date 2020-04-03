import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'usuario_seguindo_politico_model.g.dart';

@JsonSerializable()
class UsuarioSeguindoPolitico extends Equatable {
  UsuarioSeguindoPolitico({this.userId, this.photoUrl, this.name, this.email});

  final String userId;
  final String photoUrl;
  final String name;
  final String email;

  factory UsuarioSeguindoPolitico.fromJson(Map<String, dynamic> json) =>
      _$UsuarioSeguindoPoliticoFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioSeguindoPoliticoToJson(this);

  @override
  List<Object> get props => [userId];

  @override
  String toString() {
    return '''UsuarioSeguindoPolitico{userId: $userId, photoUrl: $photoUrl, name: $name, email: $email}''';
  }
}
