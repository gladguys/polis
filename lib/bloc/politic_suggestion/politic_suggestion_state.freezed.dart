// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'politic_suggestion_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PoliticSuggestionStateTearOff {
  const _$PoliticSuggestionStateTearOff();

  InitialPoliticSuggestionState initial() {
    return InitialPoliticSuggestionState();
  }

  FetchSuggestedPoliticsSuccess fetchSuggestedPoliticsSuccess(
      List<PoliticoModel> politicos) {
    return FetchSuggestedPoliticsSuccess(
      politicos,
    );
  }

  FetchSuggestedPoliticsFailed fetchSuggestedPoliticsFailed() {
    return FetchSuggestedPoliticsFailed();
  }

  SavedSuggestedPolitics savedSuggestedPolitics() {
    return SavedSuggestedPolitics();
  }

  SaveSuggestedPoliticsFailed saveSuggestedPoliticsFailed() {
    return SaveSuggestedPoliticsFailed();
  }

  ChangedPoliticsFollowingStatus changedPoliticsFollowingStatus(
      PoliticoModel politico,
      {bool isFollowing}) {
    return ChangedPoliticsFollowingStatus(
      politico,
      isFollowing: isFollowing,
    );
  }

  LoadingFetch loadingFetch() {
    return LoadingFetch();
  }

  LoadingSaveFollowPolitics loadingSaveFollowPolitics() {
    return LoadingSaveFollowPolitics();
  }
}

// ignore: unused_element
const $PoliticSuggestionState = _$PoliticSuggestionStateTearOff();

mixin _$PoliticSuggestionState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result fetchSuggestedPoliticsSuccess(List<PoliticoModel> politicos),
    @required Result fetchSuggestedPoliticsFailed(),
    @required Result savedSuggestedPolitics(),
    @required Result saveSuggestedPoliticsFailed(),
    @required
        Result changedPoliticsFollowingStatus(
            PoliticoModel politico, bool isFollowing),
    @required Result loadingFetch(),
    @required Result loadingSaveFollowPolitics(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result fetchSuggestedPoliticsSuccess(List<PoliticoModel> politicos),
    Result fetchSuggestedPoliticsFailed(),
    Result savedSuggestedPolitics(),
    Result saveSuggestedPoliticsFailed(),
    Result changedPoliticsFollowingStatus(
        PoliticoModel politico, bool isFollowing),
    Result loadingFetch(),
    Result loadingSaveFollowPolitics(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticSuggestionState value),
    @required
        Result fetchSuggestedPoliticsSuccess(
            FetchSuggestedPoliticsSuccess value),
    @required
        Result fetchSuggestedPoliticsFailed(FetchSuggestedPoliticsFailed value),
    @required Result savedSuggestedPolitics(SavedSuggestedPolitics value),
    @required
        Result saveSuggestedPoliticsFailed(SaveSuggestedPoliticsFailed value),
    @required
        Result changedPoliticsFollowingStatus(
            ChangedPoliticsFollowingStatus value),
    @required Result loadingFetch(LoadingFetch value),
    @required Result loadingSaveFollowPolitics(LoadingSaveFollowPolitics value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticSuggestionState value),
    Result fetchSuggestedPoliticsSuccess(FetchSuggestedPoliticsSuccess value),
    Result fetchSuggestedPoliticsFailed(FetchSuggestedPoliticsFailed value),
    Result savedSuggestedPolitics(SavedSuggestedPolitics value),
    Result saveSuggestedPoliticsFailed(SaveSuggestedPoliticsFailed value),
    Result changedPoliticsFollowingStatus(ChangedPoliticsFollowingStatus value),
    Result loadingFetch(LoadingFetch value),
    Result loadingSaveFollowPolitics(LoadingSaveFollowPolitics value),
    @required Result orElse(),
  });
}

abstract class $PoliticSuggestionStateCopyWith<$Res> {
  factory $PoliticSuggestionStateCopyWith(PoliticSuggestionState value,
          $Res Function(PoliticSuggestionState) then) =
      _$PoliticSuggestionStateCopyWithImpl<$Res>;
}

class _$PoliticSuggestionStateCopyWithImpl<$Res>
    implements $PoliticSuggestionStateCopyWith<$Res> {
  _$PoliticSuggestionStateCopyWithImpl(this._value, this._then);

  final PoliticSuggestionState _value;
  // ignore: unused_field
  final $Res Function(PoliticSuggestionState) _then;
}

abstract class $InitialPoliticSuggestionStateCopyWith<$Res> {
  factory $InitialPoliticSuggestionStateCopyWith(
          InitialPoliticSuggestionState value,
          $Res Function(InitialPoliticSuggestionState) then) =
      _$InitialPoliticSuggestionStateCopyWithImpl<$Res>;
}

class _$InitialPoliticSuggestionStateCopyWithImpl<$Res>
    extends _$PoliticSuggestionStateCopyWithImpl<$Res>
    implements $InitialPoliticSuggestionStateCopyWith<$Res> {
  _$InitialPoliticSuggestionStateCopyWithImpl(
      InitialPoliticSuggestionState _value,
      $Res Function(InitialPoliticSuggestionState) _then)
      : super(_value, (v) => _then(v as InitialPoliticSuggestionState));

  @override
  InitialPoliticSuggestionState get _value =>
      super._value as InitialPoliticSuggestionState;
}

class _$InitialPoliticSuggestionState implements InitialPoliticSuggestionState {
  _$InitialPoliticSuggestionState();

