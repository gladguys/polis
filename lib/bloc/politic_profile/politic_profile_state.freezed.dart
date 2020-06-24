// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'politic_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PoliticProfileStateTearOff {
  const _$PoliticProfileStateTearOff();

  InitialPoliticProfileState initial() {
    return InitialPoliticProfileState();
  }

  GetPoliticInfoSuccess getPoliticInfoSuccess(
      {@required PoliticoModel politic,
      @required List<dynamic> lastActivities,
      @required int activitiesCount,
      @required bool isBeingFollowedByUser}) {
    return GetPoliticInfoSuccess(
      politic: politic,
      lastActivities: lastActivities,
      activitiesCount: activitiesCount,
      isBeingFollowedByUser: isBeingFollowedByUser,
    );
  }

  PoliticMoreActivitiesSuccess politicMoreActivitiesSuccess(
      {@required List<dynamic> activities}) {
    return PoliticMoreActivitiesSuccess(
      activities: activities,
    );
  }

  GetPoliticInfoFailed getPoliticInfoFailed() {
    return GetPoliticInfoFailed();
  }

  LoadingPoliticInfo loadingPoliticInfo() {
    return LoadingPoliticInfo();
  }

  UserFollowingPoliticChanged userFollowingPoliticChanged(
      {@required PoliticoModel politico,
      @required bool isUserFollowingPolitic}) {
    return UserFollowingPoliticChanged(
      politico: politico,
      isUserFollowingPolitic: isUserFollowingPolitic,
    );
  }

  FollowPoliticFailed followPoliticFailed() {
    return FollowPoliticFailed();
  }

  PoliticDontHaveValidEmail politicDontHaveValidEmail() {
    return PoliticDontHaveValidEmail();
  }

  OpenEmailIntentFailed openEmailIntentFailed() {
    return OpenEmailIntentFailed();
  }
}

// ignore: unused_element
const $PoliticProfileState = _$PoliticProfileStateTearOff();

mixin _$PoliticProfileState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result getPoliticInfoSuccess(
            PoliticoModel politic,
            List<dynamic> lastActivities,
            int activitiesCount,
            bool isBeingFollowedByUser),
    @required Result politicMoreActivitiesSuccess(List<dynamic> activities),
    @required Result getPoliticInfoFailed(),
    @required Result loadingPoliticInfo(),
    @required
        Result userFollowingPoliticChanged(
            PoliticoModel politico, bool isUserFollowingPolitic),
    @required Result followPoliticFailed(),
    @required Result politicDontHaveValidEmail(),
    @required Result openEmailIntentFailed(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getPoliticInfoSuccess(
        PoliticoModel politic,
        List<dynamic> lastActivities,
        int activitiesCount,
        bool isBeingFollowedByUser),
    Result politicMoreActivitiesSuccess(List<dynamic> activities),
    Result getPoliticInfoFailed(),
    Result loadingPoliticInfo(),
    Result userFollowingPoliticChanged(
        PoliticoModel politico, bool isUserFollowingPolitic),
    Result followPoliticFailed(),
    Result politicDontHaveValidEmail(),
    Result openEmailIntentFailed(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticProfileState value),
    @required Result getPoliticInfoSuccess(GetPoliticInfoSuccess value),
    @required
        Result politicMoreActivitiesSuccess(PoliticMoreActivitiesSuccess value),
    @required Result getPoliticInfoFailed(GetPoliticInfoFailed value),
    @required Result loadingPoliticInfo(LoadingPoliticInfo value),
    @required
        Result userFollowingPoliticChanged(UserFollowingPoliticChanged value),
    @required Result followPoliticFailed(FollowPoliticFailed value),
    @required Result politicDontHaveValidEmail(PoliticDontHaveValidEmail value),
    @required Result openEmailIntentFailed(OpenEmailIntentFailed value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticProfileState value),
    Result getPoliticInfoSuccess(GetPoliticInfoSuccess value),
    Result politicMoreActivitiesSuccess(PoliticMoreActivitiesSuccess value),
    Result getPoliticInfoFailed(GetPoliticInfoFailed value),
    Result loadingPoliticInfo(LoadingPoliticInfo value),
    Result userFollowingPoliticChanged(UserFollowingPoliticChanged value),
    Result followPoliticFailed(FollowPoliticFailed value),
    Result politicDontHaveValidEmail(PoliticDontHaveValidEmail value),
    Result openEmailIntentFailed(OpenEmailIntentFailed value),
    @required Result orElse(),
  });
}

abstract class $PoliticProfileStateCopyWith<$Res> {
  factory $PoliticProfileStateCopyWith(
          PoliticProfileState value, $Res Function(PoliticProfileState) then) =
      _$PoliticProfileStateCopyWithImpl<$Res>;
}

class _$PoliticProfileStateCopyWithImpl<$Res>
    implements $PoliticProfileStateCopyWith<$Res> {
  _$PoliticProfileStateCopyWithImpl(this._value, this._then);

  final PoliticProfileState _value;
  // ignore: unused_field
  final $Res Function(PoliticProfileState) _then;
}

abstract class $InitialPoliticProfileStateCopyWith<$Res> {
  factory $InitialPoliticProfileStateCopyWith(InitialPoliticProfileState value,
          $Res Function(InitialPoliticProfileState) then) =
      _$InitialPoliticProfileStateCopyWithImpl<$Res>;
}

class _$InitialPoliticProfileStateCopyWithImpl<$Res>
    extends _$PoliticProfileStateCopyWithImpl<$Res>
    implements $InitialPoliticProfileStateCopyWith<$Res> {
  _$InitialPoliticProfileStateCopyWithImpl(InitialPoliticProfileState _value,
      $Res Function(InitialPoliticProfileState) _then)
      : super(_value, (v) => _then(v as InitialPoliticProfileState));

  @override
  InitialPoliticProfileState get _value =>
      super._value as InitialPoliticProfileState;
}

class _$InitialPoliticProfileState implements InitialPoliticProfileState {
  _$InitialPoliticProfileState();

