// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_seguindo_politico_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsuarioSeguindoPolitico _$UsuarioSeguindoPoliticoFromJson(
    Map<String, dynamic> json) {
  return UsuarioSeguindoPolitico(
    userId: json['userId'] as String,
    photoUrl: json['photoUrl'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$UsuarioSeguindoPoliticoToJson(
        UsuarioSeguindoPolitico instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'photoUrl': instance.photoUrl,
      'name': instance.name,
      'email': instance.email,
    };