  @override
  String toString() {
    return 'PoliticSuggestionState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialPoliticSuggestionState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result fetchSuggestedPoliticsSuccess(List<PoliticoModel> politicos),
    @required Result fetchSuggestedPoliticsFailed(),
    @required Result savedSuggestedPolitics(),
    @required Result saveSuggestedPoliticsFailed(),
    @required
        Result changedPoliticsFollowingStatus(
            PoliticoModel politico, bool isFollowing),
    @required Result loadingFetch(),
    @required Result loadingSaveFollowPolitics(),
  }) {
    assert(initial != null);
    assert(fetchSuggestedPoliticsSuccess != null);
    assert(fetchSuggestedPoliticsFailed != null);
    assert(savedSuggestedPolitics != null);
    assert(saveSuggestedPoliticsFailed != null);
    assert(changedPoliticsFollowingStatus != null);
    assert(loadingFetch != null);
    assert(loadingSaveFollowPolitics != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result fetchSuggestedPoliticsSuccess(List<PoliticoModel> politicos),
    Result fetchSuggestedPoliticsFailed(),
    Result savedSuggestedPolitics(),
    Result saveSuggestedPoliticsFailed(),
    Result changedPoliticsFollowingStatus(
        PoliticoModel politico, bool isFollowing),
    Result loadingFetch(),
    Result loadingSaveFollowPolitics(),
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
    @required Result initial(InitialPoliticSuggestionState value),
    @required
        Result fetchSuggestedPoliticsSuccess(
            FetchSuggestedPoliticsSuccess value),
    @required
        Result fetchSuggestedPoliticsFailed(FetchSuggestedPoliticsFailed value),
    @required Result savedSuggestedPolitics(SavedSuggestedPolitics value),
    @required
        Result saveSuggestedPoliticsFailed(SaveSuggestedPoliticsFailed value),
    @required
        Result changedPoliticsFollowingStatus(
            ChangedPoliticsFollowingStatus value),
    @required Result loadingFetch(LoadingFetch value),
    @required Result loadingSaveFollowPolitics(LoadingSaveFollowPolitics value),
  }) {
    assert(initial != null);
    assert(fetchSuggestedPoliticsSuccess != null);
    assert(fetchSuggestedPoliticsFailed != null);
    assert(savedSuggestedPolitics != null);
    assert(saveSuggestedPoliticsFailed != null);
    assert(changedPoliticsFollowingStatus != null);
    assert(loadingFetch != null);
    assert(loadingSaveFollowPolitics != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticSuggestionState value),
    Result fetchSuggestedPoliticsSuccess(FetchSuggestedPoliticsSuccess value),
    Result fetchSuggestedPoliticsFailed(FetchSuggestedPoliticsFailed value),
    Result savedSuggestedPolitics(SavedSuggestedPolitics value),
    Result saveSuggestedPoliticsFailed(SaveSuggestedPoliticsFailed value),
    Result changedPoliticsFollowingStatus(ChangedPoliticsFollowingStatus value),
    Result loadingFetch(LoadingFetch value),
    Result loadingSaveFollowPolitics(LoadingSaveFollowPolitics value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialPoliticSuggestionState implements PoliticSuggestionState {
  factory InitialPoliticSuggestionState() = _$InitialPoliticSuggestionState;
}

abstract class $FetchSuggestedPoliticsSuccessCopyWith<$Res> {
  factory $FetchSuggestedPoliticsSuccessCopyWith(
          FetchSuggestedPoliticsSuccess value,
          $Res Function(FetchSuggestedPoliticsSuccess) then) =
      _$FetchSuggestedPoliticsSuccessCopyWithImpl<$Res>;
  $Res call({List<PoliticoModel> politicos});
}

class _$FetchSuggestedPoliticsSuccessCopyWithImpl<$Res>
    extends _$PoliticSuggestionStateCopyWithImpl<$Res>
    implements $FetchSuggestedPoliticsSuccessCopyWith<$Res> {
  _$FetchSuggestedPoliticsSuccessCopyWithImpl(
      FetchSuggestedPoliticsSuccess _value,
      $Res Function(FetchSuggestedPoliticsSuccess) _then)
      : super(_value, (v) => _then(v as FetchSuggestedPoliticsSuccess));

  @override
  FetchSuggestedPoliticsSuccess get _value =>
      super._value as FetchSuggestedPoliticsSuccess;

  @override
  $Res call({
    Object politicos = freezed,
  }) {
    return _then(FetchSuggestedPoliticsSuccess(
      politicos == freezed
          ? _value.politicos
          : politicos as List<PoliticoModel>,
    ));
  }
}

class _$FetchSuggestedPoliticsSuccess implements FetchSuggestedPoliticsSuccess {
  _$FetchSuggestedPoliticsSuccess(this.politicos) : assert(politicos != null);

  @override
  final List<PoliticoModel> politicos;

  @override
  String toString() {
    return 'PoliticSuggestionState.fetchSuggestedPoliticsSuccess(politicos: $politicos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FetchSuggestedPoliticsSuccess &&
            (identical(other.politicos, politicos) ||
                const DeepCollectionEquality()
                    .equals(other.politicos, politicos)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(politicos);

  @override
  $FetchSuggestedPoliticsSuccessCopyWith<FetchSuggestedPoliticsSuccess>
      get copyWith => _$FetchSuggestedPoliticsSuccessCopyWithImpl<
          FetchSuggestedPoliticsSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result fetchSuggestedPoliticsSuccess(List<PoliticoModel> politicos),
    @required Result fetchSuggestedPoliticsFailed(),
    @required Result savedSuggestedPolitics(),
    @required Result saveSuggestedPoliticsFailed(),
    @required
        Result changedPoliticsFollowingStatus(
            PoliticoModel politico, bool isFollowing),
    @required Result loadingFetch(),
    @required Result loadingSaveFollowPolitics(),
  }) {
    assert(initial != null);
    assert(fetchSuggestedPoliticsSuccess != null);
    assert(fetchSuggestedPoliticsFailed != null);
    assert(savedSuggestedPolitics != null);
    assert(saveSuggestedPoliticsFailed != null);
    assert(changedPoliticsFollowingStatus != null);
    assert(loadingFetch != null);
    assert(loadingSaveFollowPolitics != null);
    return fetchSuggestedPoliticsSuccess(politicos);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result fetchSuggestedPoliticsSuccess(List<PoliticoModel> politicos),
    Result fetchSuggestedPoliticsFailed(),
    Result savedSuggestedPolitics(),
    Result saveSuggestedPoliticsFailed(),
    Result changedPoliticsFollowingStatus(
        PoliticoModel politico, bool isFollowing),
    Result loadingFetch(),
    Result loadingSaveFollowPolitics(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchSuggestedPoliticsSuccess != null) {
      return fetchSuggestedPoliticsSuccess(politicos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticSuggestionState value),
    @required
        Result fetchSuggestedPoliticsSuccess(
            FetchSuggestedPoliticsSuccess value),
    @required
        Result fetchSuggestedPoliticsFailed(FetchSuggestedPoliticsFailed value),
    @required Result savedSuggestedPolitics(SavedSuggestedPolitics value),
    @required
        Result saveSuggestedPoliticsFailed(SaveSuggestedPoliticsFailed value),
    @required
        Result changedPoliticsFollowingStatus(
            ChangedPoliticsFollowingStatus value),
    @required Result loadingFetch(LoadingFetch value),
    @required Result loadingSaveFollowPolitics(LoadingSaveFollowPolitics value),
  }) {
    assert(initial != null);
    assert(fetchSuggestedPoliticsSuccess != null);
    assert(fetchSuggestedPoliticsFailed != null);
    assert(savedSuggestedPolitics != null);
    assert(saveSuggestedPoliticsFailed != null);
    assert(changedPoliticsFollowingStatus != null);
    assert(loadingFetch != null);
    assert(loadingSaveFollowPolitics != null);
    return fetchSuggestedPoliticsSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticSuggestionState value),
    Result fetchSuggestedPoliticsSuccess(FetchSuggestedPoliticsSuccess value),
    Result fetchSuggestedPoliticsFailed(FetchSuggestedPoliticsFailed value),
    Result savedSuggestedPolitics(SavedSuggestedPolitics value),
    Result saveSuggestedPoliticsFailed(SaveSuggestedPoliticsFailed value),
    Result changedPoliticsFollowingStatus(ChangedPoliticsFollowingStatus value),
    Result loadingFetch(LoadingFetch value),
    Result loadingSaveFollowPolitics(LoadingSaveFollowPolitics value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchSuggestedPoliticsSuccess != null) {
      return fetchSuggestedPoliticsSuccess(this);
    }
    return orElse();
  }
}

abstract class FetchSuggestedPoliticsSuccess implements PoliticSuggestionState {
  factory FetchSuggestedPoliticsSuccess(List<PoliticoModel> politicos) =
      _$FetchSuggestedPoliticsSuccess;

  List<PoliticoModel> get politicos;
  $FetchSuggestedPoliticsSuccessCopyWith<FetchSuggestedPoliticsSuccess>
      get copyWith;
}

abstract class $FetchSuggestedPoliticsFailedCopyWith<$Res> {
  factory $FetchSuggestedPoliticsFailedCopyWith(
          FetchSuggestedPoliticsFailed value,
          $Res Function(FetchSuggestedPoliticsFailed) then) =
      _$FetchSuggestedPoliticsFailedCopyWithImpl<$Res>;
}

class _$FetchSuggestedPoliticsFailedCopyWithImpl<$Res>
    extends _$PoliticSuggestionStateCopyWithImpl<$Res>
    implements $FetchSuggestedPoliticsFailedCopyWith<$Res> {
  _$FetchSuggestedPoliticsFailedCopyWithImpl(
      FetchSuggestedPoliticsFailed _value,
      $Res Function(FetchSuggestedPoliticsFailed) _then)
      : super(_value, (v) => _then(v as FetchSuggestedPoliticsFailed));

  @override
  FetchSuggestedPoliticsFailed get _value =>
      super._value as FetchSuggestedPoliticsFailed;
}

class _$FetchSuggestedPoliticsFailed implements FetchSuggestedPoliticsFailed {
  _$FetchSuggestedPoliticsFailed();

  @override
  String toString() {
    return 'PoliticSuggestionState.fetchSuggestedPoliticsFailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FetchSuggestedPoliticsFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result fetchSuggestedPoliticsSuccess(List<PoliticoModel> politicos),
    @required Result fetchSuggestedPoliticsFailed(),
    @required Result savedSuggestedPolitics(),
    @required Result saveSuggestedPoliticsFailed(),
    @required
        Result changedPoliticsFollowingStatus(
            PoliticoModel politico, bool isFollowing),
    @required Result loadingFetch(),
    @required Result loadingSaveFollowPolitics(),
  }) {
    assert(initial != null);
    assert(fetchSuggestedPoliticsSuccess != null);
    assert(fetchSuggestedPoliticsFailed != null);
    assert(savedSuggestedPolitics != null);
    assert(saveSuggestedPoliticsFailed != null);
    assert(changedPoliticsFollowingStatus != null);
    assert(loadingFetch != null);
    assert(loadingSaveFollowPolitics != null);
    return fetchSuggestedPoliticsFailed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result fetchSuggestedPoliticsSuccess(List<PoliticoModel> politicos),
    Result fetchSuggestedPoliticsFailed(),
    Result savedSuggestedPolitics(),
    Result saveSuggestedPoliticsFailed(),
    Result changedPoliticsFollowingStatus(
        PoliticoModel politico, bool isFollowing),
    Result loadingFetch(),
    Result loadingSaveFollowPolitics(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchSuggestedPoliticsFailed != null) {
      return fetchSuggestedPoliticsFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticSuggestionState value),
    @required
        Result fetchSuggestedPoliticsSuccess(
            FetchSuggestedPoliticsSuccess value),
    @required
        Result fetchSuggestedPoliticsFailed(FetchSuggestedPoliticsFailed value),
    @required Result savedSuggestedPolitics(SavedSuggestedPolitics value),
    @required
        Result saveSuggestedPoliticsFailed(SaveSuggestedPoliticsFailed value),
    @required
        Result changedPoliticsFollowingStatus(
            ChangedPoliticsFollowingStatus value),
    @required Result loadingFetch(LoadingFetch value),
    @required Result loadingSaveFollowPolitics(LoadingSaveFollowPolitics value),
  }) {
    assert(initial != null);
    assert(fetchSuggestedPoliticsSuccess != null);
    assert(fetchSuggestedPoliticsFailed != null);
    assert(savedSuggestedPolitics != null);
    assert(saveSuggestedPoliticsFailed != null);
    assert(changedPoliticsFollowingStatus != null);
    assert(loadingFetch != null);
    assert(loadingSaveFollowPolitics != null);
    return fetchSuggestedPoliticsFailed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticSuggestionState value),
    Result fetchSuggestedPoliticsSuccess(FetchSuggestedPoliticsSuccess value),
    Result fetchSuggestedPoliticsFailed(FetchSuggestedPoliticsFailed value),
    Result savedSuggestedPolitics(SavedSuggestedPolitics value),
    Result saveSuggestedPoliticsFailed(SaveSuggestedPoliticsFailed value),
    Result changedPoliticsFollowingStatus(ChangedPoliticsFollowingStatus value),
    Result loadingFetch(LoadingFetch value),
    Result loadingSaveFollowPolitics(LoadingSaveFollowPolitics value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchSuggestedPoliticsFailed != null) {
      return fetchSuggestedPoliticsFailed(this);
    }
    return orElse();
  }
}

