// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'signin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SigninStateTearOff {
  const _$SigninStateTearOff();

  InitialSignin initial() {
    return InitialSignin();
  }

  SigninLoading signinLoading() {
    return SigninLoading();
  }

  SentingResetEmail sentingResetEmail() {
    return SentingResetEmail();
  }

  UserAuthenticated userAuthenticated(UserModel user) {
    return UserAuthenticated(
      user,
    );
  }

  UserAuthenticationFailed userAuthenticationFailed(String statusMessage) {
    return UserAuthenticationFailed(
      statusMessage,
    );
  }

  SigninFailed signinFailed(String errorMessage) {
    return SigninFailed(
      errorMessage,
    );
  }

  ResetEmailSentSuccess resetEmailSentSuccess() {
    return ResetEmailSentSuccess();
  }

  ResetEmailSentFailed resetEmailSentFailed() {
    return ResetEmailSentFailed();
  }
}

// ignore: unused_element
const $SigninState = _$SigninStateTearOff();

mixin _$SigninState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result signinLoading(),
    @required Result sentingResetEmail(),
    @required Result userAuthenticated(UserModel user),
    @required Result userAuthenticationFailed(String statusMessage),
    @required Result signinFailed(String errorMessage),
    @required Result resetEmailSentSuccess(),
    @required Result resetEmailSentFailed(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result signinLoading(),
    Result sentingResetEmail(),
    Result userAuthenticated(UserModel user),
    Result userAuthenticationFailed(String statusMessage),
    Result signinFailed(String errorMessage),
    Result resetEmailSentSuccess(),
    Result resetEmailSentFailed(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialSignin value),
    @required Result signinLoading(SigninLoading value),
    @required Result sentingResetEmail(SentingResetEmail value),
    @required Result userAuthenticated(UserAuthenticated value),
    @required Result userAuthenticationFailed(UserAuthenticationFailed value),
    @required Result signinFailed(SigninFailed value),
    @required Result resetEmailSentSuccess(ResetEmailSentSuccess value),
    @required Result resetEmailSentFailed(ResetEmailSentFailed value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialSignin value),
    Result signinLoading(SigninLoading value),
    Result sentingResetEmail(SentingResetEmail value),
    Result userAuthenticated(UserAuthenticated value),
    Result userAuthenticationFailed(UserAuthenticationFailed value),
    Result signinFailed(SigninFailed value),
    Result resetEmailSentSuccess(ResetEmailSentSuccess value),
    Result resetEmailSentFailed(ResetEmailSentFailed value),
    @required Result orElse(),
  });
}

abstract class $SigninStateCopyWith<$Res> {
  factory $SigninStateCopyWith(
          SigninState value, $Res Function(SigninState) then) =
      _$SigninStateCopyWithImpl<$Res>;
}

class _$SigninStateCopyWithImpl<$Res> implements $SigninStateCopyWith<$Res> {
  _$SigninStateCopyWithImpl(this._value, this._then);

  final SigninState _value;
  // ignore: unused_field
  final $Res Function(SigninState) _then;
}

abstract class $InitialSigninCopyWith<$Res> {
  factory $InitialSigninCopyWith(
          InitialSignin value, $Res Function(InitialSignin) then) =
      _$InitialSigninCopyWithImpl<$Res>;
}

class _$InitialSigninCopyWithImpl<$Res> extends _$SigninStateCopyWithImpl<$Res>
    implements $InitialSigninCopyWith<$Res> {
  _$InitialSigninCopyWithImpl(
      InitialSignin _value, $Res Function(InitialSignin) _then)
      : super(_value, (v) => _then(v as InitialSignin));

  @override
  InitialSignin get _value => super._value as InitialSignin;
}

class _$InitialSignin implements InitialSignin {
  _$InitialSignin();

