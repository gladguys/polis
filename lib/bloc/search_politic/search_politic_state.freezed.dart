// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'search_politic_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SearchPoliticStateTearOff {
  const _$SearchPoliticStateTearOff();

  InitialSearchPoliticState initial() {
    return InitialSearchPoliticState();
  }

  FetchSearchPoliticsSuccess fetchSearchPoliticsSuccess(
      List<PoliticoModel> politics) {
    return FetchSearchPoliticsSuccess(
      politics,
    );
  }

  LoadingFetchPolitics loadingFetchPolitics() {
    return LoadingFetchPolitics();
  }

  FetchSearchPoliticsFailed fetchSearchPoliticsFailed() {
    return FetchSearchPoliticsFailed();
  }

  SearchPoliticFilterChanged searchPoliticFilterChanged(
      {List<PoliticoModel> politics,
      String statePicked,
      String partidoPicked,
      String searchTerm}) {
    return SearchPoliticFilterChanged(
      politics: politics,
      statePicked: statePicked,
      partidoPicked: partidoPicked,
      searchTerm: searchTerm,
    );
  }

  FollowedSearchPoliticsUpdated followedSearchPoliticsUpdated(
      {List<PoliticoModel> followedPolitics,
      PoliticoModel politicoUpdated,
      bool isFollowing}) {
    return FollowedSearchPoliticsUpdated(
      followedPolitics: followedPolitics,
      politicoUpdated: politicoUpdated,
      isFollowing: isFollowing,
    );
  }

  FollowUnfollowPoliticsFailed followUnfollowPoliticsFailed() {
    return FollowUnfollowPoliticsFailed();
  }
}

// ignore: unused_element
const $SearchPoliticState = _$SearchPoliticStateTearOff();

mixin _$SearchPoliticState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result fetchSearchPoliticsSuccess(List<PoliticoModel> politics),
    @required Result loadingFetchPolitics(),
    @required Result fetchSearchPoliticsFailed(),
    @required
        Result searchPoliticFilterChanged(List<PoliticoModel> politics,
            String statePicked, String partidoPicked, String searchTerm),
    @required
        Result followedSearchPoliticsUpdated(
            List<PoliticoModel> followedPolitics,
            PoliticoModel politicoUpdated,
            bool isFollowing),
    @required Result followUnfollowPoliticsFailed(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result fetchSearchPoliticsSuccess(List<PoliticoModel> politics),
    Result loadingFetchPolitics(),
    Result fetchSearchPoliticsFailed(),
    Result searchPoliticFilterChanged(List<PoliticoModel> politics,
        String statePicked, String partidoPicked, String searchTerm),
    Result followedSearchPoliticsUpdated(List<PoliticoModel> followedPolitics,
        PoliticoModel politicoUpdated, bool isFollowing),
    Result followUnfollowPoliticsFailed(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialSearchPoliticState value),
    @required
        Result fetchSearchPoliticsSuccess(FetchSearchPoliticsSuccess value),
    @required Result loadingFetchPolitics(LoadingFetchPolitics value),
    @required Result fetchSearchPoliticsFailed(FetchSearchPoliticsFailed value),
    @required
        Result searchPoliticFilterChanged(SearchPoliticFilterChanged value),
    @required
        Result followedSearchPoliticsUpdated(
            FollowedSearchPoliticsUpdated value),
    @required
        Result followUnfollowPoliticsFailed(FollowUnfollowPoliticsFailed value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialSearchPoliticState value),
    Result fetchSearchPoliticsSuccess(FetchSearchPoliticsSuccess value),
    Result loadingFetchPolitics(LoadingFetchPolitics value),
    Result fetchSearchPoliticsFailed(FetchSearchPoliticsFailed value),
    Result searchPoliticFilterChanged(SearchPoliticFilterChanged value),
    Result followedSearchPoliticsUpdated(FollowedSearchPoliticsUpdated value),
    Result followUnfollowPoliticsFailed(FollowUnfollowPoliticsFailed value),
    @required Result orElse(),
  });
}

abstract class $SearchPoliticStateCopyWith<$Res> {
  factory $SearchPoliticStateCopyWith(
          SearchPoliticState value, $Res Function(SearchPoliticState) then) =
      _$SearchPoliticStateCopyWithImpl<$Res>;
}

class _$SearchPoliticStateCopyWithImpl<$Res>
    implements $SearchPoliticStateCopyWith<$Res> {
  _$SearchPoliticStateCopyWithImpl(this._value, this._then);

  final SearchPoliticState _value;
  // ignore: unused_field
  final $Res Function(SearchPoliticState) _then;
}

abstract class $InitialSearchPoliticStateCopyWith<$Res> {
  factory $InitialSearchPoliticStateCopyWith(InitialSearchPoliticState value,
          $Res Function(InitialSearchPoliticState) then) =
      _$InitialSearchPoliticStateCopyWithImpl<$Res>;
}

class _$InitialSearchPoliticStateCopyWithImpl<$Res>
    extends _$SearchPoliticStateCopyWithImpl<$Res>
    implements $InitialSearchPoliticStateCopyWith<$Res> {
  _$InitialSearchPoliticStateCopyWithImpl(InitialSearchPoliticState _value,
      $Res Function(InitialSearchPoliticState) _then)
      : super(_value, (v) => _then(v as InitialSearchPoliticState));

  @override
  InitialSearchPoliticState get _value =>
      super._value as InitialSearchPoliticState;
}

