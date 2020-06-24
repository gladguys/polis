// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'politic_profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PoliticProfileEventTearOff {
  const _$PoliticProfileEventTearOff();

  GetPoliticInfo getPoliticInfo(String politicId) {
    return GetPoliticInfo(
      politicId,
    );
  }

  GetMoreActivities getMoreActivities(String politicId) {
    return GetMoreActivities(
      politicId,
    );
  }

  FollowUnfollowProfilePolitic followUnfollowProfilePolitic(
      {@required bool isFollowing}) {
    return FollowUnfollowProfilePolitic(
      isFollowing: isFollowing,
    );
  }

  SendEmailToPolitic sendEmailToPolitic() {
    return SendEmailToPolitic();
  }
}

// ignore: unused_element
const $PoliticProfileEvent = _$PoliticProfileEventTearOff();

mixin _$PoliticProfileEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getPoliticInfo(String politicId),
    @required Result getMoreActivities(String politicId),
    @required Result followUnfollowProfilePolitic(bool isFollowing),
    @required Result sendEmailToPolitic(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getPoliticInfo(String politicId),
    Result getMoreActivities(String politicId),
    Result followUnfollowProfilePolitic(bool isFollowing),
    Result sendEmailToPolitic(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getPoliticInfo(GetPoliticInfo value),
    @required Result getMoreActivities(GetMoreActivities value),
    @required
        Result followUnfollowProfilePolitic(FollowUnfollowProfilePolitic value),
    @required Result sendEmailToPolitic(SendEmailToPolitic value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getPoliticInfo(GetPoliticInfo value),
    Result getMoreActivities(GetMoreActivities value),
    Result followUnfollowProfilePolitic(FollowUnfollowProfilePolitic value),
    Result sendEmailToPolitic(SendEmailToPolitic value),
    @required Result orElse(),
  });
}

abstract class $PoliticProfileEventCopyWith<$Res> {
  factory $PoliticProfileEventCopyWith(
          PoliticProfileEvent value, $Res Function(PoliticProfileEvent) then) =
      _$PoliticProfileEventCopyWithImpl<$Res>;
}

class _$PoliticProfileEventCopyWithImpl<$Res>
    implements $PoliticProfileEventCopyWith<$Res> {
  _$PoliticProfileEventCopyWithImpl(this._value, this._then);

  final PoliticProfileEvent _value;
  // ignore: unused_field
  final $Res Function(PoliticProfileEvent) _then;
}

abstract class $GetPoliticInfoCopyWith<$Res> {
  factory $GetPoliticInfoCopyWith(
          GetPoliticInfo value, $Res Function(GetPoliticInfo) then) =
      _$GetPoliticInfoCopyWithImpl<$Res>;
  $Res call({String politicId});
}

class _$GetPoliticInfoCopyWithImpl<$Res>
    extends _$PoliticProfileEventCopyWithImpl<$Res>
    implements $GetPoliticInfoCopyWith<$Res> {
  _$GetPoliticInfoCopyWithImpl(
      GetPoliticInfo _value, $Res Function(GetPoliticInfo) _then)
      : super(_value, (v) => _then(v as GetPoliticInfo));

  @override
  GetPoliticInfo get _value => super._value as GetPoliticInfo;

  @override
  $Res call({
    Object politicId = freezed,
  }) {
    return _then(GetPoliticInfo(
      politicId == freezed ? _value.politicId : politicId as String,
    ));
  }
}

class _$GetPoliticInfo implements GetPoliticInfo {
  _$GetPoliticInfo(this.politicId) : assert(politicId != null);

  @override
  final String politicId;