  @override
  String toString() {
    return 'SigninState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialSignin);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result signinLoading(),
    @required Result sentingResetEmail(),
    @required Result userAuthenticated(UserModel user),
    @required Result userAuthenticationFailed(String statusMessage),
    @required Result signinFailed(String errorMessage),
    @required Result resetEmailSentSuccess(),
    @required Result resetEmailSentFailed(),
  }) {
    assert(initial != null);
    assert(signinLoading != null);
    assert(sentingResetEmail != null);
    assert(userAuthenticated != null);
    assert(userAuthenticationFailed != null);
    assert(signinFailed != null);
    assert(resetEmailSentSuccess != null);
    assert(resetEmailSentFailed != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result signinLoading(),
    Result sentingResetEmail(),
    Result userAuthenticated(UserModel user),
    Result userAuthenticationFailed(String statusMessage),
    Result signinFailed(String errorMessage),
    Result resetEmailSentSuccess(),
    Result resetEmailSentFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialSignin value),
    @required Result signinLoading(SigninLoading value),
    @required Result sentingResetEmail(SentingResetEmail value),
    @required Result userAuthenticated(UserAuthenticated value),
    @required Result userAuthenticationFailed(UserAuthenticationFailed value),
    @required Result signinFailed(SigninFailed value),
    @required Result resetEmailSentSuccess(ResetEmailSentSuccess value),
    @required Result resetEmailSentFailed(ResetEmailSentFailed value),
  }) {
    assert(initial != null);
    assert(signinLoading != null);
    assert(sentingResetEmail != null);
    assert(userAuthenticated != null);
    assert(userAuthenticationFailed != null);
    assert(signinFailed != null);
    assert(resetEmailSentSuccess != null);
    assert(resetEmailSentFailed != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialSignin value),
    Result signinLoading(SigninLoading value),
    Result sentingResetEmail(SentingResetEmail value),
    Result userAuthenticated(UserAuthenticated value),
    Result userAuthenticationFailed(UserAuthenticationFailed value),
    Result signinFailed(SigninFailed value),
    Result resetEmailSentSuccess(ResetEmailSentSuccess value),
    Result resetEmailSentFailed(ResetEmailSentFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialSignin implements SigninState {
  factory InitialSignin() = _$InitialSignin;
}

abstract class $SigninLoadingCopyWith<$Res> {
  factory $SigninLoadingCopyWith(
          SigninLoading value, $Res Function(SigninLoading) then) =
      _$SigninLoadingCopyWithImpl<$Res>;
}

class _$SigninLoadingCopyWithImpl<$Res> extends _$SigninStateCopyWithImpl<$Res>
    implements $SigninLoadingCopyWith<$Res> {
  _$SigninLoadingCopyWithImpl(
      SigninLoading _value, $Res Function(SigninLoading) _then)
      : super(_value, (v) => _then(v as SigninLoading));

  @override
  SigninLoading get _value => super._value as SigninLoading;
}

class _$SigninLoading implements SigninLoading {
  _$SigninLoading();

  @override
  String toString() {
    return 'SigninState.signinLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SigninLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result signinLoading(),
    @required Result sentingResetEmail(),
    @required Result userAuthenticated(UserModel user),
    @required Result userAuthenticationFailed(String statusMessage),
    @required Result signinFailed(String errorMessage),
    @required Result resetEmailSentSuccess(),
    @required Result resetEmailSentFailed(),
  }) {
    assert(initial != null);
    assert(signinLoading != null);
    assert(sentingResetEmail != null);
    assert(userAuthenticated != null);
    assert(userAuthenticationFailed != null);
    assert(signinFailed != null);
    assert(resetEmailSentSuccess != null);
    assert(resetEmailSentFailed != null);
    return signinLoading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result signinLoading(),
    Result sentingResetEmail(),
    Result userAuthenticated(UserModel user),
    Result userAuthenticationFailed(String statusMessage),
    Result signinFailed(String errorMessage),
    Result resetEmailSentSuccess(),
    Result resetEmailSentFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (signinLoading != null) {
      return signinLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialSignin value),
    @required Result signinLoading(SigninLoading value),
    @required Result sentingResetEmail(SentingResetEmail value),
    @required Result userAuthenticated(UserAuthenticated value),
    @required Result userAuthenticationFailed(UserAuthenticationFailed value),
    @required Result signinFailed(SigninFailed value),
    @required Result resetEmailSentSuccess(ResetEmailSentSuccess value),
    @required Result resetEmailSentFailed(ResetEmailSentFailed value),
  }) {
    assert(initial != null);
    assert(signinLoading != null);
    assert(sentingResetEmail != null);
    assert(userAuthenticated != null);
    assert(userAuthenticationFailed != null);
    assert(signinFailed != null);
    assert(resetEmailSentSuccess != null);
    assert(resetEmailSentFailed != null);
    return signinLoading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialSignin value),
    Result signinLoading(SigninLoading value),
    Result sentingResetEmail(SentingResetEmail value),
    Result userAuthenticated(UserAuthenticated value),
    Result userAuthenticationFailed(UserAuthenticationFailed value),
    Result signinFailed(SigninFailed value),
    Result resetEmailSentSuccess(ResetEmailSentSuccess value),
    Result resetEmailSentFailed(ResetEmailSentFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (signinLoading != null) {
      return signinLoading(this);
    }
    return orElse();
  }
}

