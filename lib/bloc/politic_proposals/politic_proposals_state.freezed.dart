// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'politic_proposals_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PoliticProposalsStateTearOff {
  const _$PoliticProposalsStateTearOff();

  InitialPoliticProposalsState initial() {
    return InitialPoliticProposalsState();
  }

  GetPoliticProposalsSuccess getPoliticProposalsSuccess(
      {List<PropostaModel> proposals}) {
    return GetPoliticProposalsSuccess(
      proposals: proposals,
    );
  }

  GetPoliticProposalsFailed getPoliticProposalsFailed() {
    return GetPoliticProposalsFailed();
  }

  LoadingPoliticProposals loadingPoliticProposals() {
    return LoadingPoliticProposals();
  }
}

// ignore: unused_element
const $PoliticProposalsState = _$PoliticProposalsStateTearOff();

mixin _$PoliticProposalsState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result getPoliticProposalsSuccess(List<PropostaModel> proposals),
    @required Result getPoliticProposalsFailed(),
    @required Result loadingPoliticProposals(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getPoliticProposalsSuccess(List<PropostaModel> proposals),
    Result getPoliticProposalsFailed(),
    Result loadingPoliticProposals(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticProposalsState value),
    @required
        Result getPoliticProposalsSuccess(GetPoliticProposalsSuccess value),
    @required Result getPoliticProposalsFailed(GetPoliticProposalsFailed value),
    @required Result loadingPoliticProposals(LoadingPoliticProposals value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticProposalsState value),
    Result getPoliticProposalsSuccess(GetPoliticProposalsSuccess value),
    Result getPoliticProposalsFailed(GetPoliticProposalsFailed value),
    Result loadingPoliticProposals(LoadingPoliticProposals value),
    @required Result orElse(),
  });
}

abstract class $PoliticProposalsStateCopyWith<$Res> {
  factory $PoliticProposalsStateCopyWith(PoliticProposalsState value,
          $Res Function(PoliticProposalsState) then) =
      _$PoliticProposalsStateCopyWithImpl<$Res>;
}

class _$PoliticProposalsStateCopyWithImpl<$Res>
    implements $PoliticProposalsStateCopyWith<$Res> {
  _$PoliticProposalsStateCopyWithImpl(this._value, this._then);

  final PoliticProposalsState _value;
  // ignore: unused_field
  final $Res Function(PoliticProposalsState) _then;
}

abstract class $InitialPoliticProposalsStateCopyWith<$Res> {
  factory $InitialPoliticProposalsStateCopyWith(
          InitialPoliticProposalsState value,
          $Res Function(InitialPoliticProposalsState) then) =
      _$InitialPoliticProposalsStateCopyWithImpl<$Res>;
}

class _$InitialPoliticProposalsStateCopyWithImpl<$Res>
    extends _$PoliticProposalsStateCopyWithImpl<$Res>
    implements $InitialPoliticProposalsStateCopyWith<$Res> {
  _$InitialPoliticProposalsStateCopyWithImpl(
      InitialPoliticProposalsState _value,
      $Res Function(InitialPoliticProposalsState) _then)
      : super(_value, (v) => _then(v as InitialPoliticProposalsState));

  @override
  InitialPoliticProposalsState get _value =>
      super._value as InitialPoliticProposalsState;
}

class _$InitialPoliticProposalsState implements InitialPoliticProposalsState {
  _$InitialPoliticProposalsState();