class _$InitialSearchPoliticState implements InitialSearchPoliticState {
  _$InitialSearchPoliticState();

  @override
  String toString() {
    return 'SearchPoliticState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialSearchPoliticState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result fetchSearchPoliticsSuccess(List<PoliticoModel> politics),
    @required Result loadingFetchPolitics(),
    @required Result fetchSearchPoliticsFailed(),
    @required
        Result searchPoliticFilterChanged(List<PoliticoModel> politics,
            String statePicked, String partidoPicked, String searchTerm),
    @required
        Result followedSearchPoliticsUpdated(
            List<PoliticoModel> followedPolitics,
            PoliticoModel politicoUpdated,
            bool isFollowing),
    @required Result followUnfollowPoliticsFailed(),
  }) {
    assert(initial != null);
    assert(fetchSearchPoliticsSuccess != null);
    assert(loadingFetchPolitics != null);
    assert(fetchSearchPoliticsFailed != null);
    assert(searchPoliticFilterChanged != null);
    assert(followedSearchPoliticsUpdated != null);
    assert(followUnfollowPoliticsFailed != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result fetchSearchPoliticsSuccess(List<PoliticoModel> politics),
    Result loadingFetchPolitics(),
    Result fetchSearchPoliticsFailed(),
    Result searchPoliticFilterChanged(List<PoliticoModel> politics,
        String statePicked, String partidoPicked, String searchTerm),
    Result followedSearchPoliticsUpdated(List<PoliticoModel> followedPolitics,
        PoliticoModel politicoUpdated, bool isFollowing),
    Result followUnfollowPoliticsFailed(),
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
    @required Result initial(InitialSearchPoliticState value),
    @required
        Result fetchSearchPoliticsSuccess(FetchSearchPoliticsSuccess value),
    @required Result loadingFetchPolitics(LoadingFetchPolitics value),
    @required Result fetchSearchPoliticsFailed(FetchSearchPoliticsFailed value),
    @required
        Result searchPoliticFilterChanged(SearchPoliticFilterChanged value),
    @required
        Result followedSearchPoliticsUpdated(
            FollowedSearchPoliticsUpdated value),
    @required
        Result followUnfollowPoliticsFailed(FollowUnfollowPoliticsFailed value),
  }) {
    assert(initial != null);
    assert(fetchSearchPoliticsSuccess != null);
    assert(loadingFetchPolitics != null);
    assert(fetchSearchPoliticsFailed != null);
    assert(searchPoliticFilterChanged != null);
    assert(followedSearchPoliticsUpdated != null);
    assert(followUnfollowPoliticsFailed != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialSearchPoliticState value),
    Result fetchSearchPoliticsSuccess(FetchSearchPoliticsSuccess value),
    Result loadingFetchPolitics(LoadingFetchPolitics value),
    Result fetchSearchPoliticsFailed(FetchSearchPoliticsFailed value),
    Result searchPoliticFilterChanged(SearchPoliticFilterChanged value),
    Result followedSearchPoliticsUpdated(FollowedSearchPoliticsUpdated value),
    Result followUnfollowPoliticsFailed(FollowUnfollowPoliticsFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialSearchPoliticState implements SearchPoliticState {
  factory InitialSearchPoliticState() = _$InitialSearchPoliticState;
}

abstract class $FetchSearchPoliticsSuccessCopyWith<$Res> {
  factory $FetchSearchPoliticsSuccessCopyWith(FetchSearchPoliticsSuccess value,
          $Res Function(FetchSearchPoliticsSuccess) then) =
      _$FetchSearchPoliticsSuccessCopyWithImpl<$Res>;
  $Res call({List<PoliticoModel> politics});
}

class _$FetchSearchPoliticsSuccessCopyWithImpl<$Res>
    extends _$SearchPoliticStateCopyWithImpl<$Res>
    implements $FetchSearchPoliticsSuccessCopyWith<$Res> {
  _$FetchSearchPoliticsSuccessCopyWithImpl(FetchSearchPoliticsSuccess _value,
      $Res Function(FetchSearchPoliticsSuccess) _then)
      : super(_value, (v) => _then(v as FetchSearchPoliticsSuccess));

  @override
  FetchSearchPoliticsSuccess get _value =>
      super._value as FetchSearchPoliticsSuccess;

  @override
  $Res call({
    Object politics = freezed,
  }) {
    return _then(FetchSearchPoliticsSuccess(
      politics == freezed ? _value.politics : politics as List<PoliticoModel>,
    ));
  }
}

class _$FetchSearchPoliticsSuccess implements FetchSearchPoliticsSuccess {
  _$FetchSearchPoliticsSuccess(this.politics) : assert(politics != null);

  @override
  final List<PoliticoModel> politics;

  @override
  String toString() {
    return 'SearchPoliticState.fetchSearchPoliticsSuccess(politics: $politics)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FetchSearchPoliticsSuccess &&
            (identical(other.politics, politics) ||
                const DeepCollectionEquality()
                    .equals(other.politics, politics)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(politics);

  @override
  $FetchSearchPoliticsSuccessCopyWith<FetchSearchPoliticsSuccess>
      get copyWith =>
          _$FetchSearchPoliticsSuccessCopyWithImpl<FetchSearchPoliticsSuccess>(
              this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result fetchSearchPoliticsSuccess(List<PoliticoModel> politics),
    @required Result loadingFetchPolitics(),
    @required Result fetchSearchPoliticsFailed(),
    @required
        Result searchPoliticFilterChanged(List<PoliticoModel> politics,
            String statePicked, String partidoPicked, String searchTerm),
    @required
        Result followedSearchPoliticsUpdated(
            List<PoliticoModel> followedPolitics,
            PoliticoModel politicoUpdated,
            bool isFollowing),
    @required Result followUnfollowPoliticsFailed(),
  }) {
    assert(initial != null);
    assert(fetchSearchPoliticsSuccess != null);
    assert(loadingFetchPolitics != null);
    assert(fetchSearchPoliticsFailed != null);
    assert(searchPoliticFilterChanged != null);
    assert(followedSearchPoliticsUpdated != null);
    assert(followUnfollowPoliticsFailed != null);
    return fetchSearchPoliticsSuccess(politics);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result fetchSearchPoliticsSuccess(List<PoliticoModel> politics),
    Result loadingFetchPolitics(),
    Result fetchSearchPoliticsFailed(),
    Result searchPoliticFilterChanged(List<PoliticoModel> politics,
        String statePicked, String partidoPicked, String searchTerm),
    Result followedSearchPoliticsUpdated(List<PoliticoModel> followedPolitics,
        PoliticoModel politicoUpdated, bool isFollowing),
    Result followUnfollowPoliticsFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchSearchPoliticsSuccess != null) {
      return fetchSearchPoliticsSuccess(politics);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialSearchPoliticState value),
    @required
        Result fetchSearchPoliticsSuccess(FetchSearchPoliticsSuccess value),
    @required Result loadingFetchPolitics(LoadingFetchPolitics value),
    @required Result fetchSearchPoliticsFailed(FetchSearchPoliticsFailed value),
    @required
        Result searchPoliticFilterChanged(SearchPoliticFilterChanged value),
    @required
        Result followedSearchPoliticsUpdated(
            FollowedSearchPoliticsUpdated value),
    @required
        Result followUnfollowPoliticsFailed(FollowUnfollowPoliticsFailed value),
  }) {
    assert(initial != null);
    assert(fetchSearchPoliticsSuccess != null);
    assert(loadingFetchPolitics != null);
    assert(fetchSearchPoliticsFailed != null);
    assert(searchPoliticFilterChanged != null);
    assert(followedSearchPoliticsUpdated != null);
    assert(followUnfollowPoliticsFailed != null);
    return fetchSearchPoliticsSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialSearchPoliticState value),
    Result fetchSearchPoliticsSuccess(FetchSearchPoliticsSuccess value),
    Result loadingFetchPolitics(LoadingFetchPolitics value),
    Result fetchSearchPoliticsFailed(FetchSearchPoliticsFailed value),
    Result searchPoliticFilterChanged(SearchPoliticFilterChanged value),
    Result followedSearchPoliticsUpdated(FollowedSearchPoliticsUpdated value),
    Result followUnfollowPoliticsFailed(FollowUnfollowPoliticsFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchSearchPoliticsSuccess != null) {
      return fetchSearchPoliticsSuccess(this);
    }
    return orElse();
  }
}

