// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'search_politic_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SearchPoliticEventTearOff {
  const _$SearchPoliticEventTearOff();

  FetchPolitics fetchPolitics(String userId) {
    return FetchPolitics(
      userId,
    );
  }

  ChangeSearchPoliticFilter changeSearchPoliticFilter(
      {String estado, String partido, String term}) {
    return ChangeSearchPoliticFilter(
      estado: estado,
      partido: partido,
      term: term,
    );
  }

  FollowUnfollowSearchPolitic followUnfollowSearchPolitic(
      {@required UserModel user, @required PoliticoModel politico}) {
    return FollowUnfollowSearchPolitic(
      user: user,
      politico: politico,
    );
  }

  ChangeFollowPoliticStatus changeFollowPoliticStatus(
      {@required PoliticoModel politico,
      @required bool isUserFollowingPolitic}) {
    return ChangeFollowPoliticStatus(
      politico: politico,
      isUserFollowingPolitic: isUserFollowingPolitic,
    );
  }
}

// ignore: unused_element
const $SearchPoliticEvent = _$SearchPoliticEventTearOff();

mixin _$SearchPoliticEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result fetchPolitics(String userId),
    @required
        Result changeSearchPoliticFilter(
            String estado, String partido, String term),
    @required
        Result followUnfollowSearchPolitic(
            UserModel user, PoliticoModel politico),
    @required
        Result changeFollowPoliticStatus(
            PoliticoModel politico, bool isUserFollowingPolitic),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result fetchPolitics(String userId),
    Result changeSearchPoliticFilter(
        String estado, String partido, String term),
    Result followUnfollowSearchPolitic(UserModel user, PoliticoModel politico),
    Result changeFollowPoliticStatus(
        PoliticoModel politico, bool isUserFollowingPolitic),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result fetchPolitics(FetchPolitics value),
    @required Result changeSearchPoliticFilter(ChangeSearchPoliticFilter value),
    @required
        Result followUnfollowSearchPolitic(FollowUnfollowSearchPolitic value),
    @required Result changeFollowPoliticStatus(ChangeFollowPoliticStatus value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result fetchPolitics(FetchPolitics value),
    Result changeSearchPoliticFilter(ChangeSearchPoliticFilter value),
    Result followUnfollowSearchPolitic(FollowUnfollowSearchPolitic value),
    Result changeFollowPoliticStatus(ChangeFollowPoliticStatus value),
    @required Result orElse(),
  });
}

abstract class $SearchPoliticEventCopyWith<$Res> {
  factory $SearchPoliticEventCopyWith(
          SearchPoliticEvent value, $Res Function(SearchPoliticEvent) then) =
      _$SearchPoliticEventCopyWithImpl<$Res>;
}

class _$SearchPoliticEventCopyWithImpl<$Res>
    implements $SearchPoliticEventCopyWith<$Res> {
  _$SearchPoliticEventCopyWithImpl(this._value, this._then);

  final SearchPoliticEvent _value;
  // ignore: unused_field
  final $Res Function(SearchPoliticEvent) _then;
}

abstract class $FetchPoliticsCopyWith<$Res> {
  factory $FetchPoliticsCopyWith(
          FetchPolitics value, $Res Function(FetchPolitics) then) =
      _$FetchPoliticsCopyWithImpl<$Res>;
  $Res call({String userId});
}

class _$FetchPoliticsCopyWithImpl<$Res>
    extends _$SearchPoliticEventCopyWithImpl<$Res>
    implements $FetchPoliticsCopyWith<$Res> {
  _$FetchPoliticsCopyWithImpl(
      FetchPolitics _value, $Res Function(FetchPolitics) _then)
      : super(_value, (v) => _then(v as FetchPolitics));

  @override
  FetchPolitics get _value => super._value as FetchPolitics;

  @override
  $Res call({
    Object userId = freezed,
  }) {
    return _then(FetchPolitics(
      userId == freezed ? _value.userId : userId as String,
    ));
  }
}

class _$FetchPolitics implements FetchPolitics {
  _$FetchPolitics(this.userId) : assert(userId != null);

  @override
  final String userId;