abstract class SigninLoading implements SigninState {
  factory SigninLoading() = _$SigninLoading;
}

abstract class $SentingResetEmailCopyWith<$Res> {
  factory $SentingResetEmailCopyWith(
          SentingResetEmail value, $Res Function(SentingResetEmail) then) =
      _$SentingResetEmailCopyWithImpl<$Res>;
}

class _$SentingResetEmailCopyWithImpl<$Res>
    extends _$SigninStateCopyWithImpl<$Res>
    implements $SentingResetEmailCopyWith<$Res> {
  _$SentingResetEmailCopyWithImpl(
      SentingResetEmail _value, $Res Function(SentingResetEmail) _then)
      : super(_value, (v) => _then(v as SentingResetEmail));

  @override
  SentingResetEmail get _value => super._value as SentingResetEmail;
}

class _$SentingResetEmail implements SentingResetEmail {
  _$SentingResetEmail();

  @override
  String toString() {
    return 'SigninState.sentingResetEmail()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SentingResetEmail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result signinLoading(),
    @required Result sentingResetEmail(),
    @required Result userAuthenticated(UserModel user),
    @required Result userAuthenticationFailed(String statusMessage),
    @required Result signinFailed(String errorMessage),
    @required Result resetEmailSentSuccess(),
    @required Result resetEmailSentFailed(),
  }) {
    assert(initial != null);
    assert(signinLoading != null);
    assert(sentingResetEmail != null);
    assert(userAuthenticated != null);
    assert(userAuthenticationFailed != null);
    assert(signinFailed != null);
    assert(resetEmailSentSuccess != null);
    assert(resetEmailSentFailed != null);
    return sentingResetEmail();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result signinLoading(),
    Result sentingResetEmail(),
    Result userAuthenticated(UserModel user),
    Result userAuthenticationFailed(String statusMessage),
    Result signinFailed(String errorMessage),
    Result resetEmailSentSuccess(),
    Result resetEmailSentFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sentingResetEmail != null) {
      return sentingResetEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialSignin value),
    @required Result signinLoading(SigninLoading value),
    @required Result sentingResetEmail(SentingResetEmail value),
    @required Result userAuthenticated(UserAuthenticated value),
    @required Result userAuthenticationFailed(UserAuthenticationFailed value),
    @required Result signinFailed(SigninFailed value),
    @required Result resetEmailSentSuccess(ResetEmailSentSuccess value),
    @required Result resetEmailSentFailed(ResetEmailSentFailed value),
  }) {
    assert(initial != null);
    assert(signinLoading != null);
    assert(sentingResetEmail != null);
    assert(userAuthenticated != null);
    assert(userAuthenticationFailed != null);
    assert(signinFailed != null);
    assert(resetEmailSentSuccess != null);
    assert(resetEmailSentFailed != null);
    return sentingResetEmail(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialSignin value),
    Result signinLoading(SigninLoading value),
    Result sentingResetEmail(SentingResetEmail value),
    Result userAuthenticated(UserAuthenticated value),
    Result userAuthenticationFailed(UserAuthenticationFailed value),
    Result signinFailed(SigninFailed value),
    Result resetEmailSentSuccess(ResetEmailSentSuccess value),
    Result resetEmailSentFailed(ResetEmailSentFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sentingResetEmail != null) {
      return sentingResetEmail(this);
    }
    return orElse();
  }
}

