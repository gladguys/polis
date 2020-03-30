// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partido_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PartidoModelAdapter extends TypeAdapter<PartidoModel> {
  @override
  final int typeId = 0;

  @override
  PartidoModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PartidoModel(
      id: fields[0] as String,
      sigla: fields[1] as String,
      nome: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PartidoModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.sigla)
      ..writeByte(2)
      ..write(obj.nome);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartidoModel _$PartidoModelFromJson(Map<String, dynamic> json) {
  return PartidoModel(
    id: json['id'] as String,
    sigla: json['sigla'] as String,
    nome: json['nome'] as String,
  );
}

Map<String, dynamic> _$PartidoModelToJson(PartidoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sigla': instance.sigla,
      'nome': instance.nome,
    };