  @override
  String toString() {
    return 'PoliticProfileState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialPoliticProfileState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result getPoliticInfoSuccess(
            PoliticoModel politic,
            List<dynamic> lastActivities,
            int activitiesCount,
            bool isBeingFollowedByUser),
    @required Result politicMoreActivitiesSuccess(List<dynamic> activities),
    @required Result getPoliticInfoFailed(),
    @required Result loadingPoliticInfo(),
    @required
        Result userFollowingPoliticChanged(
            PoliticoModel politico, bool isUserFollowingPolitic),
    @required Result followPoliticFailed(),
    @required Result politicDontHaveValidEmail(),
    @required Result openEmailIntentFailed(),
  }) {
    assert(initial != null);
    assert(getPoliticInfoSuccess != null);
    assert(politicMoreActivitiesSuccess != null);
    assert(getPoliticInfoFailed != null);
    assert(loadingPoliticInfo != null);
    assert(userFollowingPoliticChanged != null);
    assert(followPoliticFailed != null);
    assert(politicDontHaveValidEmail != null);
    assert(openEmailIntentFailed != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getPoliticInfoSuccess(
        PoliticoModel politic,
        List<dynamic> lastActivities,
        int activitiesCount,
        bool isBeingFollowedByUser),
    Result politicMoreActivitiesSuccess(List<dynamic> activities),
    Result getPoliticInfoFailed(),
    Result loadingPoliticInfo(),
    Result userFollowingPoliticChanged(
        PoliticoModel politico, bool isUserFollowingPolitic),
    Result followPoliticFailed(),
    Result politicDontHaveValidEmail(),
    Result openEmailIntentFailed(),
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
    @required Result initial(InitialPoliticProfileState value),
    @required Result getPoliticInfoSuccess(GetPoliticInfoSuccess value),
    @required
        Result politicMoreActivitiesSuccess(PoliticMoreActivitiesSuccess value),
    @required Result getPoliticInfoFailed(GetPoliticInfoFailed value),
    @required Result loadingPoliticInfo(LoadingPoliticInfo value),
    @required
        Result userFollowingPoliticChanged(UserFollowingPoliticChanged value),
    @required Result followPoliticFailed(FollowPoliticFailed value),
    @required Result politicDontHaveValidEmail(PoliticDontHaveValidEmail value),
    @required Result openEmailIntentFailed(OpenEmailIntentFailed value),
  }) {
    assert(initial != null);
    assert(getPoliticInfoSuccess != null);
    assert(politicMoreActivitiesSuccess != null);
    assert(getPoliticInfoFailed != null);
    assert(loadingPoliticInfo != null);
    assert(userFollowingPoliticChanged != null);
    assert(followPoliticFailed != null);
    assert(politicDontHaveValidEmail != null);
    assert(openEmailIntentFailed != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticProfileState value),
    Result getPoliticInfoSuccess(GetPoliticInfoSuccess value),
    Result politicMoreActivitiesSuccess(PoliticMoreActivitiesSuccess value),
    Result getPoliticInfoFailed(GetPoliticInfoFailed value),
    Result loadingPoliticInfo(LoadingPoliticInfo value),
    Result userFollowingPoliticChanged(UserFollowingPoliticChanged value),
    Result followPoliticFailed(FollowPoliticFailed value),
    Result politicDontHaveValidEmail(PoliticDontHaveValidEmail value),
    Result openEmailIntentFailed(OpenEmailIntentFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialPoliticProfileState implements PoliticProfileState {
  factory InitialPoliticProfileState() = _$InitialPoliticProfileState;
}

abstract class $GetPoliticInfoSuccessCopyWith<$Res> {
  factory $GetPoliticInfoSuccessCopyWith(GetPoliticInfoSuccess value,
          $Res Function(GetPoliticInfoSuccess) then) =
      _$GetPoliticInfoSuccessCopyWithImpl<$Res>;
  $Res call(
      {PoliticoModel politic,
      List<dynamic> lastActivities,
      int activitiesCount,
      bool isBeingFollowedByUser});
}

class _$GetPoliticInfoSuccessCopyWithImpl<$Res>
    extends _$PoliticProfileStateCopyWithImpl<$Res>
    implements $GetPoliticInfoSuccessCopyWith<$Res> {
  _$GetPoliticInfoSuccessCopyWithImpl(
      GetPoliticInfoSuccess _value, $Res Function(GetPoliticInfoSuccess) _then)
      : super(_value, (v) => _then(v as GetPoliticInfoSuccess));

  @override
  GetPoliticInfoSuccess get _value => super._value as GetPoliticInfoSuccess;

  @override
  $Res call({
    Object politic = freezed,
    Object lastActivities = freezed,
    Object activitiesCount = freezed,
    Object isBeingFollowedByUser = freezed,
  }) {
    return _then(GetPoliticInfoSuccess(
      politic: politic == freezed ? _value.politic : politic as PoliticoModel,
      lastActivities: lastActivities == freezed
          ? _value.lastActivities
          : lastActivities as List<dynamic>,
      activitiesCount: activitiesCount == freezed
          ? _value.activitiesCount
          : activitiesCount as int,
      isBeingFollowedByUser: isBeingFollowedByUser == freezed
          ? _value.isBeingFollowedByUser
          : isBeingFollowedByUser as bool,
    ));
  }
}

class _$GetPoliticInfoSuccess implements GetPoliticInfoSuccess {
  _$GetPoliticInfoSuccess(
      {@required this.politic,
      @required this.lastActivities,
      @required this.activitiesCount,
      @required this.isBeingFollowedByUser})
      : assert(politic != null),
        assert(lastActivities != null),
        assert(activitiesCount != null),
        assert(isBeingFollowedByUser != null);

  @override
  final PoliticoModel politic;
  @override
  final List<dynamic> lastActivities;
  @override
  final int activitiesCount;
  @override
  final bool isBeingFollowedByUser;

  @override
  String toString() {
    return 'PoliticProfileState.getPoliticInfoSuccess(politic: $politic, lastActivities: $lastActivities, activitiesCount: $activitiesCount, isBeingFollowedByUser: $isBeingFollowedByUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetPoliticInfoSuccess &&
            (identical(other.politic, politic) ||
                const DeepCollectionEquality()
                    .equals(other.politic, politic)) &&
            (identical(other.lastActivities, lastActivities) ||
                const DeepCollectionEquality()
                    .equals(other.lastActivities, lastActivities)) &&
            (identical(other.activitiesCount, activitiesCount) ||
                const DeepCollectionEquality()
                    .equals(other.activitiesCount, activitiesCount)) &&
            (identical(other.isBeingFollowedByUser, isBeingFollowedByUser) ||
                const DeepCollectionEquality().equals(
                    other.isBeingFollowedByUser, isBeingFollowedByUser)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(politic) ^
      const DeepCollectionEquality().hash(lastActivities) ^
      const DeepCollectionEquality().hash(activitiesCount) ^
      const DeepCollectionEquality().hash(isBeingFollowedByUser);

  @override
  $GetPoliticInfoSuccessCopyWith<GetPoliticInfoSuccess> get copyWith =>
      _$GetPoliticInfoSuccessCopyWithImpl<GetPoliticInfoSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result getPoliticInfoSuccess(
            PoliticoModel politic,
            List<dynamic> lastActivities,
            int activitiesCount,
            bool isBeingFollowedByUser),
    @required Result politicMoreActivitiesSuccess(List<dynamic> activities),
    @required Result getPoliticInfoFailed(),
    @required Result loadingPoliticInfo(),
    @required
        Result userFollowingPoliticChanged(
            PoliticoModel politico, bool isUserFollowingPolitic),
    @required Result followPoliticFailed(),
    @required Result politicDontHaveValidEmail(),
    @required Result openEmailIntentFailed(),
  }) {
    assert(initial != null);
    assert(getPoliticInfoSuccess != null);
    assert(politicMoreActivitiesSuccess != null);
    assert(getPoliticInfoFailed != null);
    assert(loadingPoliticInfo != null);
    assert(userFollowingPoliticChanged != null);
    assert(followPoliticFailed != null);
    assert(politicDontHaveValidEmail != null);
    assert(openEmailIntentFailed != null);
    return getPoliticInfoSuccess(
        politic, lastActivities, activitiesCount, isBeingFollowedByUser);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getPoliticInfoSuccess(
        PoliticoModel politic,
        List<dynamic> lastActivities,
        int activitiesCount,
        bool isBeingFollowedByUser),
    Result politicMoreActivitiesSuccess(List<dynamic> activities),
    Result getPoliticInfoFailed(),
    Result loadingPoliticInfo(),
    Result userFollowingPoliticChanged(
        PoliticoModel politico, bool isUserFollowingPolitic),
    Result followPoliticFailed(),
    Result politicDontHaveValidEmail(),
    Result openEmailIntentFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPoliticInfoSuccess != null) {
      return getPoliticInfoSuccess(
          politic, lastActivities, activitiesCount, isBeingFollowedByUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticProfileState value),
    @required Result getPoliticInfoSuccess(GetPoliticInfoSuccess value),
    @required
        Result politicMoreActivitiesSuccess(PoliticMoreActivitiesSuccess value),
    @required Result getPoliticInfoFailed(GetPoliticInfoFailed value),
    @required Result loadingPoliticInfo(LoadingPoliticInfo value),
    @required
        Result userFollowingPoliticChanged(UserFollowingPoliticChanged value),
    @required Result followPoliticFailed(FollowPoliticFailed value),
    @required Result politicDontHaveValidEmail(PoliticDontHaveValidEmail value),
    @required Result openEmailIntentFailed(OpenEmailIntentFailed value),
  }) {
    assert(initial != null);
    assert(getPoliticInfoSuccess != null);
    assert(politicMoreActivitiesSuccess != null);
    assert(getPoliticInfoFailed != null);
    assert(loadingPoliticInfo != null);
    assert(userFollowingPoliticChanged != null);
    assert(followPoliticFailed != null);
    assert(politicDontHaveValidEmail != null);
    assert(openEmailIntentFailed != null);
    return getPoliticInfoSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticProfileState value),
    Result getPoliticInfoSuccess(GetPoliticInfoSuccess value),
    Result politicMoreActivitiesSuccess(PoliticMoreActivitiesSuccess value),
    Result getPoliticInfoFailed(GetPoliticInfoFailed value),
    Result loadingPoliticInfo(LoadingPoliticInfo value),
    Result userFollowingPoliticChanged(UserFollowingPoliticChanged value),
    Result followPoliticFailed(FollowPoliticFailed value),
    Result politicDontHaveValidEmail(PoliticDontHaveValidEmail value),
    Result openEmailIntentFailed(OpenEmailIntentFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPoliticInfoSuccess != null) {
      return getPoliticInfoSuccess(this);
    }
    return orElse();
  }
}