abstract class SentingResetEmail implements SigninState {
  factory SentingResetEmail() = _$SentingResetEmail;
}

abstract class $UserAuthenticatedCopyWith<$Res> {
  factory $UserAuthenticatedCopyWith(
          UserAuthenticated value, $Res Function(UserAuthenticated) then) =
      _$UserAuthenticatedCopyWithImpl<$Res>;
  $Res call({UserModel user});
}

class _$UserAuthenticatedCopyWithImpl<$Res>
    extends _$SigninStateCopyWithImpl<$Res>
    implements $UserAuthenticatedCopyWith<$Res> {
  _$UserAuthenticatedCopyWithImpl(
      UserAuthenticated _value, $Res Function(UserAuthenticated) _then)
      : super(_value, (v) => _then(v as UserAuthenticated));

  @override
  UserAuthenticated get _value => super._value as UserAuthenticated;

  @override
  $Res call({
    Object user = freezed,
  }) {
    return _then(UserAuthenticated(
      user == freezed ? _value.user : user as UserModel,
    ));
  }
}

class _$UserAuthenticated implements UserAuthenticated {
  _$UserAuthenticated(this.user) : assert(user != null);

  @override
  final UserModel user;

  @override
  String toString() {
    return 'SigninState.userAuthenticated(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserAuthenticated &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @override
  $UserAuthenticatedCopyWith<UserAuthenticated> get copyWith =>
      _$UserAuthenticatedCopyWithImpl<UserAuthenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result signinLoading(),
    @required Result sentingResetEmail(),
    @required Result userAuthenticated(UserModel user),
    @required Result userAuthenticationFailed(String statusMessage),
    @required Result signinFailed(String errorMessage),
    @required Result resetEmailSentSuccess(),
    @required Result resetEmailSentFailed(),
  }) {
    assert(initial != null);
    assert(signinLoading != null);
    assert(sentingResetEmail != null);
    assert(userAuthenticated != null);
    assert(userAuthenticationFailed != null);
    assert(signinFailed != null);
    assert(resetEmailSentSuccess != null);
    assert(resetEmailSentFailed != null);
    return userAuthenticated(user);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result signinLoading(),
    Result sentingResetEmail(),
    Result userAuthenticated(UserModel user),
    Result userAuthenticationFailed(String statusMessage),
    Result signinFailed(String errorMessage),
    Result resetEmailSentSuccess(),
    Result resetEmailSentFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userAuthenticated != null) {
      return userAuthenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialSignin value),
    @required Result signinLoading(SigninLoading value),
    @required Result sentingResetEmail(SentingResetEmail value),
    @required Result userAuthenticated(UserAuthenticated value),
    @required Result userAuthenticationFailed(UserAuthenticationFailed value),
    @required Result signinFailed(SigninFailed value),
    @required Result resetEmailSentSuccess(ResetEmailSentSuccess value),
    @required Result resetEmailSentFailed(ResetEmailSentFailed value),
  }) {
    assert(initial != null);
    assert(signinLoading != null);
    assert(sentingResetEmail != null);
    assert(userAuthenticated != null);
    assert(userAuthenticationFailed != null);
    assert(signinFailed != null);
    assert(resetEmailSentSuccess != null);
    assert(resetEmailSentFailed != null);
    return userAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialSignin value),
    Result signinLoading(SigninLoading value),
    Result sentingResetEmail(SentingResetEmail value),
    Result userAuthenticated(UserAuthenticated value),
    Result userAuthenticationFailed(UserAuthenticationFailed value),
    Result signinFailed(SigninFailed value),
    Result resetEmailSentSuccess(ResetEmailSentSuccess value),
    Result resetEmailSentFailed(ResetEmailSentFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userAuthenticated != null) {
      return userAuthenticated(this);
    }
    return orElse();
  }
}