abstract class FetchSuggestedPoliticsFailed implements PoliticSuggestionState {
  factory FetchSuggestedPoliticsFailed() = _$FetchSuggestedPoliticsFailed;
}

abstract class $SavedSuggestedPoliticsCopyWith<$Res> {
  factory $SavedSuggestedPoliticsCopyWith(SavedSuggestedPolitics value,
          $Res Function(SavedSuggestedPolitics) then) =
      _$SavedSuggestedPoliticsCopyWithImpl<$Res>;
}

class _$SavedSuggestedPoliticsCopyWithImpl<$Res>
    extends _$PoliticSuggestionStateCopyWithImpl<$Res>
    implements $SavedSuggestedPoliticsCopyWith<$Res> {
  _$SavedSuggestedPoliticsCopyWithImpl(SavedSuggestedPolitics _value,
      $Res Function(SavedSuggestedPolitics) _then)
      : super(_value, (v) => _then(v as SavedSuggestedPolitics));

  @override
  SavedSuggestedPolitics get _value => super._value as SavedSuggestedPolitics;
}

class _$SavedSuggestedPolitics implements SavedSuggestedPolitics {
  _$SavedSuggestedPolitics();

  @override
  String toString() {
    return 'PoliticSuggestionState.savedSuggestedPolitics()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SavedSuggestedPolitics);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result fetchSuggestedPoliticsSuccess(List<PoliticoModel> politicos),
    @required Result fetchSuggestedPoliticsFailed(),
    @required Result savedSuggestedPolitics(),
    @required Result saveSuggestedPoliticsFailed(),
    @required
        Result changedPoliticsFollowingStatus(
            PoliticoModel politico, bool isFollowing),
    @required Result loadingFetch(),
    @required Result loadingSaveFollowPolitics(),
  }) {
    assert(initial != null);
    assert(fetchSuggestedPoliticsSuccess != null);
    assert(fetchSuggestedPoliticsFailed != null);
    assert(savedSuggestedPolitics != null);
    assert(saveSuggestedPoliticsFailed != null);
    assert(changedPoliticsFollowingStatus != null);
    assert(loadingFetch != null);
    assert(loadingSaveFollowPolitics != null);
    return savedSuggestedPolitics();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result fetchSuggestedPoliticsSuccess(List<PoliticoModel> politicos),
    Result fetchSuggestedPoliticsFailed(),
    Result savedSuggestedPolitics(),
    Result saveSuggestedPoliticsFailed(),
    Result changedPoliticsFollowingStatus(
        PoliticoModel politico, bool isFollowing),
    Result loadingFetch(),
    Result loadingSaveFollowPolitics(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (savedSuggestedPolitics != null) {
      return savedSuggestedPolitics();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticSuggestionState value),
    @required
        Result fetchSuggestedPoliticsSuccess(
            FetchSuggestedPoliticsSuccess value),
    @required
        Result fetchSuggestedPoliticsFailed(FetchSuggestedPoliticsFailed value),
    @required Result savedSuggestedPolitics(SavedSuggestedPolitics value),
    @required
        Result saveSuggestedPoliticsFailed(SaveSuggestedPoliticsFailed value),
    @required
        Result changedPoliticsFollowingStatus(
            ChangedPoliticsFollowingStatus value),
    @required Result loadingFetch(LoadingFetch value),
    @required Result loadingSaveFollowPolitics(LoadingSaveFollowPolitics value),
  }) {
    assert(initial != null);
    assert(fetchSuggestedPoliticsSuccess != null);
    assert(fetchSuggestedPoliticsFailed != null);
    assert(savedSuggestedPolitics != null);
    assert(saveSuggestedPoliticsFailed != null);
    assert(changedPoliticsFollowingStatus != null);
    assert(loadingFetch != null);
    assert(loadingSaveFollowPolitics != null);
    return savedSuggestedPolitics(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticSuggestionState value),
    Result fetchSuggestedPoliticsSuccess(FetchSuggestedPoliticsSuccess value),
    Result fetchSuggestedPoliticsFailed(FetchSuggestedPoliticsFailed value),
    Result savedSuggestedPolitics(SavedSuggestedPolitics value),
    Result saveSuggestedPoliticsFailed(SaveSuggestedPoliticsFailed value),
    Result changedPoliticsFollowingStatus(ChangedPoliticsFollowingStatus value),
    Result loadingFetch(LoadingFetch value),
    Result loadingSaveFollowPolitics(LoadingSaveFollowPolitics value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (savedSuggestedPolitics != null) {
      return savedSuggestedPolitics(this);
    }
    return orElse();
  }
}

