import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'politico_model.g.dart';

@JsonSerializable()
class PoliticoModel extends Equatable {
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
      this.escolaridade});

  final String id;
  final String nomeCivil;
  final String siglaPartido;
  final String siglaUf;
  final String urlFoto;
  final String email;
  final String nomeEleitoral;
  final String status;
  final String condicaoEleitoral;
  final String cpf;
  final String sexo;
  final double quantidadeSeguidores;
  final DateTime dataNascimento;
  final String escolaridade;

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
    );
  }

  @override
  List<Object> get props => [id];

  @override
  String toString() {
    return '''PoliticoModel{id: $id, nomeCivil: $nomeCivil, siglaPartido: $siglaPartido, siglaUf: $siglaUf, urlFoto: $urlFoto, email: $email, nomeEleitoral: $nomeEleitoral, status: $status, condicaoEleitoral: $condicaoEleitoral, cpf: $cpf, sexo: $sexo, quantidadeSeguidores: $quantidadeSeguidores, dataNascimento: $dataNascimento, escolaridade: $escolaridade}''';
  }
}