abstract class UserAuthenticated implements SigninState {
  factory UserAuthenticated(UserModel user) = _$UserAuthenticated;

  UserModel get user;
  $UserAuthenticatedCopyWith<UserAuthenticated> get copyWith;
}

abstract class $UserAuthenticationFailedCopyWith<$Res> {
  factory $UserAuthenticationFailedCopyWith(UserAuthenticationFailed value,
          $Res Function(UserAuthenticationFailed) then) =
      _$UserAuthenticationFailedCopyWithImpl<$Res>;
  $Res call({String statusMessage});
}

class _$UserAuthenticationFailedCopyWithImpl<$Res>
    extends _$SigninStateCopyWithImpl<$Res>
    implements $UserAuthenticationFailedCopyWith<$Res> {
  _$UserAuthenticationFailedCopyWithImpl(UserAuthenticationFailed _value,
      $Res Function(UserAuthenticationFailed) _then)
      : super(_value, (v) => _then(v as UserAuthenticationFailed));

  @override
  UserAuthenticationFailed get _value =>
      super._value as UserAuthenticationFailed;

  @override
  $Res call({
    Object statusMessage = freezed,
  }) {
    return _then(UserAuthenticationFailed(
      statusMessage == freezed ? _value.statusMessage : statusMessage as String,
    ));
  }
}

class _$UserAuthenticationFailed implements UserAuthenticationFailed {
  _$UserAuthenticationFailed(this.statusMessage)
      : assert(statusMessage != null);

  @override
  final String statusMessage;

  @override
  String toString() {
    return 'SigninState.userAuthenticationFailed(statusMessage: $statusMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserAuthenticationFailed &&
            (identical(other.statusMessage, statusMessage) ||
                const DeepCollectionEquality()
                    .equals(other.statusMessage, statusMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(statusMessage);

  @override
  $UserAuthenticationFailedCopyWith<UserAuthenticationFailed> get copyWith =>
      _$UserAuthenticationFailedCopyWithImpl<UserAuthenticationFailed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result signinLoading(),
    @required Result sentingResetEmail(),
    @required Result userAuthenticated(UserModel user),
    @required Result userAuthenticationFailed(String statusMessage),
    @required Result signinFailed(String errorMessage),
    @required Result resetEmailSentSuccess(),
    @required Result resetEmailSentFailed(),
  }) {
    assert(initial != null);
    assert(signinLoading != null);
    assert(sentingResetEmail != null);
    assert(userAuthenticated != null);
    assert(userAuthenticationFailed != null);
    assert(signinFailed != null);
    assert(resetEmailSentSuccess != null);
    assert(resetEmailSentFailed != null);
    return userAuthenticationFailed(statusMessage);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result signinLoading(),
    Result sentingResetEmail(),
    Result userAuthenticated(UserModel user),
    Result userAuthenticationFailed(String statusMessage),
    Result signinFailed(String errorMessage),
    Result resetEmailSentSuccess(),
    Result resetEmailSentFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userAuthenticationFailed != null) {
      return userAuthenticationFailed(statusMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialSignin value),
    @required Result signinLoading(SigninLoading value),
    @required Result sentingResetEmail(SentingResetEmail value),
    @required Result userAuthenticated(UserAuthenticated value),
    @required Result userAuthenticationFailed(UserAuthenticationFailed value),
    @required Result signinFailed(SigninFailed value),
    @required Result resetEmailSentSuccess(ResetEmailSentSuccess value),
    @required Result resetEmailSentFailed(ResetEmailSentFailed value),
  }) {
    assert(initial != null);
    assert(signinLoading != null);
    assert(sentingResetEmail != null);
    assert(userAuthenticated != null);
    assert(userAuthenticationFailed != null);
    assert(signinFailed != null);
    assert(resetEmailSentSuccess != null);
    assert(resetEmailSentFailed != null);
    return userAuthenticationFailed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialSignin value),
    Result signinLoading(SigninLoading value),
    Result sentingResetEmail(SentingResetEmail value),
    Result userAuthenticated(UserAuthenticated value),
    Result userAuthenticationFailed(UserAuthenticationFailed value),
    Result signinFailed(SigninFailed value),
    Result resetEmailSentSuccess(ResetEmailSentSuccess value),
    Result resetEmailSentFailed(ResetEmailSentFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userAuthenticationFailed != null) {
      return userAuthenticationFailed(this);
    }
    return orElse();
  }
}