abstract class GetPoliticInfoSuccess implements PoliticProfileState {
  factory GetPoliticInfoSuccess(
      {@required PoliticoModel politic,
      @required List<dynamic> lastActivities,
      @required int activitiesCount,
      @required bool isBeingFollowedByUser}) = _$GetPoliticInfoSuccess;

  PoliticoModel get politic;
  List<dynamic> get lastActivities;
  int get activitiesCount;
  bool get isBeingFollowedByUser;
  $GetPoliticInfoSuccessCopyWith<GetPoliticInfoSuccess> get copyWith;
}

abstract class $PoliticMoreActivitiesSuccessCopyWith<$Res> {
  factory $PoliticMoreActivitiesSuccessCopyWith(
          PoliticMoreActivitiesSuccess value,
          $Res Function(PoliticMoreActivitiesSuccess) then) =
      _$PoliticMoreActivitiesSuccessCopyWithImpl<$Res>;
  $Res call({List<dynamic> activities});
}

class _$PoliticMoreActivitiesSuccessCopyWithImpl<$Res>
    extends _$PoliticProfileStateCopyWithImpl<$Res>
    implements $PoliticMoreActivitiesSuccessCopyWith<$Res> {
  _$PoliticMoreActivitiesSuccessCopyWithImpl(
      PoliticMoreActivitiesSuccess _value,
      $Res Function(PoliticMoreActivitiesSuccess) _then)
      : super(_value, (v) => _then(v as PoliticMoreActivitiesSuccess));

  @override
  PoliticMoreActivitiesSuccess get _value =>
      super._value as PoliticMoreActivitiesSuccess;

  @override
  $Res call({
    Object activities = freezed,
  }) {
    return _then(PoliticMoreActivitiesSuccess(
      activities: activities == freezed
          ? _value.activities
          : activities as List<dynamic>,
    ));
  }
}

class _$PoliticMoreActivitiesSuccess implements PoliticMoreActivitiesSuccess {
  _$PoliticMoreActivitiesSuccess({@required this.activities})
      : assert(activities != null);

  @override
  final List<dynamic> activities;