abstract class SavedSuggestedPolitics implements PoliticSuggestionState {
  factory SavedSuggestedPolitics() = _$SavedSuggestedPolitics;
}

abstract class $SaveSuggestedPoliticsFailedCopyWith<$Res> {
  factory $SaveSuggestedPoliticsFailedCopyWith(
          SaveSuggestedPoliticsFailed value,
          $Res Function(SaveSuggestedPoliticsFailed) then) =
      _$SaveSuggestedPoliticsFailedCopyWithImpl<$Res>;
}

class _$SaveSuggestedPoliticsFailedCopyWithImpl<$Res>
    extends _$PoliticSuggestionStateCopyWithImpl<$Res>
    implements $SaveSuggestedPoliticsFailedCopyWith<$Res> {
  _$SaveSuggestedPoliticsFailedCopyWithImpl(SaveSuggestedPoliticsFailed _value,
      $Res Function(SaveSuggestedPoliticsFailed) _then)
      : super(_value, (v) => _then(v as SaveSuggestedPoliticsFailed));

  @override
  SaveSuggestedPoliticsFailed get _value =>
      super._value as SaveSuggestedPoliticsFailed;
}

class _$SaveSuggestedPoliticsFailed implements SaveSuggestedPoliticsFailed {
  _$SaveSuggestedPoliticsFailed();

