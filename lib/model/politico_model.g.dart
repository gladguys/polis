// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'politico_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PoliticoModelAdapter extends TypeAdapter<PoliticoModel> {
  @override
  final int typeId = 1;

  @override
  PoliticoModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PoliticoModel(
      id: fields[0] as String,
      nomeCivil: fields[1] as String,
      siglaPartido: fields[2] as String,
      siglaUf: fields[3] as String,
      urlFoto: fields[4] as String,
      email: fields[5] as String,
      nomeEleitoral: fields[6] as String,
      status: fields[7] as String,
      condicaoEleitoral: fields[8] as String,
      cpf: fields[9] as String,
      sexo: fields[10] as String,
      quantidadeSeguidores: fields[11] as double,
      dataNascimento: fields[12] as DateTime,
      escolaridade: fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PoliticoModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nomeCivil)
      ..writeByte(2)
      ..write(obj.siglaPartido)
      ..writeByte(3)
      ..write(obj.siglaUf)
      ..writeByte(4)
      ..write(obj.urlFoto)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.nomeEleitoral)
      ..writeByte(7)
      ..write(obj.status)
      ..writeByte(8)
      ..write(obj.condicaoEleitoral)
      ..writeByte(9)
      ..write(obj.cpf)
      ..writeByte(10)
      ..write(obj.sexo)
      ..writeByte(11)
      ..write(obj.quantidadeSeguidores)
      ..writeByte(12)
      ..write(obj.dataNascimento)
      ..writeByte(13)
      ..write(obj.escolaridade);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoliticoModel _$PoliticoModelFromJson(Map<String, dynamic> json) {
  return PoliticoModel(
    id: json['id'] as String,
    nomeCivil: json['nomeCivil'] as String,
    siglaPartido: json['siglaPartido'] as String,
    siglaUf: json['siglaUf'] as String,
    urlFoto: json['urlFoto'] as String,
    email: json['email'] as String,
    nomeEleitoral: json['nomeEleitoral'] as String,
    status: json['status'] as String,
    condicaoEleitoral: json['condicaoEleitoral'] as String,
    cpf: json['cpf'] as String,
    sexo: json['sexo'] as String,
    quantidadeSeguidores: (json['quantidadeSeguidores'] as num)?.toDouble(),
    dataNascimento: json['dataNascimento'] == null
        ? null
        : DateTime.parse(json['dataNascimento'] as String),
    escolaridade: json['escolaridade'] as String,
  );
}

Map<String, dynamic> _$PoliticoModelToJson(PoliticoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nomeCivil': instance.nomeCivil,
      'siglaPartido': instance.siglaPartido,
      'siglaUf': instance.siglaUf,
      'urlFoto': instance.urlFoto,
      'email': instance.email,
      'nomeEleitoral': instance.nomeEleitoral,
      'status': instance.status,
      'condicaoEleitoral': instance.condicaoEleitoral,
      'cpf': instance.cpf,
      'sexo': instance.sexo,
      'quantidadeSeguidores': instance.quantidadeSeguidores,
      'dataNascimento': instance.dataNascimento?.toIso8601String(),
      'escolaridade': instance.escolaridade,
    };