  @override
  String toString() {
    return 'PoliticProfileState.politicMoreActivitiesSuccess(activities: $activities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PoliticMoreActivitiesSuccess &&
            (identical(other.activities, activities) ||
                const DeepCollectionEquality()
                    .equals(other.activities, activities)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(activities);

  @override
  $PoliticMoreActivitiesSuccessCopyWith<PoliticMoreActivitiesSuccess>
      get copyWith => _$PoliticMoreActivitiesSuccessCopyWithImpl<
          PoliticMoreActivitiesSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result getPoliticInfoSuccess(
            PoliticoModel politic,
            List<dynamic> lastActivities,
            int activitiesCount,
            bool isBeingFollowedByUser),
    @required Result politicMoreActivitiesSuccess(List<dynamic> activities),
    @required Result getPoliticInfoFailed(),
    @required Result loadingPoliticInfo(),
    @required
        Result userFollowingPoliticChanged(
            PoliticoModel politico, bool isUserFollowingPolitic),
    @required Result followPoliticFailed(),
    @required Result politicDontHaveValidEmail(),
    @required Result openEmailIntentFailed(),
  }) {
    assert(initial != null);
    assert(getPoliticInfoSuccess != null);
    assert(politicMoreActivitiesSuccess != null);
    assert(getPoliticInfoFailed != null);
    assert(loadingPoliticInfo != null);
    assert(userFollowingPoliticChanged != null);
    assert(followPoliticFailed != null);
    assert(politicDontHaveValidEmail != null);
    assert(openEmailIntentFailed != null);
    return politicMoreActivitiesSuccess(activities);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getPoliticInfoSuccess(
        PoliticoModel politic,
        List<dynamic> lastActivities,
        int activitiesCount,
        bool isBeingFollowedByUser),
    Result politicMoreActivitiesSuccess(List<dynamic> activities),
    Result getPoliticInfoFailed(),
    Result loadingPoliticInfo(),
    Result userFollowingPoliticChanged(
        PoliticoModel politico, bool isUserFollowingPolitic),
    Result followPoliticFailed(),
    Result politicDontHaveValidEmail(),
    Result openEmailIntentFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (politicMoreActivitiesSuccess != null) {
      return politicMoreActivitiesSuccess(activities);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticProfileState value),
    @required Result getPoliticInfoSuccess(GetPoliticInfoSuccess value),
    @required
        Result politicMoreActivitiesSuccess(PoliticMoreActivitiesSuccess value),
    @required Result getPoliticInfoFailed(GetPoliticInfoFailed value),
    @required Result loadingPoliticInfo(LoadingPoliticInfo value),
    @required
        Result userFollowingPoliticChanged(UserFollowingPoliticChanged value),
    @required Result followPoliticFailed(FollowPoliticFailed value),
    @required Result politicDontHaveValidEmail(PoliticDontHaveValidEmail value),
    @required Result openEmailIntentFailed(OpenEmailIntentFailed value),
  }) {
    assert(initial != null);
    assert(getPoliticInfoSuccess != null);
    assert(politicMoreActivitiesSuccess != null);
    assert(getPoliticInfoFailed != null);
    assert(loadingPoliticInfo != null);
    assert(userFollowingPoliticChanged != null);
    assert(followPoliticFailed != null);
    assert(politicDontHaveValidEmail != null);
    assert(openEmailIntentFailed != null);
    return politicMoreActivitiesSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticProfileState value),
    Result getPoliticInfoSuccess(GetPoliticInfoSuccess value),
    Result politicMoreActivitiesSuccess(PoliticMoreActivitiesSuccess value),
    Result getPoliticInfoFailed(GetPoliticInfoFailed value),
    Result loadingPoliticInfo(LoadingPoliticInfo value),
    Result userFollowingPoliticChanged(UserFollowingPoliticChanged value),
    Result followPoliticFailed(FollowPoliticFailed value),
    Result politicDontHaveValidEmail(PoliticDontHaveValidEmail value),
    Result openEmailIntentFailed(OpenEmailIntentFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (politicMoreActivitiesSuccess != null) {
      return politicMoreActivitiesSuccess(this);
    }
    return orElse();
  }
}

abstract class PoliticMoreActivitiesSuccess implements PoliticProfileState {
  factory PoliticMoreActivitiesSuccess({@required List<dynamic> activities}) =
      _$PoliticMoreActivitiesSuccess;

  List<dynamic> get activities;
  $PoliticMoreActivitiesSuccessCopyWith<PoliticMoreActivitiesSuccess>
      get copyWith;
}

abstract class $GetPoliticInfoFailedCopyWith<$Res> {
  factory $GetPoliticInfoFailedCopyWith(GetPoliticInfoFailed value,
          $Res Function(GetPoliticInfoFailed) then) =
      _$GetPoliticInfoFailedCopyWithImpl<$Res>;
}

class _$GetPoliticInfoFailedCopyWithImpl<$Res>
    extends _$PoliticProfileStateCopyWithImpl<$Res>
    implements $GetPoliticInfoFailedCopyWith<$Res> {
  _$GetPoliticInfoFailedCopyWithImpl(
      GetPoliticInfoFailed _value, $Res Function(GetPoliticInfoFailed) _then)
      : super(_value, (v) => _then(v as GetPoliticInfoFailed));

  @override
  GetPoliticInfoFailed get _value => super._value as GetPoliticInfoFailed;
}

class _$GetPoliticInfoFailed implements GetPoliticInfoFailed {
  _$GetPoliticInfoFailed();

  @override
  String toString() {
    return 'PoliticProfileState.getPoliticInfoFailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetPoliticInfoFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result getPoliticInfoSuccess(
            PoliticoModel politic,
            List<dynamic> lastActivities,
            int activitiesCount,
            bool isBeingFollowedByUser),
    @required Result politicMoreActivitiesSuccess(List<dynamic> activities),
    @required Result getPoliticInfoFailed(),
    @required Result loadingPoliticInfo(),
    @required
        Result userFollowingPoliticChanged(
            PoliticoModel politico, bool isUserFollowingPolitic),
    @required Result followPoliticFailed(),
    @required Result politicDontHaveValidEmail(),
    @required Result openEmailIntentFailed(),
  }) {
    assert(initial != null);
    assert(getPoliticInfoSuccess != null);
    assert(politicMoreActivitiesSuccess != null);
    assert(getPoliticInfoFailed != null);
    assert(loadingPoliticInfo != null);
    assert(userFollowingPoliticChanged != null);
    assert(followPoliticFailed != null);
    assert(politicDontHaveValidEmail != null);
    assert(openEmailIntentFailed != null);
    return getPoliticInfoFailed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getPoliticInfoSuccess(
        PoliticoModel politic,
        List<dynamic> lastActivities,
        int activitiesCount,
        bool isBeingFollowedByUser),
    Result politicMoreActivitiesSuccess(List<dynamic> activities),
    Result getPoliticInfoFailed(),
    Result loadingPoliticInfo(),
    Result userFollowingPoliticChanged(
        PoliticoModel politico, bool isUserFollowingPolitic),
    Result followPoliticFailed(),
    Result politicDontHaveValidEmail(),
    Result openEmailIntentFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPoliticInfoFailed != null) {
      return getPoliticInfoFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticProfileState value),
    @required Result getPoliticInfoSuccess(GetPoliticInfoSuccess value),
    @required
        Result politicMoreActivitiesSuccess(PoliticMoreActivitiesSuccess value),
    @required Result getPoliticInfoFailed(GetPoliticInfoFailed value),
    @required Result loadingPoliticInfo(LoadingPoliticInfo value),
    @required
        Result userFollowingPoliticChanged(UserFollowingPoliticChanged value),
    @required Result followPoliticFailed(FollowPoliticFailed value),
    @required Result politicDontHaveValidEmail(PoliticDontHaveValidEmail value),
    @required Result openEmailIntentFailed(OpenEmailIntentFailed value),
  }) {
    assert(initial != null);
    assert(getPoliticInfoSuccess != null);
    assert(politicMoreActivitiesSuccess != null);
    assert(getPoliticInfoFailed != null);
    assert(loadingPoliticInfo != null);
    assert(userFollowingPoliticChanged != null);
    assert(followPoliticFailed != null);
    assert(politicDontHaveValidEmail != null);
    assert(openEmailIntentFailed != null);
    return getPoliticInfoFailed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticProfileState value),
    Result getPoliticInfoSuccess(GetPoliticInfoSuccess value),
    Result politicMoreActivitiesSuccess(PoliticMoreActivitiesSuccess value),
    Result getPoliticInfoFailed(GetPoliticInfoFailed value),
    Result loadingPoliticInfo(LoadingPoliticInfo value),
    Result userFollowingPoliticChanged(UserFollowingPoliticChanged value),
    Result followPoliticFailed(FollowPoliticFailed value),
    Result politicDontHaveValidEmail(PoliticDontHaveValidEmail value),
    Result openEmailIntentFailed(OpenEmailIntentFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPoliticInfoFailed != null) {
      return getPoliticInfoFailed(this);
    }
    return orElse();
  }
}