  @override
  String toString() {
    return 'PoliticProposalsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialPoliticProposalsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result getPoliticProposalsSuccess(List<PropostaModel> proposals),
    @required Result getPoliticProposalsFailed(),
    @required Result loadingPoliticProposals(),
  }) {
    assert(initial != null);
    assert(getPoliticProposalsSuccess != null);
    assert(getPoliticProposalsFailed != null);
    assert(loadingPoliticProposals != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getPoliticProposalsSuccess(List<PropostaModel> proposals),
    Result getPoliticProposalsFailed(),
    Result loadingPoliticProposals(),
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
    @required Result initial(InitialPoliticProposalsState value),
    @required
        Result getPoliticProposalsSuccess(GetPoliticProposalsSuccess value),
    @required Result getPoliticProposalsFailed(GetPoliticProposalsFailed value),
    @required Result loadingPoliticProposals(LoadingPoliticProposals value),
  }) {
    assert(initial != null);
    assert(getPoliticProposalsSuccess != null);
    assert(getPoliticProposalsFailed != null);
    assert(loadingPoliticProposals != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticProposalsState value),
    Result getPoliticProposalsSuccess(GetPoliticProposalsSuccess value),
    Result getPoliticProposalsFailed(GetPoliticProposalsFailed value),
    Result loadingPoliticProposals(LoadingPoliticProposals value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialPoliticProposalsState implements PoliticProposalsState {
  factory InitialPoliticProposalsState() = _$InitialPoliticProposalsState;
}

abstract class $GetPoliticProposalsSuccessCopyWith<$Res> {
  factory $GetPoliticProposalsSuccessCopyWith(GetPoliticProposalsSuccess value,
          $Res Function(GetPoliticProposalsSuccess) then) =
      _$GetPoliticProposalsSuccessCopyWithImpl<$Res>;
  $Res call({List<PropostaModel> proposals});
}

class _$GetPoliticProposalsSuccessCopyWithImpl<$Res>
    extends _$PoliticProposalsStateCopyWithImpl<$Res>
    implements $GetPoliticProposalsSuccessCopyWith<$Res> {
  _$GetPoliticProposalsSuccessCopyWithImpl(GetPoliticProposalsSuccess _value,
      $Res Function(GetPoliticProposalsSuccess) _then)
      : super(_value, (v) => _then(v as GetPoliticProposalsSuccess));

  @override
  GetPoliticProposalsSuccess get _value =>
      super._value as GetPoliticProposalsSuccess;

  @override
  $Res call({
    Object proposals = freezed,
  }) {
    return _then(GetPoliticProposalsSuccess(
      proposals: proposals == freezed
          ? _value.proposals
          : proposals as List<PropostaModel>,
    ));
  }
}

class _$GetPoliticProposalsSuccess implements GetPoliticProposalsSuccess {
  _$GetPoliticProposalsSuccess({this.proposals});

  @override
  final List<PropostaModel> proposals;

  @override
  String toString() {
    return 'PoliticProposalsState.getPoliticProposalsSuccess(proposals: $proposals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetPoliticProposalsSuccess &&
            (identical(other.proposals, proposals) ||
                const DeepCollectionEquality()
                    .equals(other.proposals, proposals)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(proposals);

  @override
  $GetPoliticProposalsSuccessCopyWith<GetPoliticProposalsSuccess>
      get copyWith =>
          _$GetPoliticProposalsSuccessCopyWithImpl<GetPoliticProposalsSuccess>(
              this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result getPoliticProposalsSuccess(List<PropostaModel> proposals),
    @required Result getPoliticProposalsFailed(),
    @required Result loadingPoliticProposals(),
  }) {
    assert(initial != null);
    assert(getPoliticProposalsSuccess != null);
    assert(getPoliticProposalsFailed != null);
    assert(loadingPoliticProposals != null);
    return getPoliticProposalsSuccess(proposals);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getPoliticProposalsSuccess(List<PropostaModel> proposals),
    Result getPoliticProposalsFailed(),
    Result loadingPoliticProposals(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPoliticProposalsSuccess != null) {
      return getPoliticProposalsSuccess(proposals);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticProposalsState value),
    @required
        Result getPoliticProposalsSuccess(GetPoliticProposalsSuccess value),
    @required Result getPoliticProposalsFailed(GetPoliticProposalsFailed value),
    @required Result loadingPoliticProposals(LoadingPoliticProposals value),
  }) {
    assert(initial != null);
    assert(getPoliticProposalsSuccess != null);
    assert(getPoliticProposalsFailed != null);
    assert(loadingPoliticProposals != null);
    return getPoliticProposalsSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticProposalsState value),
    Result getPoliticProposalsSuccess(GetPoliticProposalsSuccess value),
    Result getPoliticProposalsFailed(GetPoliticProposalsFailed value),
    Result loadingPoliticProposals(LoadingPoliticProposals value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPoliticProposalsSuccess != null) {
      return getPoliticProposalsSuccess(this);
    }
    return orElse();
  }
}

abstract class GetPoliticProposalsSuccess implements PoliticProposalsState {
  factory GetPoliticProposalsSuccess({List<PropostaModel> proposals}) =
      _$GetPoliticProposalsSuccess;

  List<PropostaModel> get proposals;
  $GetPoliticProposalsSuccessCopyWith<GetPoliticProposalsSuccess> get copyWith;
}

abstract class $GetPoliticProposalsFailedCopyWith<$Res> {
  factory $GetPoliticProposalsFailedCopyWith(GetPoliticProposalsFailed value,
          $Res Function(GetPoliticProposalsFailed) then) =
      _$GetPoliticProposalsFailedCopyWithImpl<$Res>;
}

class _$GetPoliticProposalsFailedCopyWithImpl<$Res>
    extends _$PoliticProposalsStateCopyWithImpl<$Res>
    implements $GetPoliticProposalsFailedCopyWith<$Res> {
  _$GetPoliticProposalsFailedCopyWithImpl(GetPoliticProposalsFailed _value,
      $Res Function(GetPoliticProposalsFailed) _then)
      : super(_value, (v) => _then(v as GetPoliticProposalsFailed));

  @override
  GetPoliticProposalsFailed get _value =>
      super._value as GetPoliticProposalsFailed;
}

class _$GetPoliticProposalsFailed implements GetPoliticProposalsFailed {
  _$GetPoliticProposalsFailed();

  @override
  String toString() {
    return 'PoliticProposalsState.getPoliticProposalsFailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetPoliticProposalsFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result getPoliticProposalsSuccess(List<PropostaModel> proposals),
    @required Result getPoliticProposalsFailed(),
    @required Result loadingPoliticProposals(),
  }) {
    assert(initial != null);
    assert(getPoliticProposalsSuccess != null);
    assert(getPoliticProposalsFailed != null);
    assert(loadingPoliticProposals != null);
    return getPoliticProposalsFailed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getPoliticProposalsSuccess(List<PropostaModel> proposals),
    Result getPoliticProposalsFailed(),
    Result loadingPoliticProposals(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPoliticProposalsFailed != null) {
      return getPoliticProposalsFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticProposalsState value),
    @required
        Result getPoliticProposalsSuccess(GetPoliticProposalsSuccess value),
    @required Result getPoliticProposalsFailed(GetPoliticProposalsFailed value),
    @required Result loadingPoliticProposals(LoadingPoliticProposals value),
  }) {
    assert(initial != null);
    assert(getPoliticProposalsSuccess != null);
    assert(getPoliticProposalsFailed != null);
    assert(loadingPoliticProposals != null);
    return getPoliticProposalsFailed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticProposalsState value),
    Result getPoliticProposalsSuccess(GetPoliticProposalsSuccess value),
    Result getPoliticProposalsFailed(GetPoliticProposalsFailed value),
    Result loadingPoliticProposals(LoadingPoliticProposals value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPoliticProposalsFailed != null) {
      return getPoliticProposalsFailed(this);
    }
    return orElse();
  }
}

