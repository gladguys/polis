import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../enum/auth_provider.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  UserModel({
    this.userId,
    this.name,
    this.email,
    this.photoUrl,
    this.password,
    this.isFirstLoginDone,
    this.authProvider,
    this.fcmToken,
    this.userLikes,
    this.userUnlikes,
  });

  final String userId;
  final String name;
  final String email;
  final String photoUrl;
  final bool isFirstLoginDone;
  @JsonKey(fromJson: _fromJsonAuth, toJson: _toJsonAuth)
  final AuthProvider authProvider;

  @JsonKey(ignore: true)
  final String password;
  final String fcmToken;
  final Map<String, bool> userLikes;
  final Map<String, bool> userUnlikes;

  static AuthProvider _fromJsonAuth(String authProvider) =>
      authProvider == 'GOOGLE'
          ? AuthProvider.google
          : AuthProvider.emailAndPassword;

  static String _toJsonAuth(AuthProvider authProvider) =>
      authProvider == AuthProvider.google ? 'GOOGLE' : 'EMAIL_PASSWORD';

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    String userId,
    String name,
    String email,
    String photoUrl,
    String password,
    bool isFirstLoginDone,
    AuthProvider authProvider,
    String fcmToken,
    Map<String, bool> userLikes,
    Map<String, bool> userUnlikes,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      password: password ?? this.password,
      isFirstLoginDone: isFirstLoginDone ?? this.isFirstLoginDone,
      authProvider: authProvider ?? this.authProvider,
      fcmToken: fcmToken ?? this.fcmToken,
      userLikes: userLikes ?? this.userLikes,
      userUnlikes: userUnlikes ?? this.userUnlikes,
    );
  }

  @override
  List<Object> get props => [userId];

  @override
  String toString() {
    return '''UserModel{userId: $userId, name: $name, email: $email, photoUrl: $photoUrl, isFirstLoginDone: $isFirstLoginDone, authProvider: $authProvider, password: $password, fcmToken: $fcmToken}''';
  }
}
