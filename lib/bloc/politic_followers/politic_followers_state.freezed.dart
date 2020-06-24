// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'politic_followers_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PoliticFollowersStateTearOff {
  const _$PoliticFollowersStateTearOff();

  InitialPoliticFollowersState initial() {
    return InitialPoliticFollowersState();
  }

  GetPoliticFollowersSuccess getPoliticFollowersSuccess(
      {List<UsuarioSeguindoPolitico> followers}) {
    return GetPoliticFollowersSuccess(
      followers: followers,
    );
  }

  GetPoliticFollowersFailed getPoliticFollowersFailed() {
    return GetPoliticFollowersFailed();
  }

  LoadingPoliticFollowers loadingPoliticFollowers() {
    return LoadingPoliticFollowers();
  }
}

// ignore: unused_element
const $PoliticFollowersState = _$PoliticFollowersStateTearOff();

mixin _$PoliticFollowersState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result getPoliticFollowersSuccess(
            List<UsuarioSeguindoPolitico> followers),
    @required Result getPoliticFollowersFailed(),
    @required Result loadingPoliticFollowers(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getPoliticFollowersSuccess(List<UsuarioSeguindoPolitico> followers),
    Result getPoliticFollowersFailed(),
    Result loadingPoliticFollowers(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticFollowersState value),
    @required
        Result getPoliticFollowersSuccess(GetPoliticFollowersSuccess value),
    @required Result getPoliticFollowersFailed(GetPoliticFollowersFailed value),
    @required Result loadingPoliticFollowers(LoadingPoliticFollowers value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticFollowersState value),
    Result getPoliticFollowersSuccess(GetPoliticFollowersSuccess value),
    Result getPoliticFollowersFailed(GetPoliticFollowersFailed value),
    Result loadingPoliticFollowers(LoadingPoliticFollowers value),
    @required Result orElse(),
  });
}

abstract class $PoliticFollowersStateCopyWith<$Res> {
  factory $PoliticFollowersStateCopyWith(PoliticFollowersState value,
          $Res Function(PoliticFollowersState) then) =
      _$PoliticFollowersStateCopyWithImpl<$Res>;
}

class _$PoliticFollowersStateCopyWithImpl<$Res>
    implements $PoliticFollowersStateCopyWith<$Res> {
  _$PoliticFollowersStateCopyWithImpl(this._value, this._then);

  final PoliticFollowersState _value;
  // ignore: unused_field
  final $Res Function(PoliticFollowersState) _then;
}

abstract class $InitialPoliticFollowersStateCopyWith<$Res> {
  factory $InitialPoliticFollowersStateCopyWith(
          InitialPoliticFollowersState value,
          $Res Function(InitialPoliticFollowersState) then) =
      _$InitialPoliticFollowersStateCopyWithImpl<$Res>;
}

class _$InitialPoliticFollowersStateCopyWithImpl<$Res>
    extends _$PoliticFollowersStateCopyWithImpl<$Res>
    implements $InitialPoliticFollowersStateCopyWith<$Res> {
  _$InitialPoliticFollowersStateCopyWithImpl(
      InitialPoliticFollowersState _value,
      $Res Function(InitialPoliticFollowersState) _then)
      : super(_value, (v) => _then(v as InitialPoliticFollowersState));

  @override
  InitialPoliticFollowersState get _value =>
      super._value as InitialPoliticFollowersState;
}

class _$InitialPoliticFollowersState implements InitialPoliticFollowersState {
  _$InitialPoliticFollowersState();