  @override
  String toString() {
    return 'PoliticSuggestionState.saveSuggestedPoliticsFailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SaveSuggestedPoliticsFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result fetchSuggestedPoliticsSuccess(List<PoliticoModel> politicos),
    @required Result fetchSuggestedPoliticsFailed(),
    @required Result savedSuggestedPolitics(),
    @required Result saveSuggestedPoliticsFailed(),
    @required
        Result changedPoliticsFollowingStatus(
            PoliticoModel politico, bool isFollowing),
    @required Result loadingFetch(),
    @required Result loadingSaveFollowPolitics(),
  }) {
    assert(initial != null);
    assert(fetchSuggestedPoliticsSuccess != null);
    assert(fetchSuggestedPoliticsFailed != null);
    assert(savedSuggestedPolitics != null);
    assert(saveSuggestedPoliticsFailed != null);
    assert(changedPoliticsFollowingStatus != null);
    assert(loadingFetch != null);
    assert(loadingSaveFollowPolitics != null);
    return saveSuggestedPoliticsFailed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result fetchSuggestedPoliticsSuccess(List<PoliticoModel> politicos),
    Result fetchSuggestedPoliticsFailed(),
    Result savedSuggestedPolitics(),
    Result saveSuggestedPoliticsFailed(),
    Result changedPoliticsFollowingStatus(
        PoliticoModel politico, bool isFollowing),
    Result loadingFetch(),
    Result loadingSaveFollowPolitics(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (saveSuggestedPoliticsFailed != null) {
      return saveSuggestedPoliticsFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticSuggestionState value),
    @required
        Result fetchSuggestedPoliticsSuccess(
            FetchSuggestedPoliticsSuccess value),
    @required
        Result fetchSuggestedPoliticsFailed(FetchSuggestedPoliticsFailed value),
    @required Result savedSuggestedPolitics(SavedSuggestedPolitics value),
    @required
        Result saveSuggestedPoliticsFailed(SaveSuggestedPoliticsFailed value),
    @required
        Result changedPoliticsFollowingStatus(
            ChangedPoliticsFollowingStatus value),
    @required Result loadingFetch(LoadingFetch value),
    @required Result loadingSaveFollowPolitics(LoadingSaveFollowPolitics value),
  }) {
    assert(initial != null);
    assert(fetchSuggestedPoliticsSuccess != null);
    assert(fetchSuggestedPoliticsFailed != null);
    assert(savedSuggestedPolitics != null);
    assert(saveSuggestedPoliticsFailed != null);
    assert(changedPoliticsFollowingStatus != null);
    assert(loadingFetch != null);
    assert(loadingSaveFollowPolitics != null);
    return saveSuggestedPoliticsFailed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticSuggestionState value),
    Result fetchSuggestedPoliticsSuccess(FetchSuggestedPoliticsSuccess value),
    Result fetchSuggestedPoliticsFailed(FetchSuggestedPoliticsFailed value),
    Result savedSuggestedPolitics(SavedSuggestedPolitics value),
    Result saveSuggestedPoliticsFailed(SaveSuggestedPoliticsFailed value),
    Result changedPoliticsFollowingStatus(ChangedPoliticsFollowingStatus value),
    Result loadingFetch(LoadingFetch value),
    Result loadingSaveFollowPolitics(LoadingSaveFollowPolitics value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (saveSuggestedPoliticsFailed != null) {
      return saveSuggestedPoliticsFailed(this);
    }
    return orElse();
  }
}