abstract class FetchSearchPoliticsSuccess implements SearchPoliticState {
  factory FetchSearchPoliticsSuccess(List<PoliticoModel> politics) =
      _$FetchSearchPoliticsSuccess;

  List<PoliticoModel> get politics;
  $FetchSearchPoliticsSuccessCopyWith<FetchSearchPoliticsSuccess> get copyWith;
}

abstract class $LoadingFetchPoliticsCopyWith<$Res> {
  factory $LoadingFetchPoliticsCopyWith(LoadingFetchPolitics value,
          $Res Function(LoadingFetchPolitics) then) =
      _$LoadingFetchPoliticsCopyWithImpl<$Res>;
}

class _$LoadingFetchPoliticsCopyWithImpl<$Res>
    extends _$SearchPoliticStateCopyWithImpl<$Res>
    implements $LoadingFetchPoliticsCopyWith<$Res> {
  _$LoadingFetchPoliticsCopyWithImpl(
      LoadingFetchPolitics _value, $Res Function(LoadingFetchPolitics) _then)
      : super(_value, (v) => _then(v as LoadingFetchPolitics));

  @override
  LoadingFetchPolitics get _value => super._value as LoadingFetchPolitics;
}

class _$LoadingFetchPolitics implements LoadingFetchPolitics {
  _$LoadingFetchPolitics();

