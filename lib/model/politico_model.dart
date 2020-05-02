import 'dart:ffi';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'politico_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class PoliticoModel extends HiveObject {
  PoliticoModel(
      {this.id,
      this.nomeCivil,
      this.siglaPartido,
      this.siglaUf,
      this.urlFoto,
      this.email,
      this.nomeEleitoral,
      this.status,
      this.condicaoEleitoral,
      this.cpf,
      this.sexo,
      this.quantidadeSeguidores,
      this.dataNascimento,
      this.escolaridade,
      this.totalDespesa});

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String nomeCivil;

  @HiveField(2)
  final String siglaPartido;

  @HiveField(3)
  final String siglaUf;

  @HiveField(4)
  final String urlFoto;

  @HiveField(5)
  final String email;

  @HiveField(6)
  final String nomeEleitoral;

  @HiveField(7)
  final String status;

  @HiveField(8)
  final String condicaoEleitoral;

  @HiveField(9)
  final String cpf;

  @HiveField(10)
  final String sexo;

  @HiveField(11)
  final double quantidadeSeguidores;

  @HiveField(12)
  final DateTime dataNascimento;

  @HiveField(13)
  final String escolaridade;

  @HiveField(14)
  final double totalDespesa;

  factory PoliticoModel.fromJson(Map<String, dynamic> json) =>
      _$PoliticoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PoliticoModelToJson(this);

  PoliticoModel copyWith({
    String id,
    String nomeCivil,
    String siglaPartido,
    String siglaUf,
    String urlFoto,
    String email,
    String nomeEleitoral,
    String status,
    String condicaoEleitoral,
    String cpf,
    String sexo,
    double quantidadeSeguidores,
    DateTime dataNascimento,
    String escolaridade,
    Double totalDespesa
  }) {
    return PoliticoModel(
      id: id ?? this.id,
      nomeCivil: nomeCivil ?? this.nomeCivil,
      siglaPartido: siglaPartido ?? this.siglaPartido,
      siglaUf: siglaUf ?? this.siglaUf,
      urlFoto: urlFoto ?? this.urlFoto,
      email: email ?? this.email,
      nomeEleitoral: nomeEleitoral ?? this.nomeEleitoral,
      status: status ?? this.status,
      condicaoEleitoral: condicaoEleitoral ?? this.condicaoEleitoral,
      cpf: cpf ?? this.cpf,
      sexo: sexo ?? this.sexo,
      quantidadeSeguidores: quantidadeSeguidores ?? this.quantidadeSeguidores,
      dataNascimento: dataNascimento ?? this.dataNascimento,
      escolaridade: escolaridade ?? this.escolaridade,
      totalDespesa: totalDespesa ?? this.totalDespesa,
    );
  }

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PoliticoModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return '''PoliticoModel{id: $id, nomeCivil: $nomeCivil, siglaPartido: $siglaPartido, siglaUf: $siglaUf, urlFoto: $urlFoto, email: $email, nomeEleitoral: $nomeEleitoral, status: $status, condicaoEleitoral: $condicaoEleitoral, cpf: $cpf, sexo: $sexo, quantidadeSeguidores: $quantidadeSeguidores, dataNascimento: $dataNascimento, escolaridade: $escolaridade}''';
  }
}