  @override
  String toString() {
    return 'PoliticFollowersState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialPoliticFollowersState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result getPoliticFollowersSuccess(
            List<UsuarioSeguindoPolitico> followers),
    @required Result getPoliticFollowersFailed(),
    @required Result loadingPoliticFollowers(),
  }) {
    assert(initial != null);
    assert(getPoliticFollowersSuccess != null);
    assert(getPoliticFollowersFailed != null);
    assert(loadingPoliticFollowers != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getPoliticFollowersSuccess(List<UsuarioSeguindoPolitico> followers),
    Result getPoliticFollowersFailed(),
    Result loadingPoliticFollowers(),
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
    @required Result initial(InitialPoliticFollowersState value),
    @required
        Result getPoliticFollowersSuccess(GetPoliticFollowersSuccess value),
    @required Result getPoliticFollowersFailed(GetPoliticFollowersFailed value),
    @required Result loadingPoliticFollowers(LoadingPoliticFollowers value),
  }) {
    assert(initial != null);
    assert(getPoliticFollowersSuccess != null);
    assert(getPoliticFollowersFailed != null);
    assert(loadingPoliticFollowers != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticFollowersState value),
    Result getPoliticFollowersSuccess(GetPoliticFollowersSuccess value),
    Result getPoliticFollowersFailed(GetPoliticFollowersFailed value),
    Result loadingPoliticFollowers(LoadingPoliticFollowers value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialPoliticFollowersState implements PoliticFollowersState {
  factory InitialPoliticFollowersState() = _$InitialPoliticFollowersState;
}

abstract class $GetPoliticFollowersSuccessCopyWith<$Res> {
  factory $GetPoliticFollowersSuccessCopyWith(GetPoliticFollowersSuccess value,
          $Res Function(GetPoliticFollowersSuccess) then) =
      _$GetPoliticFollowersSuccessCopyWithImpl<$Res>;
  $Res call({List<UsuarioSeguindoPolitico> followers});
}

class _$GetPoliticFollowersSuccessCopyWithImpl<$Res>
    extends _$PoliticFollowersStateCopyWithImpl<$Res>
    implements $GetPoliticFollowersSuccessCopyWith<$Res> {
  _$GetPoliticFollowersSuccessCopyWithImpl(GetPoliticFollowersSuccess _value,
      $Res Function(GetPoliticFollowersSuccess) _then)
      : super(_value, (v) => _then(v as GetPoliticFollowersSuccess));

  @override
  GetPoliticFollowersSuccess get _value =>
      super._value as GetPoliticFollowersSuccess;

  @override
  $Res call({
    Object followers = freezed,
  }) {
    return _then(GetPoliticFollowersSuccess(
      followers: followers == freezed
          ? _value.followers
          : followers as List<UsuarioSeguindoPolitico>,
    ));
  }
}

class _$GetPoliticFollowersSuccess implements GetPoliticFollowersSuccess {
  _$GetPoliticFollowersSuccess({this.followers});

  @override
  final List<UsuarioSeguindoPolitico> followers;

  @override
  String toString() {
    return 'PoliticFollowersState.getPoliticFollowersSuccess(followers: $followers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetPoliticFollowersSuccess &&
            (identical(other.followers, followers) ||
                const DeepCollectionEquality()
                    .equals(other.followers, followers)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(followers);

  @override
  $GetPoliticFollowersSuccessCopyWith<GetPoliticFollowersSuccess>
      get copyWith =>
          _$GetPoliticFollowersSuccessCopyWithImpl<GetPoliticFollowersSuccess>(
              this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result getPoliticFollowersSuccess(
            List<UsuarioSeguindoPolitico> followers),
    @required Result getPoliticFollowersFailed(),
    @required Result loadingPoliticFollowers(),
  }) {
    assert(initial != null);
    assert(getPoliticFollowersSuccess != null);
    assert(getPoliticFollowersFailed != null);
    assert(loadingPoliticFollowers != null);
    return getPoliticFollowersSuccess(followers);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getPoliticFollowersSuccess(List<UsuarioSeguindoPolitico> followers),
    Result getPoliticFollowersFailed(),
    Result loadingPoliticFollowers(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPoliticFollowersSuccess != null) {
      return getPoliticFollowersSuccess(followers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticFollowersState value),
    @required
        Result getPoliticFollowersSuccess(GetPoliticFollowersSuccess value),
    @required Result getPoliticFollowersFailed(GetPoliticFollowersFailed value),
    @required Result loadingPoliticFollowers(LoadingPoliticFollowers value),
  }) {
    assert(initial != null);
    assert(getPoliticFollowersSuccess != null);
    assert(getPoliticFollowersFailed != null);
    assert(loadingPoliticFollowers != null);
    return getPoliticFollowersSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticFollowersState value),
    Result getPoliticFollowersSuccess(GetPoliticFollowersSuccess value),
    Result getPoliticFollowersFailed(GetPoliticFollowersFailed value),
    Result loadingPoliticFollowers(LoadingPoliticFollowers value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPoliticFollowersSuccess != null) {
      return getPoliticFollowersSuccess(this);
    }
    return orElse();
  }
}

abstract class GetPoliticFollowersSuccess implements PoliticFollowersState {
  factory GetPoliticFollowersSuccess(
      {List<UsuarioSeguindoPolitico> followers}) = _$GetPoliticFollowersSuccess;

  List<UsuarioSeguindoPolitico> get followers;
  $GetPoliticFollowersSuccessCopyWith<GetPoliticFollowersSuccess> get copyWith;
}

abstract class $GetPoliticFollowersFailedCopyWith<$Res> {
  factory $GetPoliticFollowersFailedCopyWith(GetPoliticFollowersFailed value,
          $Res Function(GetPoliticFollowersFailed) then) =
      _$GetPoliticFollowersFailedCopyWithImpl<$Res>;
}

class _$GetPoliticFollowersFailedCopyWithImpl<$Res>
    extends _$PoliticFollowersStateCopyWithImpl<$Res>
    implements $GetPoliticFollowersFailedCopyWith<$Res> {
  _$GetPoliticFollowersFailedCopyWithImpl(GetPoliticFollowersFailed _value,
      $Res Function(GetPoliticFollowersFailed) _then)
      : super(_value, (v) => _then(v as GetPoliticFollowersFailed));

  @override
  GetPoliticFollowersFailed get _value =>
      super._value as GetPoliticFollowersFailed;
}

class _$GetPoliticFollowersFailed implements GetPoliticFollowersFailed {
  _$GetPoliticFollowersFailed();

  @override
  String toString() {
    return 'PoliticFollowersState.getPoliticFollowersFailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetPoliticFollowersFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result getPoliticFollowersSuccess(
            List<UsuarioSeguindoPolitico> followers),
    @required Result getPoliticFollowersFailed(),
    @required Result loadingPoliticFollowers(),
  }) {
    assert(initial != null);
    assert(getPoliticFollowersSuccess != null);
    assert(getPoliticFollowersFailed != null);
    assert(loadingPoliticFollowers != null);
    return getPoliticFollowersFailed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getPoliticFollowersSuccess(List<UsuarioSeguindoPolitico> followers),
    Result getPoliticFollowersFailed(),
    Result loadingPoliticFollowers(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPoliticFollowersFailed != null) {
      return getPoliticFollowersFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticFollowersState value),
    @required
        Result getPoliticFollowersSuccess(GetPoliticFollowersSuccess value),
    @required Result getPoliticFollowersFailed(GetPoliticFollowersFailed value),
    @required Result loadingPoliticFollowers(LoadingPoliticFollowers value),
  }) {
    assert(initial != null);
    assert(getPoliticFollowersSuccess != null);
    assert(getPoliticFollowersFailed != null);
    assert(loadingPoliticFollowers != null);
    return getPoliticFollowersFailed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticFollowersState value),
    Result getPoliticFollowersSuccess(GetPoliticFollowersSuccess value),
    Result getPoliticFollowersFailed(GetPoliticFollowersFailed value),
    Result loadingPoliticFollowers(LoadingPoliticFollowers value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPoliticFollowersFailed != null) {
      return getPoliticFollowersFailed(this);
    }
    return orElse();
  }
}