abstract class GetPoliticInfoFailed implements PoliticProfileState {
  factory GetPoliticInfoFailed() = _$GetPoliticInfoFailed;
}

abstract class $LoadingPoliticInfoCopyWith<$Res> {
  factory $LoadingPoliticInfoCopyWith(
          LoadingPoliticInfo value, $Res Function(LoadingPoliticInfo) then) =
      _$LoadingPoliticInfoCopyWithImpl<$Res>;
}

class _$LoadingPoliticInfoCopyWithImpl<$Res>
    extends _$PoliticProfileStateCopyWithImpl<$Res>
    implements $LoadingPoliticInfoCopyWith<$Res> {
  _$LoadingPoliticInfoCopyWithImpl(
      LoadingPoliticInfo _value, $Res Function(LoadingPoliticInfo) _then)
      : super(_value, (v) => _then(v as LoadingPoliticInfo));

  @override
  LoadingPoliticInfo get _value => super._value as LoadingPoliticInfo;
}

class _$LoadingPoliticInfo implements LoadingPoliticInfo {
  _$LoadingPoliticInfo();

  @override
  String toString() {
    return 'PoliticProfileState.loadingPoliticInfo()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadingPoliticInfo);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result getPoliticInfoSuccess(
            PoliticoModel politic,
            List<dynamic> lastActivities,
            int activitiesCount,
            bool isBeingFollowedByUser),
    @required Result politicMoreActivitiesSuccess(List<dynamic> activities),
    @required Result getPoliticInfoFailed(),
    @required Result loadingPoliticInfo(),
    @required
        Result userFollowingPoliticChanged(
            PoliticoModel politico, bool isUserFollowingPolitic),
    @required Result followPoliticFailed(),
    @required Result politicDontHaveValidEmail(),
    @required Result openEmailIntentFailed(),
  }) {
    assert(initial != null);
    assert(getPoliticInfoSuccess != null);
    assert(politicMoreActivitiesSuccess != null);
    assert(getPoliticInfoFailed != null);
    assert(loadingPoliticInfo != null);
    assert(userFollowingPoliticChanged != null);
    assert(followPoliticFailed != null);
    assert(politicDontHaveValidEmail != null);
    assert(openEmailIntentFailed != null);
    return loadingPoliticInfo();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getPoliticInfoSuccess(
        PoliticoModel politic,
        List<dynamic> lastActivities,
        int activitiesCount,
        bool isBeingFollowedByUser),
    Result politicMoreActivitiesSuccess(List<dynamic> activities),
    Result getPoliticInfoFailed(),
    Result loadingPoliticInfo(),
    Result userFollowingPoliticChanged(
        PoliticoModel politico, bool isUserFollowingPolitic),
    Result followPoliticFailed(),
    Result politicDontHaveValidEmail(),
    Result openEmailIntentFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingPoliticInfo != null) {
      return loadingPoliticInfo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticProfileState value),
    @required Result getPoliticInfoSuccess(GetPoliticInfoSuccess value),
    @required
        Result politicMoreActivitiesSuccess(PoliticMoreActivitiesSuccess value),
    @required Result getPoliticInfoFailed(GetPoliticInfoFailed value),
    @required Result loadingPoliticInfo(LoadingPoliticInfo value),
    @required
        Result userFollowingPoliticChanged(UserFollowingPoliticChanged value),
    @required Result followPoliticFailed(FollowPoliticFailed value),
    @required Result politicDontHaveValidEmail(PoliticDontHaveValidEmail value),
    @required Result openEmailIntentFailed(OpenEmailIntentFailed value),
  }) {
    assert(initial != null);
    assert(getPoliticInfoSuccess != null);
    assert(politicMoreActivitiesSuccess != null);
    assert(getPoliticInfoFailed != null);
    assert(loadingPoliticInfo != null);
    assert(userFollowingPoliticChanged != null);
    assert(followPoliticFailed != null);
    assert(politicDontHaveValidEmail != null);
    assert(openEmailIntentFailed != null);
    return loadingPoliticInfo(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticProfileState value),
    Result getPoliticInfoSuccess(GetPoliticInfoSuccess value),
    Result politicMoreActivitiesSuccess(PoliticMoreActivitiesSuccess value),
    Result getPoliticInfoFailed(GetPoliticInfoFailed value),
    Result loadingPoliticInfo(LoadingPoliticInfo value),
    Result userFollowingPoliticChanged(UserFollowingPoliticChanged value),
    Result followPoliticFailed(FollowPoliticFailed value),
    Result politicDontHaveValidEmail(PoliticDontHaveValidEmail value),
    Result openEmailIntentFailed(OpenEmailIntentFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingPoliticInfo != null) {
      return loadingPoliticInfo(this);
    }
    return orElse();
  }
}

abstract class LoadingPoliticInfo implements PoliticProfileState {
  factory LoadingPoliticInfo() = _$LoadingPoliticInfo;
}

abstract class $UserFollowingPoliticChangedCopyWith<$Res> {
  factory $UserFollowingPoliticChangedCopyWith(
          UserFollowingPoliticChanged value,
          $Res Function(UserFollowingPoliticChanged) then) =
      _$UserFollowingPoliticChangedCopyWithImpl<$Res>;
  $Res call({PoliticoModel politico, bool isUserFollowingPolitic});
}