  @override
  String toString() {
    return 'SearchPoliticEvent.fetchPolitics(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FetchPolitics &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(userId);

  @override
  $FetchPoliticsCopyWith<FetchPolitics> get copyWith =>
      _$FetchPoliticsCopyWithImpl<FetchPolitics>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result fetchPolitics(String userId),
    @required
        Result changeSearchPoliticFilter(
            String estado, String partido, String term),
    @required
        Result followUnfollowSearchPolitic(
            UserModel user, PoliticoModel politico),
    @required
        Result changeFollowPoliticStatus(
            PoliticoModel politico, bool isUserFollowingPolitic),
  }) {
    assert(fetchPolitics != null);
    assert(changeSearchPoliticFilter != null);
    assert(followUnfollowSearchPolitic != null);
    assert(changeFollowPoliticStatus != null);
    return fetchPolitics(userId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result fetchPolitics(String userId),
    Result changeSearchPoliticFilter(
        String estado, String partido, String term),
    Result followUnfollowSearchPolitic(UserModel user, PoliticoModel politico),
    Result changeFollowPoliticStatus(
        PoliticoModel politico, bool isUserFollowingPolitic),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchPolitics != null) {
      return fetchPolitics(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result fetchPolitics(FetchPolitics value),
    @required Result changeSearchPoliticFilter(ChangeSearchPoliticFilter value),
    @required
        Result followUnfollowSearchPolitic(FollowUnfollowSearchPolitic value),
    @required Result changeFollowPoliticStatus(ChangeFollowPoliticStatus value),
  }) {
    assert(fetchPolitics != null);
    assert(changeSearchPoliticFilter != null);
    assert(followUnfollowSearchPolitic != null);
    assert(changeFollowPoliticStatus != null);
    return fetchPolitics(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result fetchPolitics(FetchPolitics value),
    Result changeSearchPoliticFilter(ChangeSearchPoliticFilter value),
    Result followUnfollowSearchPolitic(FollowUnfollowSearchPolitic value),
    Result changeFollowPoliticStatus(ChangeFollowPoliticStatus value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchPolitics != null) {
      return fetchPolitics(this);
    }
    return orElse();
  }
}

abstract class FetchPolitics implements SearchPoliticEvent {
  factory FetchPolitics(String userId) = _$FetchPolitics;

  String get userId;
  $FetchPoliticsCopyWith<FetchPolitics> get copyWith;
}

abstract class $ChangeSearchPoliticFilterCopyWith<$Res> {
  factory $ChangeSearchPoliticFilterCopyWith(ChangeSearchPoliticFilter value,
          $Res Function(ChangeSearchPoliticFilter) then) =
      _$ChangeSearchPoliticFilterCopyWithImpl<$Res>;
  $Res call({String estado, String partido, String term});
}

class _$ChangeSearchPoliticFilterCopyWithImpl<$Res>
    extends _$SearchPoliticEventCopyWithImpl<$Res>
    implements $ChangeSearchPoliticFilterCopyWith<$Res> {
  _$ChangeSearchPoliticFilterCopyWithImpl(ChangeSearchPoliticFilter _value,
      $Res Function(ChangeSearchPoliticFilter) _then)
      : super(_value, (v) => _then(v as ChangeSearchPoliticFilter));

  @override
  ChangeSearchPoliticFilter get _value =>
      super._value as ChangeSearchPoliticFilter;

  @override
  $Res call({
    Object estado = freezed,
    Object partido = freezed,
    Object term = freezed,
  }) {
    return _then(ChangeSearchPoliticFilter(
      estado: estado == freezed ? _value.estado : estado as String,
      partido: partido == freezed ? _value.partido : partido as String,
      term: term == freezed ? _value.term : term as String,
    ));
  }
}

class _$ChangeSearchPoliticFilter implements ChangeSearchPoliticFilter {
  _$ChangeSearchPoliticFilter({this.estado, this.partido, this.term});

  @override
  final String estado;
  @override
  final String partido;
  @override
  final String term;

  @override
  String toString() {
    return 'SearchPoliticEvent.changeSearchPoliticFilter(estado: $estado, partido: $partido, term: $term)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeSearchPoliticFilter &&
            (identical(other.estado, estado) ||
                const DeepCollectionEquality().equals(other.estado, estado)) &&
            (identical(other.partido, partido) ||
                const DeepCollectionEquality()
                    .equals(other.partido, partido)) &&
            (identical(other.term, term) ||
                const DeepCollectionEquality().equals(other.term, term)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(estado) ^
      const DeepCollectionEquality().hash(partido) ^
      const DeepCollectionEquality().hash(term);

  @override
  $ChangeSearchPoliticFilterCopyWith<ChangeSearchPoliticFilter> get copyWith =>
      _$ChangeSearchPoliticFilterCopyWithImpl<ChangeSearchPoliticFilter>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result fetchPolitics(String userId),
    @required
        Result changeSearchPoliticFilter(
            String estado, String partido, String term),
    @required
        Result followUnfollowSearchPolitic(
            UserModel user, PoliticoModel politico),
    @required
        Result changeFollowPoliticStatus(
            PoliticoModel politico, bool isUserFollowingPolitic),
  }) {
    assert(fetchPolitics != null);
    assert(changeSearchPoliticFilter != null);
    assert(followUnfollowSearchPolitic != null);
    assert(changeFollowPoliticStatus != null);
    return changeSearchPoliticFilter(estado, partido, term);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result fetchPolitics(String userId),
    Result changeSearchPoliticFilter(
        String estado, String partido, String term),
    Result followUnfollowSearchPolitic(UserModel user, PoliticoModel politico),
    Result changeFollowPoliticStatus(
        PoliticoModel politico, bool isUserFollowingPolitic),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changeSearchPoliticFilter != null) {
      return changeSearchPoliticFilter(estado, partido, term);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result fetchPolitics(FetchPolitics value),
    @required Result changeSearchPoliticFilter(ChangeSearchPoliticFilter value),
    @required
        Result followUnfollowSearchPolitic(FollowUnfollowSearchPolitic value),
    @required Result changeFollowPoliticStatus(ChangeFollowPoliticStatus value),
  }) {
    assert(fetchPolitics != null);
    assert(changeSearchPoliticFilter != null);
    assert(followUnfollowSearchPolitic != null);
    assert(changeFollowPoliticStatus != null);
    return changeSearchPoliticFilter(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result fetchPolitics(FetchPolitics value),
    Result changeSearchPoliticFilter(ChangeSearchPoliticFilter value),
    Result followUnfollowSearchPolitic(FollowUnfollowSearchPolitic value),
    Result changeFollowPoliticStatus(ChangeFollowPoliticStatus value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changeSearchPoliticFilter != null) {
      return changeSearchPoliticFilter(this);
    }
    return orElse();
  }
}

abstract class ChangeSearchPoliticFilter implements SearchPoliticEvent {
  factory ChangeSearchPoliticFilter(
      {String estado,
      String partido,
      String term}) = _$ChangeSearchPoliticFilter;

  String get estado;
  String get partido;
  String get term;
  $ChangeSearchPoliticFilterCopyWith<ChangeSearchPoliticFilter> get copyWith;
}

abstract class $FollowUnfollowSearchPoliticCopyWith<$Res> {
  factory $FollowUnfollowSearchPoliticCopyWith(
          FollowUnfollowSearchPolitic value,
          $Res Function(FollowUnfollowSearchPolitic) then) =
      _$FollowUnfollowSearchPoliticCopyWithImpl<$Res>;
  $Res call({UserModel user, PoliticoModel politico});
}

class _$FollowUnfollowSearchPoliticCopyWithImpl<$Res>
    extends _$SearchPoliticEventCopyWithImpl<$Res>
    implements $FollowUnfollowSearchPoliticCopyWith<$Res> {
  _$FollowUnfollowSearchPoliticCopyWithImpl(FollowUnfollowSearchPolitic _value,
      $Res Function(FollowUnfollowSearchPolitic) _then)
      : super(_value, (v) => _then(v as FollowUnfollowSearchPolitic));

  @override
  FollowUnfollowSearchPolitic get _value =>
      super._value as FollowUnfollowSearchPolitic;

  @override
  $Res call({
    Object user = freezed,
    Object politico = freezed,
  }) {
    return _then(FollowUnfollowSearchPolitic(
      user: user == freezed ? _value.user : user as UserModel,
      politico:
          politico == freezed ? _value.politico : politico as PoliticoModel,
    ));
  }
}

class _$FollowUnfollowSearchPolitic implements FollowUnfollowSearchPolitic {
  _$FollowUnfollowSearchPolitic({@required this.user, @required this.politico})
      : assert(user != null),
        assert(politico != null);

  @override
  final UserModel user;
  @override
  final PoliticoModel politico;

  @override
  String toString() {
    return 'SearchPoliticEvent.followUnfollowSearchPolitic(user: $user, politico: $politico)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FollowUnfollowSearchPolitic &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.politico, politico) ||
                const DeepCollectionEquality()
                    .equals(other.politico, politico)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(politico);

  @override
  $FollowUnfollowSearchPoliticCopyWith<FollowUnfollowSearchPolitic>
      get copyWith => _$FollowUnfollowSearchPoliticCopyWithImpl<
          FollowUnfollowSearchPolitic>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result fetchPolitics(String userId),
    @required
        Result changeSearchPoliticFilter(
            String estado, String partido, String term),
    @required
        Result followUnfollowSearchPolitic(
            UserModel user, PoliticoModel politico),
    @required
        Result changeFollowPoliticStatus(
            PoliticoModel politico, bool isUserFollowingPolitic),
  }) {
    assert(fetchPolitics != null);
    assert(changeSearchPoliticFilter != null);
    assert(followUnfollowSearchPolitic != null);
    assert(changeFollowPoliticStatus != null);
    return followUnfollowSearchPolitic(user, politico);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result fetchPolitics(String userId),
    Result changeSearchPoliticFilter(
        String estado, String partido, String term),
    Result followUnfollowSearchPolitic(UserModel user, PoliticoModel politico),
    Result changeFollowPoliticStatus(
        PoliticoModel politico, bool isUserFollowingPolitic),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (followUnfollowSearchPolitic != null) {
      return followUnfollowSearchPolitic(user, politico);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result fetchPolitics(FetchPolitics value),
    @required Result changeSearchPoliticFilter(ChangeSearchPoliticFilter value),
    @required
        Result followUnfollowSearchPolitic(FollowUnfollowSearchPolitic value),
    @required Result changeFollowPoliticStatus(ChangeFollowPoliticStatus value),
  }) {
    assert(fetchPolitics != null);
    assert(changeSearchPoliticFilter != null);
    assert(followUnfollowSearchPolitic != null);
    assert(changeFollowPoliticStatus != null);
    return followUnfollowSearchPolitic(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result fetchPolitics(FetchPolitics value),
    Result changeSearchPoliticFilter(ChangeSearchPoliticFilter value),
    Result followUnfollowSearchPolitic(FollowUnfollowSearchPolitic value),
    Result changeFollowPoliticStatus(ChangeFollowPoliticStatus value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (followUnfollowSearchPolitic != null) {
      return followUnfollowSearchPolitic(this);
    }
    return orElse();
  }
}

abstract class FollowUnfollowSearchPolitic implements SearchPoliticEvent {
  factory FollowUnfollowSearchPolitic(
      {@required UserModel user,
      @required PoliticoModel politico}) = _$FollowUnfollowSearchPolitic;

  UserModel get user;
  PoliticoModel get politico;
  $FollowUnfollowSearchPoliticCopyWith<FollowUnfollowSearchPolitic>
      get copyWith;
}

abstract class $ChangeFollowPoliticStatusCopyWith<$Res> {
  factory $ChangeFollowPoliticStatusCopyWith(ChangeFollowPoliticStatus value,
          $Res Function(ChangeFollowPoliticStatus) then) =
      _$ChangeFollowPoliticStatusCopyWithImpl<$Res>;
  $Res call({PoliticoModel politico, bool isUserFollowingPolitic});
}

class _$ChangeFollowPoliticStatusCopyWithImpl<$Res>
    extends _$SearchPoliticEventCopyWithImpl<$Res>
    implements $ChangeFollowPoliticStatusCopyWith<$Res> {
  _$ChangeFollowPoliticStatusCopyWithImpl(ChangeFollowPoliticStatus _value,
      $Res Function(ChangeFollowPoliticStatus) _then)
      : super(_value, (v) => _then(v as ChangeFollowPoliticStatus));

  @override
  ChangeFollowPoliticStatus get _value =>
      super._value as ChangeFollowPoliticStatus;

  @override
  $Res call({
    Object politico = freezed,
    Object isUserFollowingPolitic = freezed,
  }) {
    return _then(ChangeFollowPoliticStatus(
      politico:
          politico == freezed ? _value.politico : politico as PoliticoModel,
      isUserFollowingPolitic: isUserFollowingPolitic == freezed
          ? _value.isUserFollowingPolitic
          : isUserFollowingPolitic as bool,
    ));
  }
}

class _$ChangeFollowPoliticStatus implements ChangeFollowPoliticStatus {
  _$ChangeFollowPoliticStatus(
      {@required this.politico, @required this.isUserFollowingPolitic})
      : assert(politico != null),
        assert(isUserFollowingPolitic != null);

  @override
  final PoliticoModel politico;
  @override
  final bool isUserFollowingPolitic;

  @override
  String toString() {
    return 'SearchPoliticEvent.changeFollowPoliticStatus(politico: $politico, isUserFollowingPolitic: $isUserFollowingPolitic)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeFollowPoliticStatus &&
            (identical(other.politico, politico) ||
                const DeepCollectionEquality()
                    .equals(other.politico, politico)) &&
            (identical(other.isUserFollowingPolitic, isUserFollowingPolitic) ||
                const DeepCollectionEquality().equals(
                    other.isUserFollowingPolitic, isUserFollowingPolitic)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(politico) ^
      const DeepCollectionEquality().hash(isUserFollowingPolitic);

  @override
  $ChangeFollowPoliticStatusCopyWith<ChangeFollowPoliticStatus> get copyWith =>
      _$ChangeFollowPoliticStatusCopyWithImpl<ChangeFollowPoliticStatus>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result fetchPolitics(String userId),
    @required
        Result changeSearchPoliticFilter(
            String estado, String partido, String term),
    @required
        Result followUnfollowSearchPolitic(
            UserModel user, PoliticoModel politico),
    @required
        Result changeFollowPoliticStatus(
            PoliticoModel politico, bool isUserFollowingPolitic),
  }) {
    assert(fetchPolitics != null);
    assert(changeSearchPoliticFilter != null);
    assert(followUnfollowSearchPolitic != null);
    assert(changeFollowPoliticStatus != null);
    return changeFollowPoliticStatus(politico, isUserFollowingPolitic);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result fetchPolitics(String userId),
    Result changeSearchPoliticFilter(
        String estado, String partido, String term),
    Result followUnfollowSearchPolitic(UserModel user, PoliticoModel politico),
    Result changeFollowPoliticStatus(
        PoliticoModel politico, bool isUserFollowingPolitic),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changeFollowPoliticStatus != null) {
      return changeFollowPoliticStatus(politico, isUserFollowingPolitic);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result fetchPolitics(FetchPolitics value),
    @required Result changeSearchPoliticFilter(ChangeSearchPoliticFilter value),
    @required
        Result followUnfollowSearchPolitic(FollowUnfollowSearchPolitic value),
    @required Result changeFollowPoliticStatus(ChangeFollowPoliticStatus value),
  }) {
    assert(fetchPolitics != null);
    assert(changeSearchPoliticFilter != null);
    assert(followUnfollowSearchPolitic != null);
    assert(changeFollowPoliticStatus != null);
    return changeFollowPoliticStatus(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result fetchPolitics(FetchPolitics value),
    Result changeSearchPoliticFilter(ChangeSearchPoliticFilter value),
    Result followUnfollowSearchPolitic(FollowUnfollowSearchPolitic value),
    Result changeFollowPoliticStatus(ChangeFollowPoliticStatus value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changeFollowPoliticStatus != null) {
      return changeFollowPoliticStatus(this);
    }
    return orElse();
  }
}

abstract class ChangeFollowPoliticStatus implements SearchPoliticEvent {
  factory ChangeFollowPoliticStatus(
      {@required PoliticoModel politico,
      @required bool isUserFollowingPolitic}) = _$ChangeFollowPoliticStatus;

  PoliticoModel get politico;
  bool get isUserFollowingPolitic;
  $ChangeFollowPoliticStatusCopyWith<ChangeFollowPoliticStatus> get copyWith;
}