abstract class GetPoliticFollowersFailed implements PoliticFollowersState {
  factory GetPoliticFollowersFailed() = _$GetPoliticFollowersFailed;
}

abstract class $LoadingPoliticFollowersCopyWith<$Res> {
  factory $LoadingPoliticFollowersCopyWith(LoadingPoliticFollowers value,
          $Res Function(LoadingPoliticFollowers) then) =
      _$LoadingPoliticFollowersCopyWithImpl<$Res>;
}

class _$LoadingPoliticFollowersCopyWithImpl<$Res>
    extends _$PoliticFollowersStateCopyWithImpl<$Res>
    implements $LoadingPoliticFollowersCopyWith<$Res> {
  _$LoadingPoliticFollowersCopyWithImpl(LoadingPoliticFollowers _value,
      $Res Function(LoadingPoliticFollowers) _then)
      : super(_value, (v) => _then(v as LoadingPoliticFollowers));

  @override
  LoadingPoliticFollowers get _value => super._value as LoadingPoliticFollowers;
}

class _$LoadingPoliticFollowers implements LoadingPoliticFollowers {
  _$LoadingPoliticFollowers();

  @override
  String toString() {
    return 'PoliticFollowersState.loadingPoliticFollowers()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadingPoliticFollowers);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result getPoliticFollowersSuccess(
            List<UsuarioSeguindoPolitico> followers),
    @required Result getPoliticFollowersFailed(),
    @required Result loadingPoliticFollowers(),
  }) {
    assert(initial != null);
    assert(getPoliticFollowersSuccess != null);
    assert(getPoliticFollowersFailed != null);
    assert(loadingPoliticFollowers != null);
    return loadingPoliticFollowers();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getPoliticFollowersSuccess(List<UsuarioSeguindoPolitico> followers),
    Result getPoliticFollowersFailed(),
    Result loadingPoliticFollowers(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingPoliticFollowers != null) {
      return loadingPoliticFollowers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticFollowersState value),
    @required
        Result getPoliticFollowersSuccess(GetPoliticFollowersSuccess value),
    @required Result getPoliticFollowersFailed(GetPoliticFollowersFailed value),
    @required Result loadingPoliticFollowers(LoadingPoliticFollowers value),
  }) {
    assert(initial != null);
    assert(getPoliticFollowersSuccess != null);
    assert(getPoliticFollowersFailed != null);
    assert(loadingPoliticFollowers != null);
    return loadingPoliticFollowers(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticFollowersState value),
    Result getPoliticFollowersSuccess(GetPoliticFollowersSuccess value),
    Result getPoliticFollowersFailed(GetPoliticFollowersFailed value),
    Result loadingPoliticFollowers(LoadingPoliticFollowers value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingPoliticFollowers != null) {
      return loadingPoliticFollowers(this);
    }
    return orElse();
  }
}

abstract class LoadingPoliticFollowers implements PoliticFollowersState {
  factory LoadingPoliticFollowers() = _$LoadingPoliticFollowers;
}
