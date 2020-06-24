// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'politic_followers_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PoliticFollowersEventTearOff {
  const _$PoliticFollowersEventTearOff();

  GetPoliticFollowers getPoliticFollowers(String politicId) {
    return GetPoliticFollowers(
      politicId,
    );
  }
}

// ignore: unused_element
const $PoliticFollowersEvent = _$PoliticFollowersEventTearOff();

mixin _$PoliticFollowersEvent {
  String get politicId;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getPoliticFollowers(String politicId),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getPoliticFollowers(String politicId),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getPoliticFollowers(GetPoliticFollowers value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getPoliticFollowers(GetPoliticFollowers value),
    @required Result orElse(),
  });

  $PoliticFollowersEventCopyWith<PoliticFollowersEvent> get copyWith;
}

abstract class $PoliticFollowersEventCopyWith<$Res> {
  factory $PoliticFollowersEventCopyWith(PoliticFollowersEvent value,
          $Res Function(PoliticFollowersEvent) then) =
      _$PoliticFollowersEventCopyWithImpl<$Res>;
  $Res call({String politicId});
}

class _$PoliticFollowersEventCopyWithImpl<$Res>
    implements $PoliticFollowersEventCopyWith<$Res> {
  _$PoliticFollowersEventCopyWithImpl(this._value, this._then);

  final PoliticFollowersEvent _value;
  // ignore: unused_field
  final $Res Function(PoliticFollowersEvent) _then;

  @override
  $Res call({
    Object politicId = freezed,
  }) {
    return _then(_value.copyWith(
      politicId: politicId == freezed ? _value.politicId : politicId as String,
    ));
  }
}

abstract class $GetPoliticFollowersCopyWith<$Res>
    implements $PoliticFollowersEventCopyWith<$Res> {
  factory $GetPoliticFollowersCopyWith(
          GetPoliticFollowers value, $Res Function(GetPoliticFollowers) then) =
      _$GetPoliticFollowersCopyWithImpl<$Res>;
  @override
  $Res call({String politicId});
}

class _$GetPoliticFollowersCopyWithImpl<$Res>
    extends _$PoliticFollowersEventCopyWithImpl<$Res>
    implements $GetPoliticFollowersCopyWith<$Res> {
  _$GetPoliticFollowersCopyWithImpl(
      GetPoliticFollowers _value, $Res Function(GetPoliticFollowers) _then)
      : super(_value, (v) => _then(v as GetPoliticFollowers));

  @override
  GetPoliticFollowers get _value => super._value as GetPoliticFollowers;

  @override
  $Res call({
    Object politicId = freezed,
  }) {
    return _then(GetPoliticFollowers(
      politicId == freezed ? _value.politicId : politicId as String,
    ));
  }
}

class _$GetPoliticFollowers implements GetPoliticFollowers {
  _$GetPoliticFollowers(this.politicId) : assert(politicId != null);

  @override
  final String politicId;

  @override
  String toString() {
    return 'PoliticFollowersEvent.getPoliticFollowers(politicId: $politicId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetPoliticFollowers &&
            (identical(other.politicId, politicId) ||
                const DeepCollectionEquality()
                    .equals(other.politicId, politicId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(politicId);

  @override
  $GetPoliticFollowersCopyWith<GetPoliticFollowers> get copyWith =>
      _$GetPoliticFollowersCopyWithImpl<GetPoliticFollowers>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getPoliticFollowers(String politicId),
  }) {
    assert(getPoliticFollowers != null);
    return getPoliticFollowers(politicId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getPoliticFollowers(String politicId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPoliticFollowers != null) {
      return getPoliticFollowers(politicId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getPoliticFollowers(GetPoliticFollowers value),
  }) {
    assert(getPoliticFollowers != null);
    return getPoliticFollowers(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getPoliticFollowers(GetPoliticFollowers value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPoliticFollowers != null) {
      return getPoliticFollowers(this);
    }
    return orElse();
  }
}

abstract class GetPoliticFollowers implements PoliticFollowersEvent {
  factory GetPoliticFollowers(String politicId) = _$GetPoliticFollowers;

  @override
  String get politicId;
  @override
  $GetPoliticFollowersCopyWith<GetPoliticFollowers> get copyWith;
}