  @override
  String toString() {
    return 'SearchPoliticState.loadingFetchPolitics()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadingFetchPolitics);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result fetchSearchPoliticsSuccess(List<PoliticoModel> politics),
    @required Result loadingFetchPolitics(),
    @required Result fetchSearchPoliticsFailed(),
    @required
        Result searchPoliticFilterChanged(List<PoliticoModel> politics,
            String statePicked, String partidoPicked, String searchTerm),
    @required
        Result followedSearchPoliticsUpdated(
            List<PoliticoModel> followedPolitics,
            PoliticoModel politicoUpdated,
            bool isFollowing),
    @required Result followUnfollowPoliticsFailed(),
  }) {
    assert(initial != null);
    assert(fetchSearchPoliticsSuccess != null);
    assert(loadingFetchPolitics != null);
    assert(fetchSearchPoliticsFailed != null);
    assert(searchPoliticFilterChanged != null);
    assert(followedSearchPoliticsUpdated != null);
    assert(followUnfollowPoliticsFailed != null);
    return loadingFetchPolitics();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result fetchSearchPoliticsSuccess(List<PoliticoModel> politics),
    Result loadingFetchPolitics(),
    Result fetchSearchPoliticsFailed(),
    Result searchPoliticFilterChanged(List<PoliticoModel> politics,
        String statePicked, String partidoPicked, String searchTerm),
    Result followedSearchPoliticsUpdated(List<PoliticoModel> followedPolitics,
        PoliticoModel politicoUpdated, bool isFollowing),
    Result followUnfollowPoliticsFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingFetchPolitics != null) {
      return loadingFetchPolitics();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialSearchPoliticState value),
    @required
        Result fetchSearchPoliticsSuccess(FetchSearchPoliticsSuccess value),
    @required Result loadingFetchPolitics(LoadingFetchPolitics value),
    @required Result fetchSearchPoliticsFailed(FetchSearchPoliticsFailed value),
    @required
        Result searchPoliticFilterChanged(SearchPoliticFilterChanged value),
    @required
        Result followedSearchPoliticsUpdated(
            FollowedSearchPoliticsUpdated value),
    @required
        Result followUnfollowPoliticsFailed(FollowUnfollowPoliticsFailed value),
  }) {
    assert(initial != null);
    assert(fetchSearchPoliticsSuccess != null);
    assert(loadingFetchPolitics != null);
    assert(fetchSearchPoliticsFailed != null);
    assert(searchPoliticFilterChanged != null);
    assert(followedSearchPoliticsUpdated != null);
    assert(followUnfollowPoliticsFailed != null);
    return loadingFetchPolitics(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialSearchPoliticState value),
    Result fetchSearchPoliticsSuccess(FetchSearchPoliticsSuccess value),
    Result loadingFetchPolitics(LoadingFetchPolitics value),
    Result fetchSearchPoliticsFailed(FetchSearchPoliticsFailed value),
    Result searchPoliticFilterChanged(SearchPoliticFilterChanged value),
    Result followedSearchPoliticsUpdated(FollowedSearchPoliticsUpdated value),
    Result followUnfollowPoliticsFailed(FollowUnfollowPoliticsFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingFetchPolitics != null) {
      return loadingFetchPolitics(this);
    }
    return orElse();
  }
}

abstract class LoadingFetchPolitics implements SearchPoliticState {
  factory LoadingFetchPolitics() = _$LoadingFetchPolitics;
}

abstract class $FetchSearchPoliticsFailedCopyWith<$Res> {
  factory $FetchSearchPoliticsFailedCopyWith(FetchSearchPoliticsFailed value,
          $Res Function(FetchSearchPoliticsFailed) then) =
      _$FetchSearchPoliticsFailedCopyWithImpl<$Res>;
}

class _$FetchSearchPoliticsFailedCopyWithImpl<$Res>
    extends _$SearchPoliticStateCopyWithImpl<$Res>
    implements $FetchSearchPoliticsFailedCopyWith<$Res> {
  _$FetchSearchPoliticsFailedCopyWithImpl(FetchSearchPoliticsFailed _value,
      $Res Function(FetchSearchPoliticsFailed) _then)
      : super(_value, (v) => _then(v as FetchSearchPoliticsFailed));

  @override
  FetchSearchPoliticsFailed get _value =>
      super._value as FetchSearchPoliticsFailed;
}

class _$FetchSearchPoliticsFailed implements FetchSearchPoliticsFailed {
  _$FetchSearchPoliticsFailed();

