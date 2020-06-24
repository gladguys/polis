// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'signin_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SigninEventTearOff {
  const _$SigninEventTearOff();

  SigninWithEmailAndPassword signinWithEmailAndPassword(
      String email, String password) {
    return SigninWithEmailAndPassword(
      email,
      password,
    );
  }

  SigninWithGoogle signinWithGoogle() {
    return SigninWithGoogle();
  }

  SendResetPasswordEmail sendResetPasswordEmail(String email) {
    return SendResetPasswordEmail(
      email,
    );
  }
}

// ignore: unused_element
const $SigninEvent = _$SigninEventTearOff();

mixin _$SigninEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result signinWithEmailAndPassword(String email, String password),
    @required Result signinWithGoogle(),
    @required Result sendResetPasswordEmail(String email),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result signinWithEmailAndPassword(String email, String password),
    Result signinWithGoogle(),
    Result sendResetPasswordEmail(String email),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required
        Result signinWithEmailAndPassword(SigninWithEmailAndPassword value),
    @required Result signinWithGoogle(SigninWithGoogle value),
    @required Result sendResetPasswordEmail(SendResetPasswordEmail value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result signinWithEmailAndPassword(SigninWithEmailAndPassword value),
    Result signinWithGoogle(SigninWithGoogle value),
    Result sendResetPasswordEmail(SendResetPasswordEmail value),
    @required Result orElse(),
  });
}

abstract class $SigninEventCopyWith<$Res> {
  factory $SigninEventCopyWith(
          SigninEvent value, $Res Function(SigninEvent) then) =
      _$SigninEventCopyWithImpl<$Res>;
}

class _$SigninEventCopyWithImpl<$Res> implements $SigninEventCopyWith<$Res> {
  _$SigninEventCopyWithImpl(this._value, this._then);

  final SigninEvent _value;
  // ignore: unused_field
  final $Res Function(SigninEvent) _then;
}

abstract class $SigninWithEmailAndPasswordCopyWith<$Res> {
  factory $SigninWithEmailAndPasswordCopyWith(SigninWithEmailAndPassword value,
          $Res Function(SigninWithEmailAndPassword) then) =
      _$SigninWithEmailAndPasswordCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

class _$SigninWithEmailAndPasswordCopyWithImpl<$Res>
    extends _$SigninEventCopyWithImpl<$Res>
    implements $SigninWithEmailAndPasswordCopyWith<$Res> {
  _$SigninWithEmailAndPasswordCopyWithImpl(SigninWithEmailAndPassword _value,
      $Res Function(SigninWithEmailAndPassword) _then)
      : super(_value, (v) => _then(v as SigninWithEmailAndPassword));

  @override
  SigninWithEmailAndPassword get _value =>
      super._value as SigninWithEmailAndPassword;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
  }) {
    return _then(SigninWithEmailAndPassword(
      email == freezed ? _value.email : email as String,
      password == freezed ? _value.password : password as String,
    ));
  }
}

