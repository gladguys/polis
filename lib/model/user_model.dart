import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  UserModel({this.userId, this.name, this.email, this.photoUrl, this.password});

  final String userId;
  final String name;
  final String email;
  final String photoUrl;

  @JsonKey(ignore: true)
  final String password;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object> get props => [userId];

  @override
  String toString() {
    return 'UserModel{userId: $userId, name: $name, email: $email, '
        'photoUrl: $photoUrl, password: $password}';
  }
}