  @override
  String toString() {
    return 'SearchPoliticState.fetchSearchPoliticsFailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FetchSearchPoliticsFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result fetchSearchPoliticsSuccess(List<PoliticoModel> politics),
    @required Result loadingFetchPolitics(),
    @required Result fetchSearchPoliticsFailed(),
    @required
        Result searchPoliticFilterChanged(List<PoliticoModel> politics,
            String statePicked, String partidoPicked, String searchTerm),
    @required
        Result followedSearchPoliticsUpdated(
            List<PoliticoModel> followedPolitics,
            PoliticoModel politicoUpdated,
            bool isFollowing),
    @required Result followUnfollowPoliticsFailed(),
  }) {
    assert(initial != null);
    assert(fetchSearchPoliticsSuccess != null);
    assert(loadingFetchPolitics != null);
    assert(fetchSearchPoliticsFailed != null);
    assert(searchPoliticFilterChanged != null);
    assert(followedSearchPoliticsUpdated != null);
    assert(followUnfollowPoliticsFailed != null);
    return fetchSearchPoliticsFailed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result fetchSearchPoliticsSuccess(List<PoliticoModel> politics),
    Result loadingFetchPolitics(),
    Result fetchSearchPoliticsFailed(),
    Result searchPoliticFilterChanged(List<PoliticoModel> politics,
        String statePicked, String partidoPicked, String searchTerm),
    Result followedSearchPoliticsUpdated(List<PoliticoModel> followedPolitics,
        PoliticoModel politicoUpdated, bool isFollowing),
    Result followUnfollowPoliticsFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchSearchPoliticsFailed != null) {
      return fetchSearchPoliticsFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialSearchPoliticState value),
    @required
        Result fetchSearchPoliticsSuccess(FetchSearchPoliticsSuccess value),
    @required Result loadingFetchPolitics(LoadingFetchPolitics value),
    @required Result fetchSearchPoliticsFailed(FetchSearchPoliticsFailed value),
    @required
        Result searchPoliticFilterChanged(SearchPoliticFilterChanged value),
    @required
        Result followedSearchPoliticsUpdated(
            FollowedSearchPoliticsUpdated value),
    @required
        Result followUnfollowPoliticsFailed(FollowUnfollowPoliticsFailed value),
  }) {
    assert(initial != null);
    assert(fetchSearchPoliticsSuccess != null);
    assert(loadingFetchPolitics != null);
    assert(fetchSearchPoliticsFailed != null);
    assert(searchPoliticFilterChanged != null);
    assert(followedSearchPoliticsUpdated != null);
    assert(followUnfollowPoliticsFailed != null);
    return fetchSearchPoliticsFailed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialSearchPoliticState value),
    Result fetchSearchPoliticsSuccess(FetchSearchPoliticsSuccess value),
    Result loadingFetchPolitics(LoadingFetchPolitics value),
    Result fetchSearchPoliticsFailed(FetchSearchPoliticsFailed value),
    Result searchPoliticFilterChanged(SearchPoliticFilterChanged value),
    Result followedSearchPoliticsUpdated(FollowedSearchPoliticsUpdated value),
    Result followUnfollowPoliticsFailed(FollowUnfollowPoliticsFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchSearchPoliticsFailed != null) {
      return fetchSearchPoliticsFailed(this);
    }
    return orElse();
  }
}

abstract class FetchSearchPoliticsFailed implements SearchPoliticState {
  factory FetchSearchPoliticsFailed() = _$FetchSearchPoliticsFailed;
}

abstract class $SearchPoliticFilterChangedCopyWith<$Res> {
  factory $SearchPoliticFilterChangedCopyWith(SearchPoliticFilterChanged value,
          $Res Function(SearchPoliticFilterChanged) then) =
      _$SearchPoliticFilterChangedCopyWithImpl<$Res>;
  $Res call(
      {List<PoliticoModel> politics,
      String statePicked,
      String partidoPicked,
      String searchTerm});
}

class _$SearchPoliticFilterChangedCopyWithImpl<$Res>
    extends _$SearchPoliticStateCopyWithImpl<$Res>
    implements $SearchPoliticFilterChangedCopyWith<$Res> {
  _$SearchPoliticFilterChangedCopyWithImpl(SearchPoliticFilterChanged _value,
      $Res Function(SearchPoliticFilterChanged) _then)
      : super(_value, (v) => _then(v as SearchPoliticFilterChanged));

  @override
  SearchPoliticFilterChanged get _value =>
      super._value as SearchPoliticFilterChanged;

  @override
  $Res call({
    Object politics = freezed,
    Object statePicked = freezed,
    Object partidoPicked = freezed,
    Object searchTerm = freezed,
  }) {
    return _then(SearchPoliticFilterChanged(
      politics: politics == freezed
          ? _value.politics
          : politics as List<PoliticoModel>,
      statePicked:
          statePicked == freezed ? _value.statePicked : statePicked as String,
      partidoPicked: partidoPicked == freezed
          ? _value.partidoPicked
          : partidoPicked as String,
      searchTerm:
          searchTerm == freezed ? _value.searchTerm : searchTerm as String,
    ));
  }
}

class _$SearchPoliticFilterChanged implements SearchPoliticFilterChanged {
  _$SearchPoliticFilterChanged(
      {this.politics, this.statePicked, this.partidoPicked, this.searchTerm});

  @override
  final List<PoliticoModel> politics;
  @override
  final String statePicked;
  @override
  final String partidoPicked;
  @override
  final String searchTerm;