abstract class SaveSuggestedPoliticsFailed implements PoliticSuggestionState {
  factory SaveSuggestedPoliticsFailed() = _$SaveSuggestedPoliticsFailed;
}

abstract class $ChangedPoliticsFollowingStatusCopyWith<$Res> {
  factory $ChangedPoliticsFollowingStatusCopyWith(
          ChangedPoliticsFollowingStatus value,
          $Res Function(ChangedPoliticsFollowingStatus) then) =
      _$ChangedPoliticsFollowingStatusCopyWithImpl<$Res>;
  $Res call({PoliticoModel politico, bool isFollowing});
}

class _$ChangedPoliticsFollowingStatusCopyWithImpl<$Res>
    extends _$PoliticSuggestionStateCopyWithImpl<$Res>
    implements $ChangedPoliticsFollowingStatusCopyWith<$Res> {
  _$ChangedPoliticsFollowingStatusCopyWithImpl(
      ChangedPoliticsFollowingStatus _value,
      $Res Function(ChangedPoliticsFollowingStatus) _then)
      : super(_value, (v) => _then(v as ChangedPoliticsFollowingStatus));

  @override
  ChangedPoliticsFollowingStatus get _value =>
      super._value as ChangedPoliticsFollowingStatus;

  @override
  $Res call({
    Object politico = freezed,
    Object isFollowing = freezed,
  }) {
    return _then(ChangedPoliticsFollowingStatus(
      politico == freezed ? _value.politico : politico as PoliticoModel,
      isFollowing:
          isFollowing == freezed ? _value.isFollowing : isFollowing as bool,
    ));
  }
}

class _$ChangedPoliticsFollowingStatus
    implements ChangedPoliticsFollowingStatus {
  _$ChangedPoliticsFollowingStatus(this.politico, {this.isFollowing})
      : assert(politico != null);

  @override
  final PoliticoModel politico;
  @override
  final bool isFollowing;

  @override
  String toString() {
    return 'PoliticSuggestionState.changedPoliticsFollowingStatus(politico: $politico, isFollowing: $isFollowing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangedPoliticsFollowingStatus &&
            (identical(other.politico, politico) ||
                const DeepCollectionEquality()
                    .equals(other.politico, politico)) &&
            (identical(other.isFollowing, isFollowing) ||
                const DeepCollectionEquality()
                    .equals(other.isFollowing, isFollowing)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(politico) ^
      const DeepCollectionEquality().hash(isFollowing);

  @override
  $ChangedPoliticsFollowingStatusCopyWith<ChangedPoliticsFollowingStatus>
      get copyWith => _$ChangedPoliticsFollowingStatusCopyWithImpl<
          ChangedPoliticsFollowingStatus>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result fetchSuggestedPoliticsSuccess(List<PoliticoModel> politicos),
    @required Result fetchSuggestedPoliticsFailed(),
    @required Result savedSuggestedPolitics(),
    @required Result saveSuggestedPoliticsFailed(),
    @required
        Result changedPoliticsFollowingStatus(
            PoliticoModel politico, bool isFollowing),
    @required Result loadingFetch(),
    @required Result loadingSaveFollowPolitics(),
  }) {
    assert(initial != null);
    assert(fetchSuggestedPoliticsSuccess != null);
    assert(fetchSuggestedPoliticsFailed != null);
    assert(savedSuggestedPolitics != null);
    assert(saveSuggestedPoliticsFailed != null);
    assert(changedPoliticsFollowingStatus != null);
    assert(loadingFetch != null);
    assert(loadingSaveFollowPolitics != null);
    return changedPoliticsFollowingStatus(politico, isFollowing);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result fetchSuggestedPoliticsSuccess(List<PoliticoModel> politicos),
    Result fetchSuggestedPoliticsFailed(),
    Result savedSuggestedPolitics(),
    Result saveSuggestedPoliticsFailed(),
    Result changedPoliticsFollowingStatus(
        PoliticoModel politico, bool isFollowing),
    Result loadingFetch(),
    Result loadingSaveFollowPolitics(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changedPoliticsFollowingStatus != null) {
      return changedPoliticsFollowingStatus(politico, isFollowing);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticSuggestionState value),
    @required
        Result fetchSuggestedPoliticsSuccess(
            FetchSuggestedPoliticsSuccess value),
    @required
        Result fetchSuggestedPoliticsFailed(FetchSuggestedPoliticsFailed value),
    @required Result savedSuggestedPolitics(SavedSuggestedPolitics value),
    @required
        Result saveSuggestedPoliticsFailed(SaveSuggestedPoliticsFailed value),
    @required
        Result changedPoliticsFollowingStatus(
            ChangedPoliticsFollowingStatus value),
    @required Result loadingFetch(LoadingFetch value),
    @required Result loadingSaveFollowPolitics(LoadingSaveFollowPolitics value),
  }) {
    assert(initial != null);
    assert(fetchSuggestedPoliticsSuccess != null);
    assert(fetchSuggestedPoliticsFailed != null);
    assert(savedSuggestedPolitics != null);
    assert(saveSuggestedPoliticsFailed != null);
    assert(changedPoliticsFollowingStatus != null);
    assert(loadingFetch != null);
    assert(loadingSaveFollowPolitics != null);
    return changedPoliticsFollowingStatus(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticSuggestionState value),
    Result fetchSuggestedPoliticsSuccess(FetchSuggestedPoliticsSuccess value),
    Result fetchSuggestedPoliticsFailed(FetchSuggestedPoliticsFailed value),
    Result savedSuggestedPolitics(SavedSuggestedPolitics value),
    Result saveSuggestedPoliticsFailed(SaveSuggestedPoliticsFailed value),
    Result changedPoliticsFollowingStatus(ChangedPoliticsFollowingStatus value),
    Result loadingFetch(LoadingFetch value),
    Result loadingSaveFollowPolitics(LoadingSaveFollowPolitics value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changedPoliticsFollowingStatus != null) {
      return changedPoliticsFollowingStatus(this);
    }
    return orElse();
  }
}