class _$SigninWithEmailAndPassword implements SigninWithEmailAndPassword {
  _$SigninWithEmailAndPassword(this.email, this.password)
      : assert(email != null),
        assert(password != null);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SigninEvent.signinWithEmailAndPassword(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SigninWithEmailAndPassword &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @override
  $SigninWithEmailAndPasswordCopyWith<SigninWithEmailAndPassword>
      get copyWith =>
          _$SigninWithEmailAndPasswordCopyWithImpl<SigninWithEmailAndPassword>(
              this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result signinWithEmailAndPassword(String email, String password),
    @required Result signinWithGoogle(),
    @required Result sendResetPasswordEmail(String email),
  }) {
    assert(signinWithEmailAndPassword != null);
    assert(signinWithGoogle != null);
    assert(sendResetPasswordEmail != null);
    return signinWithEmailAndPassword(email, password);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result signinWithEmailAndPassword(String email, String password),
    Result signinWithGoogle(),
    Result sendResetPasswordEmail(String email),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (signinWithEmailAndPassword != null) {
      return signinWithEmailAndPassword(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required
        Result signinWithEmailAndPassword(SigninWithEmailAndPassword value),
    @required Result signinWithGoogle(SigninWithGoogle value),
    @required Result sendResetPasswordEmail(SendResetPasswordEmail value),
  }) {
    assert(signinWithEmailAndPassword != null);
    assert(signinWithGoogle != null);
    assert(sendResetPasswordEmail != null);
    return signinWithEmailAndPassword(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result signinWithEmailAndPassword(SigninWithEmailAndPassword value),
    Result signinWithGoogle(SigninWithGoogle value),
    Result sendResetPasswordEmail(SendResetPasswordEmail value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (signinWithEmailAndPassword != null) {
      return signinWithEmailAndPassword(this);
    }
    return orElse();
  }
}

abstract class SigninWithEmailAndPassword implements SigninEvent {
  factory SigninWithEmailAndPassword(String email, String password) =
      _$SigninWithEmailAndPassword;

  String get email;
  String get password;
  $SigninWithEmailAndPasswordCopyWith<SigninWithEmailAndPassword> get copyWith;
}

abstract class $SigninWithGoogleCopyWith<$Res> {
  factory $SigninWithGoogleCopyWith(
          SigninWithGoogle value, $Res Function(SigninWithGoogle) then) =
      _$SigninWithGoogleCopyWithImpl<$Res>;
}

class _$SigninWithGoogleCopyWithImpl<$Res>
    extends _$SigninEventCopyWithImpl<$Res>
    implements $SigninWithGoogleCopyWith<$Res> {
  _$SigninWithGoogleCopyWithImpl(
      SigninWithGoogle _value, $Res Function(SigninWithGoogle) _then)
      : super(_value, (v) => _then(v as SigninWithGoogle));

  @override
  SigninWithGoogle get _value => super._value as SigninWithGoogle;
}

class _$SigninWithGoogle implements SigninWithGoogle {
  _$SigninWithGoogle();

  @override
  String toString() {
    return 'SigninEvent.signinWithGoogle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SigninWithGoogle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result signinWithEmailAndPassword(String email, String password),
    @required Result signinWithGoogle(),
    @required Result sendResetPasswordEmail(String email),
  }) {
    assert(signinWithEmailAndPassword != null);
    assert(signinWithGoogle != null);
    assert(sendResetPasswordEmail != null);
    return signinWithGoogle();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result signinWithEmailAndPassword(String email, String password),
    Result signinWithGoogle(),
    Result sendResetPasswordEmail(String email),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (signinWithGoogle != null) {
      return signinWithGoogle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required
        Result signinWithEmailAndPassword(SigninWithEmailAndPassword value),
    @required Result signinWithGoogle(SigninWithGoogle value),
    @required Result sendResetPasswordEmail(SendResetPasswordEmail value),
  }) {
    assert(signinWithEmailAndPassword != null);
    assert(signinWithGoogle != null);
    assert(sendResetPasswordEmail != null);
    return signinWithGoogle(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result signinWithEmailAndPassword(SigninWithEmailAndPassword value),
    Result signinWithGoogle(SigninWithGoogle value),
    Result sendResetPasswordEmail(SendResetPasswordEmail value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (signinWithGoogle != null) {
      return signinWithGoogle(this);
    }
    return orElse();
  }
}

abstract class SigninWithGoogle implements SigninEvent {
  factory SigninWithGoogle() = _$SigninWithGoogle;
}

abstract class $SendResetPasswordEmailCopyWith<$Res> {
  factory $SendResetPasswordEmailCopyWith(SendResetPasswordEmail value,
          $Res Function(SendResetPasswordEmail) then) =
      _$SendResetPasswordEmailCopyWithImpl<$Res>;
  $Res call({String email});
}

class _$SendResetPasswordEmailCopyWithImpl<$Res>
    extends _$SigninEventCopyWithImpl<$Res>
    implements $SendResetPasswordEmailCopyWith<$Res> {
  _$SendResetPasswordEmailCopyWithImpl(SendResetPasswordEmail _value,
      $Res Function(SendResetPasswordEmail) _then)
      : super(_value, (v) => _then(v as SendResetPasswordEmail));

  @override
  SendResetPasswordEmail get _value => super._value as SendResetPasswordEmail;

  @override
  $Res call({
    Object email = freezed,
  }) {
    return _then(SendResetPasswordEmail(
      email == freezed ? _value.email : email as String,
    ));
  }
}

class _$SendResetPasswordEmail implements SendResetPasswordEmail {
  _$SendResetPasswordEmail(this.email) : assert(email != null);

  @override
  final String email;

  @override
  String toString() {
    return 'SigninEvent.sendResetPasswordEmail(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SendResetPasswordEmail &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @override
  $SendResetPasswordEmailCopyWith<SendResetPasswordEmail> get copyWith =>
      _$SendResetPasswordEmailCopyWithImpl<SendResetPasswordEmail>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result signinWithEmailAndPassword(String email, String password),
    @required Result signinWithGoogle(),
    @required Result sendResetPasswordEmail(String email),
  }) {
    assert(signinWithEmailAndPassword != null);
    assert(signinWithGoogle != null);
    assert(sendResetPasswordEmail != null);
    return sendResetPasswordEmail(email);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result signinWithEmailAndPassword(String email, String password),
    Result signinWithGoogle(),
    Result sendResetPasswordEmail(String email),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendResetPasswordEmail != null) {
      return sendResetPasswordEmail(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required
        Result signinWithEmailAndPassword(SigninWithEmailAndPassword value),
    @required Result signinWithGoogle(SigninWithGoogle value),
    @required Result sendResetPasswordEmail(SendResetPasswordEmail value),
  }) {
    assert(signinWithEmailAndPassword != null);
    assert(signinWithGoogle != null);
    assert(sendResetPasswordEmail != null);
    return sendResetPasswordEmail(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result signinWithEmailAndPassword(SigninWithEmailAndPassword value),
    Result signinWithGoogle(SigninWithGoogle value),
    Result sendResetPasswordEmail(SendResetPasswordEmail value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendResetPasswordEmail != null) {
      return sendResetPasswordEmail(this);
    }
    return orElse();
  }
}

abstract class SendResetPasswordEmail implements SigninEvent {
  factory SendResetPasswordEmail(String email) = _$SendResetPasswordEmail;

  String get email;
  $SendResetPasswordEmailCopyWith<SendResetPasswordEmail> get copyWith;
}