  @override
  String toString() {
    return 'SearchPoliticState.searchPoliticFilterChanged(politics: $politics, statePicked: $statePicked, partidoPicked: $partidoPicked, searchTerm: $searchTerm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SearchPoliticFilterChanged &&
            (identical(other.politics, politics) ||
                const DeepCollectionEquality()
                    .equals(other.politics, politics)) &&
            (identical(other.statePicked, statePicked) ||
                const DeepCollectionEquality()
                    .equals(other.statePicked, statePicked)) &&
            (identical(other.partidoPicked, partidoPicked) ||
                const DeepCollectionEquality()
                    .equals(other.partidoPicked, partidoPicked)) &&
            (identical(other.searchTerm, searchTerm) ||
                const DeepCollectionEquality()
                    .equals(other.searchTerm, searchTerm)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(politics) ^
      const DeepCollectionEquality().hash(statePicked) ^
      const DeepCollectionEquality().hash(partidoPicked) ^
      const DeepCollectionEquality().hash(searchTerm);

  @override
  $SearchPoliticFilterChangedCopyWith<SearchPoliticFilterChanged>
      get copyWith =>
          _$SearchPoliticFilterChangedCopyWithImpl<SearchPoliticFilterChanged>(
              this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result fetchSearchPoliticsSuccess(List<PoliticoModel> politics),
    @required Result loadingFetchPolitics(),
    @required Result fetchSearchPoliticsFailed(),
    @required
        Result searchPoliticFilterChanged(List<PoliticoModel> politics,
            String statePicked, String partidoPicked, String searchTerm),
    @required
        Result followedSearchPoliticsUpdated(
            List<PoliticoModel> followedPolitics,
            PoliticoModel politicoUpdated,
            bool isFollowing),
    @required Result followUnfollowPoliticsFailed(),
  }) {
    assert(initial != null);
    assert(fetchSearchPoliticsSuccess != null);
    assert(loadingFetchPolitics != null);
    assert(fetchSearchPoliticsFailed != null);
    assert(searchPoliticFilterChanged != null);
    assert(followedSearchPoliticsUpdated != null);
    assert(followUnfollowPoliticsFailed != null);
    return searchPoliticFilterChanged(
        politics, statePicked, partidoPicked, searchTerm);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result fetchSearchPoliticsSuccess(List<PoliticoModel> politics),
    Result loadingFetchPolitics(),
    Result fetchSearchPoliticsFailed(),
    Result searchPoliticFilterChanged(List<PoliticoModel> politics,
        String statePicked, String partidoPicked, String searchTerm),
    Result followedSearchPoliticsUpdated(List<PoliticoModel> followedPolitics,
        PoliticoModel politicoUpdated, bool isFollowing),
    Result followUnfollowPoliticsFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (searchPoliticFilterChanged != null) {
      return searchPoliticFilterChanged(
          politics, statePicked, partidoPicked, searchTerm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialSearchPoliticState value),
    @required
        Result fetchSearchPoliticsSuccess(FetchSearchPoliticsSuccess value),
    @required Result loadingFetchPolitics(LoadingFetchPolitics value),
    @required Result fetchSearchPoliticsFailed(FetchSearchPoliticsFailed value),
    @required
        Result searchPoliticFilterChanged(SearchPoliticFilterChanged value),
    @required
        Result followedSearchPoliticsUpdated(
            FollowedSearchPoliticsUpdated value),
    @required
        Result followUnfollowPoliticsFailed(FollowUnfollowPoliticsFailed value),
  }) {
    assert(initial != null);
    assert(fetchSearchPoliticsSuccess != null);
    assert(loadingFetchPolitics != null);
    assert(fetchSearchPoliticsFailed != null);
    assert(searchPoliticFilterChanged != null);
    assert(followedSearchPoliticsUpdated != null);
    assert(followUnfollowPoliticsFailed != null);
    return searchPoliticFilterChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialSearchPoliticState value),
    Result fetchSearchPoliticsSuccess(FetchSearchPoliticsSuccess value),
    Result loadingFetchPolitics(LoadingFetchPolitics value),
    Result fetchSearchPoliticsFailed(FetchSearchPoliticsFailed value),
    Result searchPoliticFilterChanged(SearchPoliticFilterChanged value),
    Result followedSearchPoliticsUpdated(FollowedSearchPoliticsUpdated value),
    Result followUnfollowPoliticsFailed(FollowUnfollowPoliticsFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (searchPoliticFilterChanged != null) {
      return searchPoliticFilterChanged(this);
    }
    return orElse();
  }
}

abstract class SearchPoliticFilterChanged implements SearchPoliticState {
  factory SearchPoliticFilterChanged(
      {List<PoliticoModel> politics,
      String statePicked,
      String partidoPicked,
      String searchTerm}) = _$SearchPoliticFilterChanged;

  List<PoliticoModel> get politics;
  String get statePicked;
  String get partidoPicked;
  String get searchTerm;
  $SearchPoliticFilterChangedCopyWith<SearchPoliticFilterChanged> get copyWith;
}

abstract class $FollowedSearchPoliticsUpdatedCopyWith<$Res> {
  factory $FollowedSearchPoliticsUpdatedCopyWith(
          FollowedSearchPoliticsUpdated value,
          $Res Function(FollowedSearchPoliticsUpdated) then) =
      _$FollowedSearchPoliticsUpdatedCopyWithImpl<$Res>;
  $Res call(
      {List<PoliticoModel> followedPolitics,
      PoliticoModel politicoUpdated,
      bool isFollowing});
}

class _$FollowedSearchPoliticsUpdatedCopyWithImpl<$Res>
    extends _$SearchPoliticStateCopyWithImpl<$Res>
    implements $FollowedSearchPoliticsUpdatedCopyWith<$Res> {
  _$FollowedSearchPoliticsUpdatedCopyWithImpl(
      FollowedSearchPoliticsUpdated _value,
      $Res Function(FollowedSearchPoliticsUpdated) _then)
      : super(_value, (v) => _then(v as FollowedSearchPoliticsUpdated));

  @override
  FollowedSearchPoliticsUpdated get _value =>
      super._value as FollowedSearchPoliticsUpdated;

  @override
  $Res call({
    Object followedPolitics = freezed,
    Object politicoUpdated = freezed,
    Object isFollowing = freezed,
  }) {
    return _then(FollowedSearchPoliticsUpdated(
      followedPolitics: followedPolitics == freezed
          ? _value.followedPolitics
          : followedPolitics as List<PoliticoModel>,
      politicoUpdated: politicoUpdated == freezed
          ? _value.politicoUpdated
          : politicoUpdated as PoliticoModel,
      isFollowing:
          isFollowing == freezed ? _value.isFollowing : isFollowing as bool,
    ));
  }
}

class _$FollowedSearchPoliticsUpdated implements FollowedSearchPoliticsUpdated {
  _$FollowedSearchPoliticsUpdated(
      {this.followedPolitics, this.politicoUpdated, this.isFollowing});

