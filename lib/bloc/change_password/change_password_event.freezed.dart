// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'change_password_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ChangePasswordEventTearOff {
  const _$ChangePasswordEventTearOff();

  ChangeUserPassword changeUserPassword(
      {@required String currentPassword, @required String newPassword}) {
    return ChangeUserPassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }
}

// ignore: unused_element
const $ChangePasswordEvent = _$ChangePasswordEventTearOff();

mixin _$ChangePasswordEvent {
  String get currentPassword;
  String get newPassword;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result changeUserPassword(String currentPassword, String newPassword),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result changeUserPassword(String currentPassword, String newPassword),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result changeUserPassword(ChangeUserPassword value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result changeUserPassword(ChangeUserPassword value),
    @required Result orElse(),
  });

  $ChangePasswordEventCopyWith<ChangePasswordEvent> get copyWith;
}

abstract class $ChangePasswordEventCopyWith<$Res> {
  factory $ChangePasswordEventCopyWith(
          ChangePasswordEvent value, $Res Function(ChangePasswordEvent) then) =
      _$ChangePasswordEventCopyWithImpl<$Res>;
  $Res call({String currentPassword, String newPassword});
}

class _$ChangePasswordEventCopyWithImpl<$Res>
    implements $ChangePasswordEventCopyWith<$Res> {
  _$ChangePasswordEventCopyWithImpl(this._value, this._then);

  final ChangePasswordEvent _value;
  // ignore: unused_field
  final $Res Function(ChangePasswordEvent) _then;

  @override
  $Res call({
    Object currentPassword = freezed,
    Object newPassword = freezed,
  }) {
    return _then(_value.copyWith(
      currentPassword: currentPassword == freezed
          ? _value.currentPassword
          : currentPassword as String,
      newPassword:
          newPassword == freezed ? _value.newPassword : newPassword as String,
    ));
  }
}

abstract class $ChangeUserPasswordCopyWith<$Res>
    implements $ChangePasswordEventCopyWith<$Res> {
  factory $ChangeUserPasswordCopyWith(
          ChangeUserPassword value, $Res Function(ChangeUserPassword) then) =
      _$ChangeUserPasswordCopyWithImpl<$Res>;
  @override
  $Res call({String currentPassword, String newPassword});
}

class _$ChangeUserPasswordCopyWithImpl<$Res>
    extends _$ChangePasswordEventCopyWithImpl<$Res>
    implements $ChangeUserPasswordCopyWith<$Res> {
  _$ChangeUserPasswordCopyWithImpl(
      ChangeUserPassword _value, $Res Function(ChangeUserPassword) _then)
      : super(_value, (v) => _then(v as ChangeUserPassword));

  @override
  ChangeUserPassword get _value => super._value as ChangeUserPassword;

  @override
  $Res call({
    Object currentPassword = freezed,
    Object newPassword = freezed,
  }) {
    return _then(ChangeUserPassword(
      currentPassword: currentPassword == freezed
          ? _value.currentPassword
          : currentPassword as String,
      newPassword:
          newPassword == freezed ? _value.newPassword : newPassword as String,
    ));
  }
}

class _$ChangeUserPassword implements ChangeUserPassword {
  _$ChangeUserPassword(
      {@required this.currentPassword, @required this.newPassword})
      : assert(currentPassword != null),
        assert(newPassword != null);

  @override
  final String currentPassword;
  @override
  final String newPassword;

  @override
  String toString() {
    return 'ChangePasswordEvent.changeUserPassword(currentPassword: $currentPassword, newPassword: $newPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeUserPassword &&
            (identical(other.currentPassword, currentPassword) ||
                const DeepCollectionEquality()
                    .equals(other.currentPassword, currentPassword)) &&
            (identical(other.newPassword, newPassword) ||
                const DeepCollectionEquality()
                    .equals(other.newPassword, newPassword)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentPassword) ^
      const DeepCollectionEquality().hash(newPassword);

  @override
  $ChangeUserPasswordCopyWith<ChangeUserPassword> get copyWith =>
      _$ChangeUserPasswordCopyWithImpl<ChangeUserPassword>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result changeUserPassword(String currentPassword, String newPassword),
  }) {
    assert(changeUserPassword != null);
    return changeUserPassword(currentPassword, newPassword);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result changeUserPassword(String currentPassword, String newPassword),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changeUserPassword != null) {
      return changeUserPassword(currentPassword, newPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result changeUserPassword(ChangeUserPassword value),
  }) {
    assert(changeUserPassword != null);
    return changeUserPassword(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result changeUserPassword(ChangeUserPassword value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changeUserPassword != null) {
      return changeUserPassword(this);
    }
    return orElse();
  }
}

abstract class ChangeUserPassword implements ChangePasswordEvent {
  factory ChangeUserPassword(
      {@required String currentPassword,
      @required String newPassword}) = _$ChangeUserPassword;

  @override
  String get currentPassword;
  @override
  String get newPassword;
  @override
  $ChangeUserPasswordCopyWith<ChangeUserPassword> get copyWith;
}