abstract class GetPoliticProposalsFailed implements PoliticProposalsState {
  factory GetPoliticProposalsFailed() = _$GetPoliticProposalsFailed;
}

abstract class $LoadingPoliticProposalsCopyWith<$Res> {
  factory $LoadingPoliticProposalsCopyWith(LoadingPoliticProposals value,
          $Res Function(LoadingPoliticProposals) then) =
      _$LoadingPoliticProposalsCopyWithImpl<$Res>;
}

class _$LoadingPoliticProposalsCopyWithImpl<$Res>
    extends _$PoliticProposalsStateCopyWithImpl<$Res>
    implements $LoadingPoliticProposalsCopyWith<$Res> {
  _$LoadingPoliticProposalsCopyWithImpl(LoadingPoliticProposals _value,
      $Res Function(LoadingPoliticProposals) _then)
      : super(_value, (v) => _then(v as LoadingPoliticProposals));

  @override
  LoadingPoliticProposals get _value => super._value as LoadingPoliticProposals;
}

class _$LoadingPoliticProposals implements LoadingPoliticProposals {
  _$LoadingPoliticProposals();

  @override
  String toString() {
    return 'PoliticProposalsState.loadingPoliticProposals()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadingPoliticProposals);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result getPoliticProposalsSuccess(List<PropostaModel> proposals),
    @required Result getPoliticProposalsFailed(),
    @required Result loadingPoliticProposals(),
  }) {
    assert(initial != null);
    assert(getPoliticProposalsSuccess != null);
    assert(getPoliticProposalsFailed != null);
    assert(loadingPoliticProposals != null);
    return loadingPoliticProposals();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getPoliticProposalsSuccess(List<PropostaModel> proposals),
    Result getPoliticProposalsFailed(),
    Result loadingPoliticProposals(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingPoliticProposals != null) {
      return loadingPoliticProposals();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticProposalsState value),
    @required
        Result getPoliticProposalsSuccess(GetPoliticProposalsSuccess value),
    @required Result getPoliticProposalsFailed(GetPoliticProposalsFailed value),
    @required Result loadingPoliticProposals(LoadingPoliticProposals value),
  }) {
    assert(initial != null);
    assert(getPoliticProposalsSuccess != null);
    assert(getPoliticProposalsFailed != null);
    assert(loadingPoliticProposals != null);
    return loadingPoliticProposals(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticProposalsState value),
    Result getPoliticProposalsSuccess(GetPoliticProposalsSuccess value),
    Result getPoliticProposalsFailed(GetPoliticProposalsFailed value),
    Result loadingPoliticProposals(LoadingPoliticProposals value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingPoliticProposals != null) {
      return loadingPoliticProposals(this);
    }
    return orElse();
  }
}

abstract class LoadingPoliticProposals implements PoliticProposalsState {
  factory LoadingPoliticProposals() = _$LoadingPoliticProposals;
}