  @override
  final List<PoliticoModel> followedPolitics;
  @override
  final PoliticoModel politicoUpdated;
  @override
  final bool isFollowing;

  @override
  String toString() {
    return 'SearchPoliticState.followedSearchPoliticsUpdated(followedPolitics: $followedPolitics, politicoUpdated: $politicoUpdated, isFollowing: $isFollowing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FollowedSearchPoliticsUpdated &&
            (identical(other.followedPolitics, followedPolitics) ||
                const DeepCollectionEquality()
                    .equals(other.followedPolitics, followedPolitics)) &&
            (identical(other.politicoUpdated, politicoUpdated) ||
                const DeepCollectionEquality()
                    .equals(other.politicoUpdated, politicoUpdated)) &&
            (identical(other.isFollowing, isFollowing) ||
                const DeepCollectionEquality()
                    .equals(other.isFollowing, isFollowing)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(followedPolitics) ^
      const DeepCollectionEquality().hash(politicoUpdated) ^
      const DeepCollectionEquality().hash(isFollowing);

  @override
  $FollowedSearchPoliticsUpdatedCopyWith<FollowedSearchPoliticsUpdated>
      get copyWith => _$FollowedSearchPoliticsUpdatedCopyWithImpl<
          FollowedSearchPoliticsUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result fetchSearchPoliticsSuccess(List<PoliticoModel> politics),
    @required Result loadingFetchPolitics(),
    @required Result fetchSearchPoliticsFailed(),
    @required
        Result searchPoliticFilterChanged(List<PoliticoModel> politics,
            String statePicked, String partidoPicked, String searchTerm),
    @required
        Result followedSearchPoliticsUpdated(
            List<PoliticoModel> followedPolitics,
            PoliticoModel politicoUpdated,
            bool isFollowing),
    @required Result followUnfollowPoliticsFailed(),
  }) {
    assert(initial != null);
    assert(fetchSearchPoliticsSuccess != null);
    assert(loadingFetchPolitics != null);
    assert(fetchSearchPoliticsFailed != null);
    assert(searchPoliticFilterChanged != null);
    assert(followedSearchPoliticsUpdated != null);
    assert(followUnfollowPoliticsFailed != null);
    return followedSearchPoliticsUpdated(
        followedPolitics, politicoUpdated, isFollowing);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result fetchSearchPoliticsSuccess(List<PoliticoModel> politics),
    Result loadingFetchPolitics(),
    Result fetchSearchPoliticsFailed(),
    Result searchPoliticFilterChanged(List<PoliticoModel> politics,
        String statePicked, String partidoPicked, String searchTerm),
    Result followedSearchPoliticsUpdated(List<PoliticoModel> followedPolitics,
        PoliticoModel politicoUpdated, bool isFollowing),
    Result followUnfollowPoliticsFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (followedSearchPoliticsUpdated != null) {
      return followedSearchPoliticsUpdated(
          followedPolitics, politicoUpdated, isFollowing);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialSearchPoliticState value),
    @required
        Result fetchSearchPoliticsSuccess(FetchSearchPoliticsSuccess value),
    @required Result loadingFetchPolitics(LoadingFetchPolitics value),
    @required Result fetchSearchPoliticsFailed(FetchSearchPoliticsFailed value),
    @required
        Result searchPoliticFilterChanged(SearchPoliticFilterChanged value),
    @required
        Result followedSearchPoliticsUpdated(
            FollowedSearchPoliticsUpdated value),
    @required
        Result followUnfollowPoliticsFailed(FollowUnfollowPoliticsFailed value),
  }) {
    assert(initial != null);
    assert(fetchSearchPoliticsSuccess != null);
    assert(loadingFetchPolitics != null);
    assert(fetchSearchPoliticsFailed != null);
    assert(searchPoliticFilterChanged != null);
    assert(followedSearchPoliticsUpdated != null);
    assert(followUnfollowPoliticsFailed != null);
    return followedSearchPoliticsUpdated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialSearchPoliticState value),
    Result fetchSearchPoliticsSuccess(FetchSearchPoliticsSuccess value),
    Result loadingFetchPolitics(LoadingFetchPolitics value),
    Result fetchSearchPoliticsFailed(FetchSearchPoliticsFailed value),
    Result searchPoliticFilterChanged(SearchPoliticFilterChanged value),
    Result followedSearchPoliticsUpdated(FollowedSearchPoliticsUpdated value),
    Result followUnfollowPoliticsFailed(FollowUnfollowPoliticsFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (followedSearchPoliticsUpdated != null) {
      return followedSearchPoliticsUpdated(this);
    }
    return orElse();
  }
}