class _$UserFollowingPoliticChangedCopyWithImpl<$Res>
    extends _$PoliticProfileStateCopyWithImpl<$Res>
    implements $UserFollowingPoliticChangedCopyWith<$Res> {
  _$UserFollowingPoliticChangedCopyWithImpl(UserFollowingPoliticChanged _value,
      $Res Function(UserFollowingPoliticChanged) _then)
      : super(_value, (v) => _then(v as UserFollowingPoliticChanged));

  @override
  UserFollowingPoliticChanged get _value =>
      super._value as UserFollowingPoliticChanged;

  @override
  $Res call({
    Object politico = freezed,
    Object isUserFollowingPolitic = freezed,
  }) {
    return _then(UserFollowingPoliticChanged(
      politico:
          politico == freezed ? _value.politico : politico as PoliticoModel,
      isUserFollowingPolitic: isUserFollowingPolitic == freezed
          ? _value.isUserFollowingPolitic
          : isUserFollowingPolitic as bool,
    ));
  }
}

class _$UserFollowingPoliticChanged implements UserFollowingPoliticChanged {
  _$UserFollowingPoliticChanged(
      {@required this.politico, @required this.isUserFollowingPolitic})
      : assert(politico != null),
        assert(isUserFollowingPolitic != null);

  @override
  final PoliticoModel politico;
  @override
  final bool isUserFollowingPolitic;

  @override
  String toString() {
    return 'PoliticProfileState.userFollowingPoliticChanged(politico: $politico, isUserFollowingPolitic: $isUserFollowingPolitic)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserFollowingPoliticChanged &&
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
  $UserFollowingPoliticChangedCopyWith<UserFollowingPoliticChanged>
      get copyWith => _$UserFollowingPoliticChangedCopyWithImpl<
          UserFollowingPoliticChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result getPoliticInfoSuccess(
            PoliticoModel politic,
            List<dynamic> lastActivities,
            int activitiesCount,
            bool isBeingFollowedByUser),
    @required Result politicMoreActivitiesSuccess(List<dynamic> activities),
    @required Result getPoliticInfoFailed(),
    @required Result loadingPoliticInfo(),
    @required
        Result userFollowingPoliticChanged(
            PoliticoModel politico, bool isUserFollowingPolitic),
    @required Result followPoliticFailed(),
    @required Result politicDontHaveValidEmail(),
    @required Result openEmailIntentFailed(),
  }) {
    assert(initial != null);
    assert(getPoliticInfoSuccess != null);
    assert(politicMoreActivitiesSuccess != null);
    assert(getPoliticInfoFailed != null);
    assert(loadingPoliticInfo != null);
    assert(userFollowingPoliticChanged != null);
    assert(followPoliticFailed != null);
    assert(politicDontHaveValidEmail != null);
    assert(openEmailIntentFailed != null);
    return userFollowingPoliticChanged(politico, isUserFollowingPolitic);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getPoliticInfoSuccess(
        PoliticoModel politic,
        List<dynamic> lastActivities,
        int activitiesCount,
        bool isBeingFollowedByUser),
    Result politicMoreActivitiesSuccess(List<dynamic> activities),
    Result getPoliticInfoFailed(),
    Result loadingPoliticInfo(),
    Result userFollowingPoliticChanged(
        PoliticoModel politico, bool isUserFollowingPolitic),
    Result followPoliticFailed(),
    Result politicDontHaveValidEmail(),
    Result openEmailIntentFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userFollowingPoliticChanged != null) {
      return userFollowingPoliticChanged(politico, isUserFollowingPolitic);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticProfileState value),
    @required Result getPoliticInfoSuccess(GetPoliticInfoSuccess value),
    @required
        Result politicMoreActivitiesSuccess(PoliticMoreActivitiesSuccess value),
    @required Result getPoliticInfoFailed(GetPoliticInfoFailed value),
    @required Result loadingPoliticInfo(LoadingPoliticInfo value),
    @required
        Result userFollowingPoliticChanged(UserFollowingPoliticChanged value),
    @required Result followPoliticFailed(FollowPoliticFailed value),
    @required Result politicDontHaveValidEmail(PoliticDontHaveValidEmail value),
    @required Result openEmailIntentFailed(OpenEmailIntentFailed value),
  }) {
    assert(initial != null);
    assert(getPoliticInfoSuccess != null);
    assert(politicMoreActivitiesSuccess != null);
    assert(getPoliticInfoFailed != null);
    assert(loadingPoliticInfo != null);
    assert(userFollowingPoliticChanged != null);
    assert(followPoliticFailed != null);
    assert(politicDontHaveValidEmail != null);
    assert(openEmailIntentFailed != null);
    return userFollowingPoliticChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticProfileState value),
    Result getPoliticInfoSuccess(GetPoliticInfoSuccess value),
    Result politicMoreActivitiesSuccess(PoliticMoreActivitiesSuccess value),
    Result getPoliticInfoFailed(GetPoliticInfoFailed value),
    Result loadingPoliticInfo(LoadingPoliticInfo value),
    Result userFollowingPoliticChanged(UserFollowingPoliticChanged value),
    Result followPoliticFailed(FollowPoliticFailed value),
    Result politicDontHaveValidEmail(PoliticDontHaveValidEmail value),
    Result openEmailIntentFailed(OpenEmailIntentFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userFollowingPoliticChanged != null) {
      return userFollowingPoliticChanged(this);
    }
    return orElse();
  }
}

abstract class UserFollowingPoliticChanged implements PoliticProfileState {
  factory UserFollowingPoliticChanged(
      {@required PoliticoModel politico,
      @required bool isUserFollowingPolitic}) = _$UserFollowingPoliticChanged;

  PoliticoModel get politico;
  bool get isUserFollowingPolitic;
  $UserFollowingPoliticChangedCopyWith<UserFollowingPoliticChanged>
      get copyWith;
}

abstract class $FollowPoliticFailedCopyWith<$Res> {
  factory $FollowPoliticFailedCopyWith(
          FollowPoliticFailed value, $Res Function(FollowPoliticFailed) then) =
      _$FollowPoliticFailedCopyWithImpl<$Res>;
}

class _$FollowPoliticFailedCopyWithImpl<$Res>
    extends _$PoliticProfileStateCopyWithImpl<$Res>
    implements $FollowPoliticFailedCopyWith<$Res> {
  _$FollowPoliticFailedCopyWithImpl(
      FollowPoliticFailed _value, $Res Function(FollowPoliticFailed) _then)
      : super(_value, (v) => _then(v as FollowPoliticFailed));

  @override
  FollowPoliticFailed get _value => super._value as FollowPoliticFailed;
}

class _$FollowPoliticFailed implements FollowPoliticFailed {
  _$FollowPoliticFailed();