abstract class UserAuthenticationFailed implements SigninState {
  factory UserAuthenticationFailed(String statusMessage) =
      _$UserAuthenticationFailed;

  String get statusMessage;
  $UserAuthenticationFailedCopyWith<UserAuthenticationFailed> get copyWith;
}

abstract class $SigninFailedCopyWith<$Res> {
  factory $SigninFailedCopyWith(
          SigninFailed value, $Res Function(SigninFailed) then) =
      _$SigninFailedCopyWithImpl<$Res>;
  $Res call({String errorMessage});
}

class _$SigninFailedCopyWithImpl<$Res> extends _$SigninStateCopyWithImpl<$Res>
    implements $SigninFailedCopyWith<$Res> {
  _$SigninFailedCopyWithImpl(
      SigninFailed _value, $Res Function(SigninFailed) _then)
      : super(_value, (v) => _then(v as SigninFailed));

  @override
  SigninFailed get _value => super._value as SigninFailed;

  @override
  $Res call({
    Object errorMessage = freezed,
  }) {
    return _then(SigninFailed(
      errorMessage == freezed ? _value.errorMessage : errorMessage as String,
    ));
  }
}

class _$SigninFailed implements SigninFailed {
  _$SigninFailed(this.errorMessage) : assert(errorMessage != null);

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'SigninState.signinFailed(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SigninFailed &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(errorMessage);

  @override
  $SigninFailedCopyWith<SigninFailed> get copyWith =>
      _$SigninFailedCopyWithImpl<SigninFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result signinLoading(),
    @required Result sentingResetEmail(),
    @required Result userAuthenticated(UserModel user),
    @required Result userAuthenticationFailed(String statusMessage),
    @required Result signinFailed(String errorMessage),
    @required Result resetEmailSentSuccess(),
    @required Result resetEmailSentFailed(),
  }) {
    assert(initial != null);
    assert(signinLoading != null);
    assert(sentingResetEmail != null);
    assert(userAuthenticated != null);
    assert(userAuthenticationFailed != null);
    assert(signinFailed != null);
    assert(resetEmailSentSuccess != null);
    assert(resetEmailSentFailed != null);
    return signinFailed(errorMessage);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result signinLoading(),
    Result sentingResetEmail(),
    Result userAuthenticated(UserModel user),
    Result userAuthenticationFailed(String statusMessage),
    Result signinFailed(String errorMessage),
    Result resetEmailSentSuccess(),
    Result resetEmailSentFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (signinFailed != null) {
      return signinFailed(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialSignin value),
    @required Result signinLoading(SigninLoading value),
    @required Result sentingResetEmail(SentingResetEmail value),
    @required Result userAuthenticated(UserAuthenticated value),
    @required Result userAuthenticationFailed(UserAuthenticationFailed value),
    @required Result signinFailed(SigninFailed value),
    @required Result resetEmailSentSuccess(ResetEmailSentSuccess value),
    @required Result resetEmailSentFailed(ResetEmailSentFailed value),
  }) {
    assert(initial != null);
    assert(signinLoading != null);
    assert(sentingResetEmail != null);
    assert(userAuthenticated != null);
    assert(userAuthenticationFailed != null);
    assert(signinFailed != null);
    assert(resetEmailSentSuccess != null);
    assert(resetEmailSentFailed != null);
    return signinFailed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialSignin value),
    Result signinLoading(SigninLoading value),
    Result sentingResetEmail(SentingResetEmail value),
    Result userAuthenticated(UserAuthenticated value),
    Result userAuthenticationFailed(UserAuthenticationFailed value),
    Result signinFailed(SigninFailed value),
    Result resetEmailSentSuccess(ResetEmailSentSuccess value),
    Result resetEmailSentFailed(ResetEmailSentFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (signinFailed != null) {
      return signinFailed(this);
    }
    return orElse();
  }
}

