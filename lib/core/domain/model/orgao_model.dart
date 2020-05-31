import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'orgao_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class OrgaoModel extends HiveObject {
  OrgaoModel({this.id, this.apelido, this.nome, this.sigla, this.tipoOrgao});

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String apelido;

  @HiveField(2)
  final String nome;

  @HiveField(3)
  final String sigla;

  @HiveField(4)
  final String tipoOrgao;

  factory OrgaoModel.fromJson(Map<String, dynamic> json) =>
      _$OrgaoModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrgaoModelToJson(this);

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrgaoModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return '''OrgaoModel{id: $id, apelido: $apelido, nome: $nome, sigla: $sigla, tipoOrgao: $tipoOrgao}''';
  }
}