  @override
  String toString() {
    return 'PoliticProfileState.followPoliticFailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FollowPoliticFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result getPoliticInfoSuccess(
            PoliticoModel politic,
            List<dynamic> lastActivities,
            int activitiesCount,
            bool isBeingFollowedByUser),
    @required Result politicMoreActivitiesSuccess(List<dynamic> activities),
    @required Result getPoliticInfoFailed(),
    @required Result loadingPoliticInfo(),
    @required
        Result userFollowingPoliticChanged(
            PoliticoModel politico, bool isUserFollowingPolitic),
    @required Result followPoliticFailed(),
    @required Result politicDontHaveValidEmail(),
    @required Result openEmailIntentFailed(),
  }) {
    assert(initial != null);
    assert(getPoliticInfoSuccess != null);
    assert(politicMoreActivitiesSuccess != null);
    assert(getPoliticInfoFailed != null);
    assert(loadingPoliticInfo != null);
    assert(userFollowingPoliticChanged != null);
    assert(followPoliticFailed != null);
    assert(politicDontHaveValidEmail != null);
    assert(openEmailIntentFailed != null);
    return followPoliticFailed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getPoliticInfoSuccess(
        PoliticoModel politic,
        List<dynamic> lastActivities,
        int activitiesCount,
        bool isBeingFollowedByUser),
    Result politicMoreActivitiesSuccess(List<dynamic> activities),
    Result getPoliticInfoFailed(),
    Result loadingPoliticInfo(),
    Result userFollowingPoliticChanged(
        PoliticoModel politico, bool isUserFollowingPolitic),
    Result followPoliticFailed(),
    Result politicDontHaveValidEmail(),
    Result openEmailIntentFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (followPoliticFailed != null) {
      return followPoliticFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticProfileState value),
    @required Result getPoliticInfoSuccess(GetPoliticInfoSuccess value),
    @required
        Result politicMoreActivitiesSuccess(PoliticMoreActivitiesSuccess value),
    @required Result getPoliticInfoFailed(GetPoliticInfoFailed value),
    @required Result loadingPoliticInfo(LoadingPoliticInfo value),
    @required
        Result userFollowingPoliticChanged(UserFollowingPoliticChanged value),
    @required Result followPoliticFailed(FollowPoliticFailed value),
    @required Result politicDontHaveValidEmail(PoliticDontHaveValidEmail value),
    @required Result openEmailIntentFailed(OpenEmailIntentFailed value),
  }) {
    assert(initial != null);
    assert(getPoliticInfoSuccess != null);
    assert(politicMoreActivitiesSuccess != null);
    assert(getPoliticInfoFailed != null);
    assert(loadingPoliticInfo != null);
    assert(userFollowingPoliticChanged != null);
    assert(followPoliticFailed != null);
    assert(politicDontHaveValidEmail != null);
    assert(openEmailIntentFailed != null);
    return followPoliticFailed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticProfileState value),
    Result getPoliticInfoSuccess(GetPoliticInfoSuccess value),
    Result politicMoreActivitiesSuccess(PoliticMoreActivitiesSuccess value),
    Result getPoliticInfoFailed(GetPoliticInfoFailed value),
    Result loadingPoliticInfo(LoadingPoliticInfo value),
    Result userFollowingPoliticChanged(UserFollowingPoliticChanged value),
    Result followPoliticFailed(FollowPoliticFailed value),
    Result politicDontHaveValidEmail(PoliticDontHaveValidEmail value),
    Result openEmailIntentFailed(OpenEmailIntentFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (followPoliticFailed != null) {
      return followPoliticFailed(this);
    }
    return orElse();
  }
}

abstract class FollowPoliticFailed implements PoliticProfileState {
  factory FollowPoliticFailed() = _$FollowPoliticFailed;
}

abstract class $PoliticDontHaveValidEmailCopyWith<$Res> {
  factory $PoliticDontHaveValidEmailCopyWith(PoliticDontHaveValidEmail value,
          $Res Function(PoliticDontHaveValidEmail) then) =
      _$PoliticDontHaveValidEmailCopyWithImpl<$Res>;
}

class _$PoliticDontHaveValidEmailCopyWithImpl<$Res>
    extends _$PoliticProfileStateCopyWithImpl<$Res>
    implements $PoliticDontHaveValidEmailCopyWith<$Res> {
  _$PoliticDontHaveValidEmailCopyWithImpl(PoliticDontHaveValidEmail _value,
      $Res Function(PoliticDontHaveValidEmail) _then)
      : super(_value, (v) => _then(v as PoliticDontHaveValidEmail));

  @override
  PoliticDontHaveValidEmail get _value =>
      super._value as PoliticDontHaveValidEmail;
}

class _$PoliticDontHaveValidEmail implements PoliticDontHaveValidEmail {
  _$PoliticDontHaveValidEmail();

  @override
  String toString() {
    return 'PoliticProfileState.politicDontHaveValidEmail()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is PoliticDontHaveValidEmail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result getPoliticInfoSuccess(
            PoliticoModel politic,
            List<dynamic> lastActivities,
            int activitiesCount,
            bool isBeingFollowedByUser),
    @required Result politicMoreActivitiesSuccess(List<dynamic> activities),
    @required Result getPoliticInfoFailed(),
    @required Result loadingPoliticInfo(),
    @required
        Result userFollowingPoliticChanged(
            PoliticoModel politico, bool isUserFollowingPolitic),
    @required Result followPoliticFailed(),
    @required Result politicDontHaveValidEmail(),
    @required Result openEmailIntentFailed(),
  }) {
    assert(initial != null);
    assert(getPoliticInfoSuccess != null);
    assert(politicMoreActivitiesSuccess != null);
    assert(getPoliticInfoFailed != null);
    assert(loadingPoliticInfo != null);
    assert(userFollowingPoliticChanged != null);
    assert(followPoliticFailed != null);
    assert(politicDontHaveValidEmail != null);
    assert(openEmailIntentFailed != null);
    return politicDontHaveValidEmail();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getPoliticInfoSuccess(
        PoliticoModel politic,
        List<dynamic> lastActivities,
        int activitiesCount,
        bool isBeingFollowedByUser),
    Result politicMoreActivitiesSuccess(List<dynamic> activities),
    Result getPoliticInfoFailed(),
    Result loadingPoliticInfo(),
    Result userFollowingPoliticChanged(
        PoliticoModel politico, bool isUserFollowingPolitic),
    Result followPoliticFailed(),
    Result politicDontHaveValidEmail(),
    Result openEmailIntentFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (politicDontHaveValidEmail != null) {
      return politicDontHaveValidEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticProfileState value),
    @required Result getPoliticInfoSuccess(GetPoliticInfoSuccess value),
    @required
        Result politicMoreActivitiesSuccess(PoliticMoreActivitiesSuccess value),
    @required Result getPoliticInfoFailed(GetPoliticInfoFailed value),
    @required Result loadingPoliticInfo(LoadingPoliticInfo value),
    @required
        Result userFollowingPoliticChanged(UserFollowingPoliticChanged value),
    @required Result followPoliticFailed(FollowPoliticFailed value),
    @required Result politicDontHaveValidEmail(PoliticDontHaveValidEmail value),
    @required Result openEmailIntentFailed(OpenEmailIntentFailed value),
  }) {
    assert(initial != null);
    assert(getPoliticInfoSuccess != null);
    assert(politicMoreActivitiesSuccess != null);
    assert(getPoliticInfoFailed != null);
    assert(loadingPoliticInfo != null);
    assert(userFollowingPoliticChanged != null);
    assert(followPoliticFailed != null);
    assert(politicDontHaveValidEmail != null);
    assert(openEmailIntentFailed != null);
    return politicDontHaveValidEmail(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticProfileState value),
    Result getPoliticInfoSuccess(GetPoliticInfoSuccess value),
    Result politicMoreActivitiesSuccess(PoliticMoreActivitiesSuccess value),
    Result getPoliticInfoFailed(GetPoliticInfoFailed value),
    Result loadingPoliticInfo(LoadingPoliticInfo value),
    Result userFollowingPoliticChanged(UserFollowingPoliticChanged value),
    Result followPoliticFailed(FollowPoliticFailed value),
    Result politicDontHaveValidEmail(PoliticDontHaveValidEmail value),
    Result openEmailIntentFailed(OpenEmailIntentFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (politicDontHaveValidEmail != null) {
      return politicDontHaveValidEmail(this);
    }
    return orElse();
  }
}