abstract class SigninFailed implements SigninState {
  factory SigninFailed(String errorMessage) = _$SigninFailed;

  String get errorMessage;
  $SigninFailedCopyWith<SigninFailed> get copyWith;
}

abstract class $ResetEmailSentSuccessCopyWith<$Res> {
  factory $ResetEmailSentSuccessCopyWith(ResetEmailSentSuccess value,
          $Res Function(ResetEmailSentSuccess) then) =
      _$ResetEmailSentSuccessCopyWithImpl<$Res>;
}

class _$ResetEmailSentSuccessCopyWithImpl<$Res>
    extends _$SigninStateCopyWithImpl<$Res>
    implements $ResetEmailSentSuccessCopyWith<$Res> {
  _$ResetEmailSentSuccessCopyWithImpl(
      ResetEmailSentSuccess _value, $Res Function(ResetEmailSentSuccess) _then)
      : super(_value, (v) => _then(v as ResetEmailSentSuccess));

  @override
  ResetEmailSentSuccess get _value => super._value as ResetEmailSentSuccess;
}

class _$ResetEmailSentSuccess implements ResetEmailSentSuccess {
  _$ResetEmailSentSuccess();

  @override
  String toString() {
    return 'SigninState.resetEmailSentSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ResetEmailSentSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result signinLoading(),
    @required Result sentingResetEmail(),
    @required Result userAuthenticated(UserModel user),
    @required Result userAuthenticationFailed(String statusMessage),
    @required Result signinFailed(String errorMessage),
    @required Result resetEmailSentSuccess(),
    @required Result resetEmailSentFailed(),
  }) {
    assert(initial != null);
    assert(signinLoading != null);
    assert(sentingResetEmail != null);
    assert(userAuthenticated != null);
    assert(userAuthenticationFailed != null);
    assert(signinFailed != null);
    assert(resetEmailSentSuccess != null);
    assert(resetEmailSentFailed != null);
    return resetEmailSentSuccess();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result signinLoading(),
    Result sentingResetEmail(),
    Result userAuthenticated(UserModel user),
    Result userAuthenticationFailed(String statusMessage),
    Result signinFailed(String errorMessage),
    Result resetEmailSentSuccess(),
    Result resetEmailSentFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resetEmailSentSuccess != null) {
      return resetEmailSentSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialSignin value),
    @required Result signinLoading(SigninLoading value),
    @required Result sentingResetEmail(SentingResetEmail value),
    @required Result userAuthenticated(UserAuthenticated value),
    @required Result userAuthenticationFailed(UserAuthenticationFailed value),
    @required Result signinFailed(SigninFailed value),
    @required Result resetEmailSentSuccess(ResetEmailSentSuccess value),
    @required Result resetEmailSentFailed(ResetEmailSentFailed value),
  }) {
    assert(initial != null);
    assert(signinLoading != null);
    assert(sentingResetEmail != null);
    assert(userAuthenticated != null);
    assert(userAuthenticationFailed != null);
    assert(signinFailed != null);
    assert(resetEmailSentSuccess != null);
    assert(resetEmailSentFailed != null);
    return resetEmailSentSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialSignin value),
    Result signinLoading(SigninLoading value),
    Result sentingResetEmail(SentingResetEmail value),
    Result userAuthenticated(UserAuthenticated value),
    Result userAuthenticationFailed(UserAuthenticationFailed value),
    Result signinFailed(SigninFailed value),
    Result resetEmailSentSuccess(ResetEmailSentSuccess value),
    Result resetEmailSentFailed(ResetEmailSentFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resetEmailSentSuccess != null) {
      return resetEmailSentSuccess(this);
    }
    return orElse();
  }
}

