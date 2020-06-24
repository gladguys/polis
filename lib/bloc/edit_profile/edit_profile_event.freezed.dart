// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'edit_profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$EditProfileEventTearOff {
  const _$EditProfileEventTearOff();

  UpdateUserInfo updateUserInfo(
      {UserModel currentUser, String name, String email, File pickedPhoto}) {
    return UpdateUserInfo(
      currentUser: currentUser,
      name: name,
      email: email,
      pickedPhoto: pickedPhoto,
    );
  }
}

// ignore: unused_element
const $EditProfileEvent = _$EditProfileEventTearOff();

mixin _$EditProfileEvent {
  UserModel get currentUser;
  String get name;
  String get email;
  File get pickedPhoto;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result updateUserInfo(
            UserModel currentUser, String name, String email, File pickedPhoto),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result updateUserInfo(
        UserModel currentUser, String name, String email, File pickedPhoto),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result updateUserInfo(UpdateUserInfo value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result updateUserInfo(UpdateUserInfo value),
    @required Result orElse(),
  });

  $EditProfileEventCopyWith<EditProfileEvent> get copyWith;
}

abstract class $EditProfileEventCopyWith<$Res> {
  factory $EditProfileEventCopyWith(
          EditProfileEvent value, $Res Function(EditProfileEvent) then) =
      _$EditProfileEventCopyWithImpl<$Res>;
  $Res call(
      {UserModel currentUser, String name, String email, File pickedPhoto});
}

class _$EditProfileEventCopyWithImpl<$Res>
    implements $EditProfileEventCopyWith<$Res> {
  _$EditProfileEventCopyWithImpl(this._value, this._then);

  final EditProfileEvent _value;
  // ignore: unused_field
  final $Res Function(EditProfileEvent) _then;

  @override
  $Res call({
    Object currentUser = freezed,
    Object name = freezed,
    Object email = freezed,
    Object pickedPhoto = freezed,
  }) {
    return _then(_value.copyWith(
      currentUser: currentUser == freezed
          ? _value.currentUser
          : currentUser as UserModel,
      name: name == freezed ? _value.name : name as String,
      email: email == freezed ? _value.email : email as String,
      pickedPhoto:
          pickedPhoto == freezed ? _value.pickedPhoto : pickedPhoto as File,
    ));
  }
}

abstract class $UpdateUserInfoCopyWith<$Res>
    implements $EditProfileEventCopyWith<$Res> {
  factory $UpdateUserInfoCopyWith(
          UpdateUserInfo value, $Res Function(UpdateUserInfo) then) =
      _$UpdateUserInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserModel currentUser, String name, String email, File pickedPhoto});
}

class _$UpdateUserInfoCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res>
    implements $UpdateUserInfoCopyWith<$Res> {
  _$UpdateUserInfoCopyWithImpl(
      UpdateUserInfo _value, $Res Function(UpdateUserInfo) _then)
      : super(_value, (v) => _then(v as UpdateUserInfo));

  @override
  UpdateUserInfo get _value => super._value as UpdateUserInfo;

  @override
  $Res call({
    Object currentUser = freezed,
    Object name = freezed,
    Object email = freezed,
    Object pickedPhoto = freezed,
  }) {
    return _then(UpdateUserInfo(
      currentUser: currentUser == freezed
          ? _value.currentUser
          : currentUser as UserModel,
      name: name == freezed ? _value.name : name as String,
      email: email == freezed ? _value.email : email as String,
      pickedPhoto:
          pickedPhoto == freezed ? _value.pickedPhoto : pickedPhoto as File,
    ));
  }
}

class _$UpdateUserInfo implements UpdateUserInfo {
  const _$UpdateUserInfo(
      {this.currentUser, this.name, this.email, this.pickedPhoto});

  @override
  final UserModel currentUser;
  @override
  final String name;
  @override
  final String email;
  @override
  final File pickedPhoto;

  @override
  String toString() {
    return 'EditProfileEvent.updateUserInfo(currentUser: $currentUser, name: $name, email: $email, pickedPhoto: $pickedPhoto)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateUserInfo &&
            (identical(other.currentUser, currentUser) ||
                const DeepCollectionEquality()
                    .equals(other.currentUser, currentUser)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.pickedPhoto, pickedPhoto) ||
                const DeepCollectionEquality()
                    .equals(other.pickedPhoto, pickedPhoto)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentUser) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(pickedPhoto);

  @override
  $UpdateUserInfoCopyWith<UpdateUserInfo> get copyWith =>
      _$UpdateUserInfoCopyWithImpl<UpdateUserInfo>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result updateUserInfo(
            UserModel currentUser, String name, String email, File pickedPhoto),
  }) {
    assert(updateUserInfo != null);
    return updateUserInfo(currentUser, name, email, pickedPhoto);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result updateUserInfo(
        UserModel currentUser, String name, String email, File pickedPhoto),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updateUserInfo != null) {
      return updateUserInfo(currentUser, name, email, pickedPhoto);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result updateUserInfo(UpdateUserInfo value),
  }) {
    assert(updateUserInfo != null);
    return updateUserInfo(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result updateUserInfo(UpdateUserInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updateUserInfo != null) {
      return updateUserInfo(this);
    }
    return orElse();
  }
}

abstract class UpdateUserInfo implements EditProfileEvent {
  const factory UpdateUserInfo(
      {UserModel currentUser,
      String name,
      String email,
      File pickedPhoto}) = _$UpdateUserInfo;

  @override
  UserModel get currentUser;
  @override
  String get name;
  @override
  String get email;
  @override
  File get pickedPhoto;
  @override
  $UpdateUserInfoCopyWith<UpdateUserInfo> get copyWith;
}
