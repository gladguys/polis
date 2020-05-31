import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'partido_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class PartidoModel extends HiveObject {
  PartidoModel({this.id, this.sigla, this.nome});

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String sigla;

  @HiveField(2)
  final String nome;

  factory PartidoModel.fromJson(Map<String, dynamic> json) =>
      _$PartidoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PartidoModelToJson(this);

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PartidoModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'PartidoModel{id: $id, sigla: $sigla, nome: $nome}';
  }
}
