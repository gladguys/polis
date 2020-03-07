import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'partido_model.g.dart';

@JsonSerializable()
class PartidoModel extends Equatable {
  PartidoModel(
      {this.id,
      this.sigla,
      this.nome,
      this.situacao,
      this.totalPosse,
      this.totalMembros,
      this.lider});

  final String id;
  final String sigla;
  final String nome;
  final String situacao;
  final int totalPosse;
  final int totalMembros;
  final String lider;

  factory PartidoModel.fromJson(Map<String, dynamic> json) =>
      _$PartidoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PartidoModelToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() {
    return '''PartidoModel{id: $id, sigla: $sigla, nome: $nome, situacao: $situacao, totalPosse: $totalPosse, totalMembros: $totalMembros, lider: $lider}''';
  }
}
