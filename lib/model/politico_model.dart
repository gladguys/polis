import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'politico_model.g.dart';

@JsonSerializable()
class PoliticoModel extends Equatable {
  PoliticoModel(
      {this.id,
      this.nome,
      this.nomeEleitoral,
      this.email,
      this.emailGabinete,
      this.partido,
      this.urlFoto,
      this.estado,
      this.situacao,
      this.sexo,
      this.dataNascimento,
      this.ufNascimento,
      this.municipioNascimento,
      this.escolaridade});

  final String id;
  final String nome;
  final String nomeEleitoral;
  final String email;
  final String emailGabinete;
  final String partido;
  final String urlFoto;
  final String estado;
  final String situacao;
  final String sexo;
  final DateTime dataNascimento;
  final String ufNascimento;
  final String municipioNascimento;
  final String escolaridade;

  factory PoliticoModel.fromJson(Map<String, dynamic> json) =>
      _$PoliticoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PoliticoModelToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() {
    return '''PoliticoModel{id: $id, nome: $nome, nomeEleitoral: $nomeEleitoral, email: $email, emailGabinete: $emailGabinete, partido: $partido, urlFoto: $urlFoto, estado: $estado, situacao: $situacao, sexo: $sexo, dataNascimento: $dataNascimento, ufNascimento: $ufNascimento, municipioNascimento: $municipioNascimento, escolaridade: $escolaridade}''';
  }
}