abstract class ChangedPoliticsFollowingStatus
    implements PoliticSuggestionState {
  factory ChangedPoliticsFollowingStatus(PoliticoModel politico,
      {bool isFollowing}) = _$ChangedPoliticsFollowingStatus;

  PoliticoModel get politico;
  bool get isFollowing;
  $ChangedPoliticsFollowingStatusCopyWith<ChangedPoliticsFollowingStatus>
      get copyWith;
}

abstract class $LoadingFetchCopyWith<$Res> {
  factory $LoadingFetchCopyWith(
          LoadingFetch value, $Res Function(LoadingFetch) then) =
      _$LoadingFetchCopyWithImpl<$Res>;
}

class _$LoadingFetchCopyWithImpl<$Res>
    extends _$PoliticSuggestionStateCopyWithImpl<$Res>
    implements $LoadingFetchCopyWith<$Res> {
  _$LoadingFetchCopyWithImpl(
      LoadingFetch _value, $Res Function(LoadingFetch) _then)
      : super(_value, (v) => _then(v as LoadingFetch));

  @override
  LoadingFetch get _value => super._value as LoadingFetch;
}

class _$LoadingFetch implements LoadingFetch {
  _$LoadingFetch();

  @override
  String toString() {
    return 'PoliticSuggestionState.loadingFetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadingFetch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result fetchSuggestedPoliticsSuccess(List<PoliticoModel> politicos),
    @required Result fetchSuggestedPoliticsFailed(),
    @required Result savedSuggestedPolitics(),
    @required Result saveSuggestedPoliticsFailed(),
    @required
        Result changedPoliticsFollowingStatus(
            PoliticoModel politico, bool isFollowing),
    @required Result loadingFetch(),
    @required Result loadingSaveFollowPolitics(),
  }) {
    assert(initial != null);
    assert(fetchSuggestedPoliticsSuccess != null);
    assert(fetchSuggestedPoliticsFailed != null);
    assert(savedSuggestedPolitics != null);
    assert(saveSuggestedPoliticsFailed != null);
    assert(changedPoliticsFollowingStatus != null);
    assert(loadingFetch != null);
    assert(loadingSaveFollowPolitics != null);
    return loadingFetch();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result fetchSuggestedPoliticsSuccess(List<PoliticoModel> politicos),
    Result fetchSuggestedPoliticsFailed(),
    Result savedSuggestedPolitics(),
    Result saveSuggestedPoliticsFailed(),
    Result changedPoliticsFollowingStatus(
        PoliticoModel politico, bool isFollowing),
    Result loadingFetch(),
    Result loadingSaveFollowPolitics(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingFetch != null) {
      return loadingFetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticSuggestionState value),
    @required
        Result fetchSuggestedPoliticsSuccess(
            FetchSuggestedPoliticsSuccess value),
    @required
        Result fetchSuggestedPoliticsFailed(FetchSuggestedPoliticsFailed value),
    @required Result savedSuggestedPolitics(SavedSuggestedPolitics value),
    @required
        Result saveSuggestedPoliticsFailed(SaveSuggestedPoliticsFailed value),
    @required
        Result changedPoliticsFollowingStatus(
            ChangedPoliticsFollowingStatus value),
    @required Result loadingFetch(LoadingFetch value),
    @required Result loadingSaveFollowPolitics(LoadingSaveFollowPolitics value),
  }) {
    assert(initial != null);
    assert(fetchSuggestedPoliticsSuccess != null);
    assert(fetchSuggestedPoliticsFailed != null);
    assert(savedSuggestedPolitics != null);
    assert(saveSuggestedPoliticsFailed != null);
    assert(changedPoliticsFollowingStatus != null);
    assert(loadingFetch != null);
    assert(loadingSaveFollowPolitics != null);
    return loadingFetch(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticSuggestionState value),
    Result fetchSuggestedPoliticsSuccess(FetchSuggestedPoliticsSuccess value),
    Result fetchSuggestedPoliticsFailed(FetchSuggestedPoliticsFailed value),
    Result savedSuggestedPolitics(SavedSuggestedPolitics value),
    Result saveSuggestedPoliticsFailed(SaveSuggestedPoliticsFailed value),
    Result changedPoliticsFollowingStatus(ChangedPoliticsFollowingStatus value),
    Result loadingFetch(LoadingFetch value),
    Result loadingSaveFollowPolitics(LoadingSaveFollowPolitics value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingFetch != null) {
      return loadingFetch(this);
    }
    return orElse();
  }
}