abstract class ResetEmailSentSuccess implements SigninState {
  factory ResetEmailSentSuccess() = _$ResetEmailSentSuccess;
}

abstract class $ResetEmailSentFailedCopyWith<$Res> {
  factory $ResetEmailSentFailedCopyWith(ResetEmailSentFailed value,
          $Res Function(ResetEmailSentFailed) then) =
      _$ResetEmailSentFailedCopyWithImpl<$Res>;
}

class _$ResetEmailSentFailedCopyWithImpl<$Res>
    extends _$SigninStateCopyWithImpl<$Res>
    implements $ResetEmailSentFailedCopyWith<$Res> {
  _$ResetEmailSentFailedCopyWithImpl(
      ResetEmailSentFailed _value, $Res Function(ResetEmailSentFailed) _then)
      : super(_value, (v) => _then(v as ResetEmailSentFailed));

  @override
  ResetEmailSentFailed get _value => super._value as ResetEmailSentFailed;
}

class _$ResetEmailSentFailed implements ResetEmailSentFailed {
  _$ResetEmailSentFailed();

  @override
  String toString() {
    return 'SigninState.resetEmailSentFailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ResetEmailSentFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result signinLoading(),
    @required Result sentingResetEmail(),
    @required Result userAuthenticated(UserModel user),
    @required Result userAuthenticationFailed(String statusMessage),
    @required Result signinFailed(String errorMessage),
    @required Result resetEmailSentSuccess(),
    @required Result resetEmailSentFailed(),
  }) {
    assert(initial != null);
    assert(signinLoading != null);
    assert(sentingResetEmail != null);
    assert(userAuthenticated != null);
    assert(userAuthenticationFailed != null);
    assert(signinFailed != null);
    assert(resetEmailSentSuccess != null);
    assert(resetEmailSentFailed != null);
    return resetEmailSentFailed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result signinLoading(),
    Result sentingResetEmail(),
    Result userAuthenticated(UserModel user),
    Result userAuthenticationFailed(String statusMessage),
    Result signinFailed(String errorMessage),
    Result resetEmailSentSuccess(),
    Result resetEmailSentFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resetEmailSentFailed != null) {
      return resetEmailSentFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialSignin value),
    @required Result signinLoading(SigninLoading value),
    @required Result sentingResetEmail(SentingResetEmail value),
    @required Result userAuthenticated(UserAuthenticated value),
    @required Result userAuthenticationFailed(UserAuthenticationFailed value),
    @required Result signinFailed(SigninFailed value),
    @required Result resetEmailSentSuccess(ResetEmailSentSuccess value),
    @required Result resetEmailSentFailed(ResetEmailSentFailed value),
  }) {
    assert(initial != null);
    assert(signinLoading != null);
    assert(sentingResetEmail != null);
    assert(userAuthenticated != null);
    assert(userAuthenticationFailed != null);
    assert(signinFailed != null);
    assert(resetEmailSentSuccess != null);
    assert(resetEmailSentFailed != null);
    return resetEmailSentFailed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialSignin value),
    Result signinLoading(SigninLoading value),
    Result sentingResetEmail(SentingResetEmail value),
    Result userAuthenticated(UserAuthenticated value),
    Result userAuthenticationFailed(UserAuthenticationFailed value),
    Result signinFailed(SigninFailed value),
    Result resetEmailSentSuccess(ResetEmailSentSuccess value),
    Result resetEmailSentFailed(ResetEmailSentFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resetEmailSentFailed != null) {
      return resetEmailSentFailed(this);
    }
    return orElse();
  }
}

abstract class ResetEmailSentFailed implements SigninState {
  factory ResetEmailSentFailed() = _$ResetEmailSentFailed;
}