abstract class PoliticDontHaveValidEmail implements PoliticProfileState {
  factory PoliticDontHaveValidEmail() = _$PoliticDontHaveValidEmail;
}

abstract class $OpenEmailIntentFailedCopyWith<$Res> {
  factory $OpenEmailIntentFailedCopyWith(OpenEmailIntentFailed value,
          $Res Function(OpenEmailIntentFailed) then) =
      _$OpenEmailIntentFailedCopyWithImpl<$Res>;
}

class _$OpenEmailIntentFailedCopyWithImpl<$Res>
    extends _$PoliticProfileStateCopyWithImpl<$Res>
    implements $OpenEmailIntentFailedCopyWith<$Res> {
  _$OpenEmailIntentFailedCopyWithImpl(
      OpenEmailIntentFailed _value, $Res Function(OpenEmailIntentFailed) _then)
      : super(_value, (v) => _then(v as OpenEmailIntentFailed));

  @override
  OpenEmailIntentFailed get _value => super._value as OpenEmailIntentFailed;
}

class _$OpenEmailIntentFailed implements OpenEmailIntentFailed {
  _$OpenEmailIntentFailed();

  @override
  String toString() {
    return 'PoliticProfileState.openEmailIntentFailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is OpenEmailIntentFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result getPoliticInfoSuccess(
            PoliticoModel politic,
            List<dynamic> lastActivities,
            int activitiesCount,
            bool isBeingFollowedByUser),
    @required Result politicMoreActivitiesSuccess(List<dynamic> activities),
    @required Result getPoliticInfoFailed(),
    @required Result loadingPoliticInfo(),
    @required
        Result userFollowingPoliticChanged(
            PoliticoModel politico, bool isUserFollowingPolitic),
    @required Result followPoliticFailed(),
    @required Result politicDontHaveValidEmail(),
    @required Result openEmailIntentFailed(),
  }) {
    assert(initial != null);
    assert(getPoliticInfoSuccess != null);
    assert(politicMoreActivitiesSuccess != null);
    assert(getPoliticInfoFailed != null);
    assert(loadingPoliticInfo != null);
    assert(userFollowingPoliticChanged != null);
    assert(followPoliticFailed != null);
    assert(politicDontHaveValidEmail != null);
    assert(openEmailIntentFailed != null);
    return openEmailIntentFailed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getPoliticInfoSuccess(
        PoliticoModel politic,
        List<dynamic> lastActivities,
        int activitiesCount,
        bool isBeingFollowedByUser),
    Result politicMoreActivitiesSuccess(List<dynamic> activities),
    Result getPoliticInfoFailed(),
    Result loadingPoliticInfo(),
    Result userFollowingPoliticChanged(
        PoliticoModel politico, bool isUserFollowingPolitic),
    Result followPoliticFailed(),
    Result politicDontHaveValidEmail(),
    Result openEmailIntentFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (openEmailIntentFailed != null) {
      return openEmailIntentFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticProfileState value),
    @required Result getPoliticInfoSuccess(GetPoliticInfoSuccess value),
    @required
        Result politicMoreActivitiesSuccess(PoliticMoreActivitiesSuccess value),
    @required Result getPoliticInfoFailed(GetPoliticInfoFailed value),
    @required Result loadingPoliticInfo(LoadingPoliticInfo value),
    @required
        Result userFollowingPoliticChanged(UserFollowingPoliticChanged value),
    @required Result followPoliticFailed(FollowPoliticFailed value),
    @required Result politicDontHaveValidEmail(PoliticDontHaveValidEmail value),
    @required Result openEmailIntentFailed(OpenEmailIntentFailed value),
  }) {
    assert(initial != null);
    assert(getPoliticInfoSuccess != null);
    assert(politicMoreActivitiesSuccess != null);
    assert(getPoliticInfoFailed != null);
    assert(loadingPoliticInfo != null);
    assert(userFollowingPoliticChanged != null);
    assert(followPoliticFailed != null);
    assert(politicDontHaveValidEmail != null);
    assert(openEmailIntentFailed != null);
    return openEmailIntentFailed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticProfileState value),
    Result getPoliticInfoSuccess(GetPoliticInfoSuccess value),
    Result politicMoreActivitiesSuccess(PoliticMoreActivitiesSuccess value),
    Result getPoliticInfoFailed(GetPoliticInfoFailed value),
    Result loadingPoliticInfo(LoadingPoliticInfo value),
    Result userFollowingPoliticChanged(UserFollowingPoliticChanged value),
    Result followPoliticFailed(FollowPoliticFailed value),
    Result politicDontHaveValidEmail(PoliticDontHaveValidEmail value),
    Result openEmailIntentFailed(OpenEmailIntentFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (openEmailIntentFailed != null) {
      return openEmailIntentFailed(this);
    }
    return orElse();
  }
}

abstract class OpenEmailIntentFailed implements PoliticProfileState {
  factory OpenEmailIntentFailed() = _$OpenEmailIntentFailed;
}