abstract class FollowedSearchPoliticsUpdated implements SearchPoliticState {
  factory FollowedSearchPoliticsUpdated(
      {List<PoliticoModel> followedPolitics,
      PoliticoModel politicoUpdated,
      bool isFollowing}) = _$FollowedSearchPoliticsUpdated;

  List<PoliticoModel> get followedPolitics;
  PoliticoModel get politicoUpdated;
  bool get isFollowing;
  $FollowedSearchPoliticsUpdatedCopyWith<FollowedSearchPoliticsUpdated>
      get copyWith;
}

abstract class $FollowUnfollowPoliticsFailedCopyWith<$Res> {
  factory $FollowUnfollowPoliticsFailedCopyWith(
          FollowUnfollowPoliticsFailed value,
          $Res Function(FollowUnfollowPoliticsFailed) then) =
      _$FollowUnfollowPoliticsFailedCopyWithImpl<$Res>;
}

class _$FollowUnfollowPoliticsFailedCopyWithImpl<$Res>
    extends _$SearchPoliticStateCopyWithImpl<$Res>
    implements $FollowUnfollowPoliticsFailedCopyWith<$Res> {
  _$FollowUnfollowPoliticsFailedCopyWithImpl(
      FollowUnfollowPoliticsFailed _value,
      $Res Function(FollowUnfollowPoliticsFailed) _then)
      : super(_value, (v) => _then(v as FollowUnfollowPoliticsFailed));

  @override
  FollowUnfollowPoliticsFailed get _value =>
      super._value as FollowUnfollowPoliticsFailed;
}

class _$FollowUnfollowPoliticsFailed implements FollowUnfollowPoliticsFailed {
  _$FollowUnfollowPoliticsFailed();

  @override
  String toString() {
    return 'SearchPoliticState.followUnfollowPoliticsFailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FollowUnfollowPoliticsFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result fetchSearchPoliticsSuccess(List<PoliticoModel> politics),
    @required Result loadingFetchPolitics(),
    @required Result fetchSearchPoliticsFailed(),
    @required
        Result searchPoliticFilterChanged(List<PoliticoModel> politics,
            String statePicked, String partidoPicked, String searchTerm),
    @required
        Result followedSearchPoliticsUpdated(
            List<PoliticoModel> followedPolitics,
            PoliticoModel politicoUpdated,
            bool isFollowing),
    @required Result followUnfollowPoliticsFailed(),
  }) {
    assert(initial != null);
    assert(fetchSearchPoliticsSuccess != null);
    assert(loadingFetchPolitics != null);
    assert(fetchSearchPoliticsFailed != null);
    assert(searchPoliticFilterChanged != null);
    assert(followedSearchPoliticsUpdated != null);
    assert(followUnfollowPoliticsFailed != null);
    return followUnfollowPoliticsFailed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result fetchSearchPoliticsSuccess(List<PoliticoModel> politics),
    Result loadingFetchPolitics(),
    Result fetchSearchPoliticsFailed(),
    Result searchPoliticFilterChanged(List<PoliticoModel> politics,
        String statePicked, String partidoPicked, String searchTerm),
    Result followedSearchPoliticsUpdated(List<PoliticoModel> followedPolitics,
        PoliticoModel politicoUpdated, bool isFollowing),
    Result followUnfollowPoliticsFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (followUnfollowPoliticsFailed != null) {
      return followUnfollowPoliticsFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialSearchPoliticState value),
    @required
        Result fetchSearchPoliticsSuccess(FetchSearchPoliticsSuccess value),
    @required Result loadingFetchPolitics(LoadingFetchPolitics value),
    @required Result fetchSearchPoliticsFailed(FetchSearchPoliticsFailed value),
    @required
        Result searchPoliticFilterChanged(SearchPoliticFilterChanged value),
    @required
        Result followedSearchPoliticsUpdated(
            FollowedSearchPoliticsUpdated value),
    @required
        Result followUnfollowPoliticsFailed(FollowUnfollowPoliticsFailed value),
  }) {
    assert(initial != null);
    assert(fetchSearchPoliticsSuccess != null);
    assert(loadingFetchPolitics != null);
    assert(fetchSearchPoliticsFailed != null);
    assert(searchPoliticFilterChanged != null);
    assert(followedSearchPoliticsUpdated != null);
    assert(followUnfollowPoliticsFailed != null);
    return followUnfollowPoliticsFailed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialSearchPoliticState value),
    Result fetchSearchPoliticsSuccess(FetchSearchPoliticsSuccess value),
    Result loadingFetchPolitics(LoadingFetchPolitics value),
    Result fetchSearchPoliticsFailed(FetchSearchPoliticsFailed value),
    Result searchPoliticFilterChanged(SearchPoliticFilterChanged value),
    Result followedSearchPoliticsUpdated(FollowedSearchPoliticsUpdated value),
    Result followUnfollowPoliticsFailed(FollowUnfollowPoliticsFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (followUnfollowPoliticsFailed != null) {
      return followUnfollowPoliticsFailed(this);
    }
    return orElse();
  }
}

abstract class FollowUnfollowPoliticsFailed implements SearchPoliticState {
  factory FollowUnfollowPoliticsFailed() = _$FollowUnfollowPoliticsFailed;
}