  @override
  String toString() {
    return 'PoliticProfileEvent.getPoliticInfo(politicId: $politicId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetPoliticInfo &&
            (identical(other.politicId, politicId) ||
                const DeepCollectionEquality()
                    .equals(other.politicId, politicId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(politicId);

  @override
  $GetPoliticInfoCopyWith<GetPoliticInfo> get copyWith =>
      _$GetPoliticInfoCopyWithImpl<GetPoliticInfo>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getPoliticInfo(String politicId),
    @required Result getMoreActivities(String politicId),
    @required Result followUnfollowProfilePolitic(bool isFollowing),
    @required Result sendEmailToPolitic(),
  }) {
    assert(getPoliticInfo != null);
    assert(getMoreActivities != null);
    assert(followUnfollowProfilePolitic != null);
    assert(sendEmailToPolitic != null);
    return getPoliticInfo(politicId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getPoliticInfo(String politicId),
    Result getMoreActivities(String politicId),
    Result followUnfollowProfilePolitic(bool isFollowing),
    Result sendEmailToPolitic(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPoliticInfo != null) {
      return getPoliticInfo(politicId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getPoliticInfo(GetPoliticInfo value),
    @required Result getMoreActivities(GetMoreActivities value),
    @required
        Result followUnfollowProfilePolitic(FollowUnfollowProfilePolitic value),
    @required Result sendEmailToPolitic(SendEmailToPolitic value),
  }) {
    assert(getPoliticInfo != null);
    assert(getMoreActivities != null);
    assert(followUnfollowProfilePolitic != null);
    assert(sendEmailToPolitic != null);
    return getPoliticInfo(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getPoliticInfo(GetPoliticInfo value),
    Result getMoreActivities(GetMoreActivities value),
    Result followUnfollowProfilePolitic(FollowUnfollowProfilePolitic value),
    Result sendEmailToPolitic(SendEmailToPolitic value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPoliticInfo != null) {
      return getPoliticInfo(this);
    }
    return orElse();
  }
}

abstract class GetPoliticInfo implements PoliticProfileEvent {
  factory GetPoliticInfo(String politicId) = _$GetPoliticInfo;

  String get politicId;
  $GetPoliticInfoCopyWith<GetPoliticInfo> get copyWith;
}

abstract class $GetMoreActivitiesCopyWith<$Res> {
  factory $GetMoreActivitiesCopyWith(
          GetMoreActivities value, $Res Function(GetMoreActivities) then) =
      _$GetMoreActivitiesCopyWithImpl<$Res>;
  $Res call({String politicId});
}

class _$GetMoreActivitiesCopyWithImpl<$Res>
    extends _$PoliticProfileEventCopyWithImpl<$Res>
    implements $GetMoreActivitiesCopyWith<$Res> {
  _$GetMoreActivitiesCopyWithImpl(
      GetMoreActivities _value, $Res Function(GetMoreActivities) _then)
      : super(_value, (v) => _then(v as GetMoreActivities));

  @override
  GetMoreActivities get _value => super._value as GetMoreActivities;

  @override
  $Res call({
    Object politicId = freezed,
  }) {
    return _then(GetMoreActivities(
      politicId == freezed ? _value.politicId : politicId as String,
    ));
  }
}

class _$GetMoreActivities implements GetMoreActivities {
  _$GetMoreActivities(this.politicId) : assert(politicId != null);

  @override
  final String politicId;

  @override
  String toString() {
    return 'PoliticProfileEvent.getMoreActivities(politicId: $politicId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetMoreActivities &&
            (identical(other.politicId, politicId) ||
                const DeepCollectionEquality()
                    .equals(other.politicId, politicId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(politicId);

  @override
  $GetMoreActivitiesCopyWith<GetMoreActivities> get copyWith =>
      _$GetMoreActivitiesCopyWithImpl<GetMoreActivities>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getPoliticInfo(String politicId),
    @required Result getMoreActivities(String politicId),
    @required Result followUnfollowProfilePolitic(bool isFollowing),
    @required Result sendEmailToPolitic(),
  }) {
    assert(getPoliticInfo != null);
    assert(getMoreActivities != null);
    assert(followUnfollowProfilePolitic != null);
    assert(sendEmailToPolitic != null);
    return getMoreActivities(politicId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getPoliticInfo(String politicId),
    Result getMoreActivities(String politicId),
    Result followUnfollowProfilePolitic(bool isFollowing),
    Result sendEmailToPolitic(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getMoreActivities != null) {
      return getMoreActivities(politicId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getPoliticInfo(GetPoliticInfo value),
    @required Result getMoreActivities(GetMoreActivities value),
    @required
        Result followUnfollowProfilePolitic(FollowUnfollowProfilePolitic value),
    @required Result sendEmailToPolitic(SendEmailToPolitic value),
  }) {
    assert(getPoliticInfo != null);
    assert(getMoreActivities != null);
    assert(followUnfollowProfilePolitic != null);
    assert(sendEmailToPolitic != null);
    return getMoreActivities(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getPoliticInfo(GetPoliticInfo value),
    Result getMoreActivities(GetMoreActivities value),
    Result followUnfollowProfilePolitic(FollowUnfollowProfilePolitic value),
    Result sendEmailToPolitic(SendEmailToPolitic value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getMoreActivities != null) {
      return getMoreActivities(this);
    }
    return orElse();
  }
}

abstract class GetMoreActivities implements PoliticProfileEvent {
  factory GetMoreActivities(String politicId) = _$GetMoreActivities;

  String get politicId;
  $GetMoreActivitiesCopyWith<GetMoreActivities> get copyWith;
}

abstract class $FollowUnfollowProfilePoliticCopyWith<$Res> {
  factory $FollowUnfollowProfilePoliticCopyWith(
          FollowUnfollowProfilePolitic value,
          $Res Function(FollowUnfollowProfilePolitic) then) =
      _$FollowUnfollowProfilePoliticCopyWithImpl<$Res>;
  $Res call({bool isFollowing});
}

class _$FollowUnfollowProfilePoliticCopyWithImpl<$Res>
    extends _$PoliticProfileEventCopyWithImpl<$Res>
    implements $FollowUnfollowProfilePoliticCopyWith<$Res> {
  _$FollowUnfollowProfilePoliticCopyWithImpl(
      FollowUnfollowProfilePolitic _value,
      $Res Function(FollowUnfollowProfilePolitic) _then)
      : super(_value, (v) => _then(v as FollowUnfollowProfilePolitic));

  @override
  FollowUnfollowProfilePolitic get _value =>
      super._value as FollowUnfollowProfilePolitic;

  @override
  $Res call({
    Object isFollowing = freezed,
  }) {
    return _then(FollowUnfollowProfilePolitic(
      isFollowing:
          isFollowing == freezed ? _value.isFollowing : isFollowing as bool,
    ));
  }
}

class _$FollowUnfollowProfilePolitic implements FollowUnfollowProfilePolitic {
  _$FollowUnfollowProfilePolitic({@required this.isFollowing})
      : assert(isFollowing != null);

  @override
  final bool isFollowing;

  @override
  String toString() {
    return 'PoliticProfileEvent.followUnfollowProfilePolitic(isFollowing: $isFollowing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FollowUnfollowProfilePolitic &&
            (identical(other.isFollowing, isFollowing) ||
                const DeepCollectionEquality()
                    .equals(other.isFollowing, isFollowing)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(isFollowing);

  @override
  $FollowUnfollowProfilePoliticCopyWith<FollowUnfollowProfilePolitic>
      get copyWith => _$FollowUnfollowProfilePoliticCopyWithImpl<
          FollowUnfollowProfilePolitic>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getPoliticInfo(String politicId),
    @required Result getMoreActivities(String politicId),
    @required Result followUnfollowProfilePolitic(bool isFollowing),
    @required Result sendEmailToPolitic(),
  }) {
    assert(getPoliticInfo != null);
    assert(getMoreActivities != null);
    assert(followUnfollowProfilePolitic != null);
    assert(sendEmailToPolitic != null);
    return followUnfollowProfilePolitic(isFollowing);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getPoliticInfo(String politicId),
    Result getMoreActivities(String politicId),
    Result followUnfollowProfilePolitic(bool isFollowing),
    Result sendEmailToPolitic(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (followUnfollowProfilePolitic != null) {
      return followUnfollowProfilePolitic(isFollowing);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getPoliticInfo(GetPoliticInfo value),
    @required Result getMoreActivities(GetMoreActivities value),
    @required
        Result followUnfollowProfilePolitic(FollowUnfollowProfilePolitic value),
    @required Result sendEmailToPolitic(SendEmailToPolitic value),
  }) {
    assert(getPoliticInfo != null);
    assert(getMoreActivities != null);
    assert(followUnfollowProfilePolitic != null);
    assert(sendEmailToPolitic != null);
    return followUnfollowProfilePolitic(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getPoliticInfo(GetPoliticInfo value),
    Result getMoreActivities(GetMoreActivities value),
    Result followUnfollowProfilePolitic(FollowUnfollowProfilePolitic value),
    Result sendEmailToPolitic(SendEmailToPolitic value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (followUnfollowProfilePolitic != null) {
      return followUnfollowProfilePolitic(this);
    }
    return orElse();
  }
}

abstract class FollowUnfollowProfilePolitic implements PoliticProfileEvent {
  factory FollowUnfollowProfilePolitic({@required bool isFollowing}) =
      _$FollowUnfollowProfilePolitic;

  bool get isFollowing;
  $FollowUnfollowProfilePoliticCopyWith<FollowUnfollowProfilePolitic>
      get copyWith;
}

abstract class $SendEmailToPoliticCopyWith<$Res> {
  factory $SendEmailToPoliticCopyWith(
          SendEmailToPolitic value, $Res Function(SendEmailToPolitic) then) =
      _$SendEmailToPoliticCopyWithImpl<$Res>;
}

class _$SendEmailToPoliticCopyWithImpl<$Res>
    extends _$PoliticProfileEventCopyWithImpl<$Res>
    implements $SendEmailToPoliticCopyWith<$Res> {
  _$SendEmailToPoliticCopyWithImpl(
      SendEmailToPolitic _value, $Res Function(SendEmailToPolitic) _then)
      : super(_value, (v) => _then(v as SendEmailToPolitic));

  @override
  SendEmailToPolitic get _value => super._value as SendEmailToPolitic;
}

class _$SendEmailToPolitic implements SendEmailToPolitic {
  _$SendEmailToPolitic();

  @override
  String toString() {
    return 'PoliticProfileEvent.sendEmailToPolitic()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SendEmailToPolitic);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getPoliticInfo(String politicId),
    @required Result getMoreActivities(String politicId),
    @required Result followUnfollowProfilePolitic(bool isFollowing),
    @required Result sendEmailToPolitic(),
  }) {
    assert(getPoliticInfo != null);
    assert(getMoreActivities != null);
    assert(followUnfollowProfilePolitic != null);
    assert(sendEmailToPolitic != null);
    return sendEmailToPolitic();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getPoliticInfo(String politicId),
    Result getMoreActivities(String politicId),
    Result followUnfollowProfilePolitic(bool isFollowing),
    Result sendEmailToPolitic(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendEmailToPolitic != null) {
      return sendEmailToPolitic();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getPoliticInfo(GetPoliticInfo value),
    @required Result getMoreActivities(GetMoreActivities value),
    @required
        Result followUnfollowProfilePolitic(FollowUnfollowProfilePolitic value),
    @required Result sendEmailToPolitic(SendEmailToPolitic value),
  }) {
    assert(getPoliticInfo != null);
    assert(getMoreActivities != null);
    assert(followUnfollowProfilePolitic != null);
    assert(sendEmailToPolitic != null);
    return sendEmailToPolitic(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getPoliticInfo(GetPoliticInfo value),
    Result getMoreActivities(GetMoreActivities value),
    Result followUnfollowProfilePolitic(FollowUnfollowProfilePolitic value),
    Result sendEmailToPolitic(SendEmailToPolitic value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendEmailToPolitic != null) {
      return sendEmailToPolitic(this);
    }
    return orElse();
  }
}

abstract class SendEmailToPolitic implements PoliticProfileEvent {
  factory SendEmailToPolitic() = _$SendEmailToPolitic;
}