abstract class LoadingFetch implements PoliticSuggestionState {
  factory LoadingFetch() = _$LoadingFetch;
}

abstract class $LoadingSaveFollowPoliticsCopyWith<$Res> {
  factory $LoadingSaveFollowPoliticsCopyWith(LoadingSaveFollowPolitics value,
          $Res Function(LoadingSaveFollowPolitics) then) =
      _$LoadingSaveFollowPoliticsCopyWithImpl<$Res>;
}

class _$LoadingSaveFollowPoliticsCopyWithImpl<$Res>
    extends _$PoliticSuggestionStateCopyWithImpl<$Res>
    implements $LoadingSaveFollowPoliticsCopyWith<$Res> {
  _$LoadingSaveFollowPoliticsCopyWithImpl(LoadingSaveFollowPolitics _value,
      $Res Function(LoadingSaveFollowPolitics) _then)
      : super(_value, (v) => _then(v as LoadingSaveFollowPolitics));

  @override
  LoadingSaveFollowPolitics get _value =>
      super._value as LoadingSaveFollowPolitics;
}

class _$LoadingSaveFollowPolitics implements LoadingSaveFollowPolitics {
  _$LoadingSaveFollowPolitics();

  @override
  String toString() {
    return 'PoliticSuggestionState.loadingSaveFollowPolitics()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadingSaveFollowPolitics);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result fetchSuggestedPoliticsSuccess(List<PoliticoModel> politicos),
    @required Result fetchSuggestedPoliticsFailed(),
    @required Result savedSuggestedPolitics(),
    @required Result saveSuggestedPoliticsFailed(),
    @required
        Result changedPoliticsFollowingStatus(
            PoliticoModel politico, bool isFollowing),
    @required Result loadingFetch(),
    @required Result loadingSaveFollowPolitics(),
  }) {
    assert(initial != null);
    assert(fetchSuggestedPoliticsSuccess != null);
    assert(fetchSuggestedPoliticsFailed != null);
    assert(savedSuggestedPolitics != null);
    assert(saveSuggestedPoliticsFailed != null);
    assert(changedPoliticsFollowingStatus != null);
    assert(loadingFetch != null);
    assert(loadingSaveFollowPolitics != null);
    return loadingSaveFollowPolitics();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result fetchSuggestedPoliticsSuccess(List<PoliticoModel> politicos),
    Result fetchSuggestedPoliticsFailed(),
    Result savedSuggestedPolitics(),
    Result saveSuggestedPoliticsFailed(),
    Result changedPoliticsFollowingStatus(
        PoliticoModel politico, bool isFollowing),
    Result loadingFetch(),
    Result loadingSaveFollowPolitics(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingSaveFollowPolitics != null) {
      return loadingSaveFollowPolitics();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticSuggestionState value),
    @required
        Result fetchSuggestedPoliticsSuccess(
            FetchSuggestedPoliticsSuccess value),
    @required
        Result fetchSuggestedPoliticsFailed(FetchSuggestedPoliticsFailed value),
    @required Result savedSuggestedPolitics(SavedSuggestedPolitics value),
    @required
        Result saveSuggestedPoliticsFailed(SaveSuggestedPoliticsFailed value),
    @required
        Result changedPoliticsFollowingStatus(
            ChangedPoliticsFollowingStatus value),
    @required Result loadingFetch(LoadingFetch value),
    @required Result loadingSaveFollowPolitics(LoadingSaveFollowPolitics value),
  }) {
    assert(initial != null);
    assert(fetchSuggestedPoliticsSuccess != null);
    assert(fetchSuggestedPoliticsFailed != null);
    assert(savedSuggestedPolitics != null);
    assert(saveSuggestedPoliticsFailed != null);
    assert(changedPoliticsFollowingStatus != null);
    assert(loadingFetch != null);
    assert(loadingSaveFollowPolitics != null);
    return loadingSaveFollowPolitics(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticSuggestionState value),
    Result fetchSuggestedPoliticsSuccess(FetchSuggestedPoliticsSuccess value),
    Result fetchSuggestedPoliticsFailed(FetchSuggestedPoliticsFailed value),
    Result savedSuggestedPolitics(SavedSuggestedPolitics value),
    Result saveSuggestedPoliticsFailed(SaveSuggestedPoliticsFailed value),
    Result changedPoliticsFollowingStatus(ChangedPoliticsFollowingStatus value),
    Result loadingFetch(LoadingFetch value),
    Result loadingSaveFollowPolitics(LoadingSaveFollowPolitics value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingSaveFollowPolitics != null) {
      return loadingSaveFollowPolitics(this);
    }
    return orElse();
  }
}

abstract class LoadingSaveFollowPolitics implements PoliticSuggestionState {
  factory LoadingSaveFollowPolitics() = _$LoadingSaveFollowPolitics;
}
