// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'politic_suggestion_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PoliticSuggestionEventTearOff {
  const _$PoliticSuggestionEventTearOff();

  FetchSuggestedPolitics fetchSuggestedPolitics(String stateOption) {
    return FetchSuggestedPolitics(
      stateOption,
    );
  }

  FollowOrUnfollowPolitic followOrUnfollowPolitic(PoliticoModel politico) {
    return FollowOrUnfollowPolitic(
      politico,
    );
  }

  SavePoliticsToFollow savePoliticsToFollow({@required UserModel user}) {
    return SavePoliticsToFollow(
      user: user,
    );
  }
}

// ignore: unused_element
const $PoliticSuggestionEvent = _$PoliticSuggestionEventTearOff();

mixin _$PoliticSuggestionEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result fetchSuggestedPolitics(String stateOption),
    @required Result followOrUnfollowPolitic(PoliticoModel politico),
    @required Result savePoliticsToFollow(UserModel user),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result fetchSuggestedPolitics(String stateOption),
    Result followOrUnfollowPolitic(PoliticoModel politico),
    Result savePoliticsToFollow(UserModel user),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result fetchSuggestedPolitics(FetchSuggestedPolitics value),
    @required Result followOrUnfollowPolitic(FollowOrUnfollowPolitic value),
    @required Result savePoliticsToFollow(SavePoliticsToFollow value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result fetchSuggestedPolitics(FetchSuggestedPolitics value),
    Result followOrUnfollowPolitic(FollowOrUnfollowPolitic value),
    Result savePoliticsToFollow(SavePoliticsToFollow value),
    @required Result orElse(),
  });
}

abstract class $PoliticSuggestionEventCopyWith<$Res> {
  factory $PoliticSuggestionEventCopyWith(PoliticSuggestionEvent value,
          $Res Function(PoliticSuggestionEvent) then) =
      _$PoliticSuggestionEventCopyWithImpl<$Res>;
}

class _$PoliticSuggestionEventCopyWithImpl<$Res>
    implements $PoliticSuggestionEventCopyWith<$Res> {
  _$PoliticSuggestionEventCopyWithImpl(this._value, this._then);

  final PoliticSuggestionEvent _value;
  // ignore: unused_field
  final $Res Function(PoliticSuggestionEvent) _then;
}

abstract class $FetchSuggestedPoliticsCopyWith<$Res> {
  factory $FetchSuggestedPoliticsCopyWith(FetchSuggestedPolitics value,
          $Res Function(FetchSuggestedPolitics) then) =
      _$FetchSuggestedPoliticsCopyWithImpl<$Res>;
  $Res call({String stateOption});
}

class _$FetchSuggestedPoliticsCopyWithImpl<$Res>
    extends _$PoliticSuggestionEventCopyWithImpl<$Res>
    implements $FetchSuggestedPoliticsCopyWith<$Res> {
  _$FetchSuggestedPoliticsCopyWithImpl(FetchSuggestedPolitics _value,
      $Res Function(FetchSuggestedPolitics) _then)
      : super(_value, (v) => _then(v as FetchSuggestedPolitics));

  @override
  FetchSuggestedPolitics get _value => super._value as FetchSuggestedPolitics;

  @override
  $Res call({
    Object stateOption = freezed,
  }) {
    return _then(FetchSuggestedPolitics(
      stateOption == freezed ? _value.stateOption : stateOption as String,
    ));
  }
}

class _$FetchSuggestedPolitics implements FetchSuggestedPolitics {
  _$FetchSuggestedPolitics(this.stateOption) : assert(stateOption != null);

  @override
  final String stateOption;

  @override
  String toString() {
    return 'PoliticSuggestionEvent.fetchSuggestedPolitics(stateOption: $stateOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FetchSuggestedPolitics &&
            (identical(other.stateOption, stateOption) ||
                const DeepCollectionEquality()
                    .equals(other.stateOption, stateOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stateOption);

  @override
  $FetchSuggestedPoliticsCopyWith<FetchSuggestedPolitics> get copyWith =>
      _$FetchSuggestedPoliticsCopyWithImpl<FetchSuggestedPolitics>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result fetchSuggestedPolitics(String stateOption),
    @required Result followOrUnfollowPolitic(PoliticoModel politico),
    @required Result savePoliticsToFollow(UserModel user),
  }) {
    assert(fetchSuggestedPolitics != null);
    assert(followOrUnfollowPolitic != null);
    assert(savePoliticsToFollow != null);
    return fetchSuggestedPolitics(stateOption);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result fetchSuggestedPolitics(String stateOption),
    Result followOrUnfollowPolitic(PoliticoModel politico),
    Result savePoliticsToFollow(UserModel user),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchSuggestedPolitics != null) {
      return fetchSuggestedPolitics(stateOption);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result fetchSuggestedPolitics(FetchSuggestedPolitics value),
    @required Result followOrUnfollowPolitic(FollowOrUnfollowPolitic value),
    @required Result savePoliticsToFollow(SavePoliticsToFollow value),
  }) {
    assert(fetchSuggestedPolitics != null);
    assert(followOrUnfollowPolitic != null);
    assert(savePoliticsToFollow != null);
    return fetchSuggestedPolitics(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result fetchSuggestedPolitics(FetchSuggestedPolitics value),
    Result followOrUnfollowPolitic(FollowOrUnfollowPolitic value),
    Result savePoliticsToFollow(SavePoliticsToFollow value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchSuggestedPolitics != null) {
      return fetchSuggestedPolitics(this);
    }
    return orElse();
  }
}

abstract class FetchSuggestedPolitics implements PoliticSuggestionEvent {
  factory FetchSuggestedPolitics(String stateOption) = _$FetchSuggestedPolitics;

  String get stateOption;
  $FetchSuggestedPoliticsCopyWith<FetchSuggestedPolitics> get copyWith;
}

abstract class $FollowOrUnfollowPoliticCopyWith<$Res> {
  factory $FollowOrUnfollowPoliticCopyWith(FollowOrUnfollowPolitic value,
          $Res Function(FollowOrUnfollowPolitic) then) =
      _$FollowOrUnfollowPoliticCopyWithImpl<$Res>;
  $Res call({PoliticoModel politico});
}

class _$FollowOrUnfollowPoliticCopyWithImpl<$Res>
    extends _$PoliticSuggestionEventCopyWithImpl<$Res>
    implements $FollowOrUnfollowPoliticCopyWith<$Res> {
  _$FollowOrUnfollowPoliticCopyWithImpl(FollowOrUnfollowPolitic _value,
      $Res Function(FollowOrUnfollowPolitic) _then)
      : super(_value, (v) => _then(v as FollowOrUnfollowPolitic));

  @override
  FollowOrUnfollowPolitic get _value => super._value as FollowOrUnfollowPolitic;

  @override
  $Res call({
    Object politico = freezed,
  }) {
    return _then(FollowOrUnfollowPolitic(
      politico == freezed ? _value.politico : politico as PoliticoModel,
    ));
  }
}

class _$FollowOrUnfollowPolitic implements FollowOrUnfollowPolitic {
  _$FollowOrUnfollowPolitic(this.politico) : assert(politico != null);

  @override
  final PoliticoModel politico;

  @override
  String toString() {
    return 'PoliticSuggestionEvent.followOrUnfollowPolitic(politico: $politico)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FollowOrUnfollowPolitic &&
            (identical(other.politico, politico) ||
                const DeepCollectionEquality()
                    .equals(other.politico, politico)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(politico);

  @override
  $FollowOrUnfollowPoliticCopyWith<FollowOrUnfollowPolitic> get copyWith =>
      _$FollowOrUnfollowPoliticCopyWithImpl<FollowOrUnfollowPolitic>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result fetchSuggestedPolitics(String stateOption),
    @required Result followOrUnfollowPolitic(PoliticoModel politico),
    @required Result savePoliticsToFollow(UserModel user),
  }) {
    assert(fetchSuggestedPolitics != null);
    assert(followOrUnfollowPolitic != null);
    assert(savePoliticsToFollow != null);
    return followOrUnfollowPolitic(politico);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result fetchSuggestedPolitics(String stateOption),
    Result followOrUnfollowPolitic(PoliticoModel politico),
    Result savePoliticsToFollow(UserModel user),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (followOrUnfollowPolitic != null) {
      return followOrUnfollowPolitic(politico);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result fetchSuggestedPolitics(FetchSuggestedPolitics value),
    @required Result followOrUnfollowPolitic(FollowOrUnfollowPolitic value),
    @required Result savePoliticsToFollow(SavePoliticsToFollow value),
  }) {
    assert(fetchSuggestedPolitics != null);
    assert(followOrUnfollowPolitic != null);
    assert(savePoliticsToFollow != null);
    return followOrUnfollowPolitic(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result fetchSuggestedPolitics(FetchSuggestedPolitics value),
    Result followOrUnfollowPolitic(FollowOrUnfollowPolitic value),
    Result savePoliticsToFollow(SavePoliticsToFollow value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (followOrUnfollowPolitic != null) {
      return followOrUnfollowPolitic(this);
    }
    return orElse();
  }
}

abstract class FollowOrUnfollowPolitic implements PoliticSuggestionEvent {
  factory FollowOrUnfollowPolitic(PoliticoModel politico) =
      _$FollowOrUnfollowPolitic;

  PoliticoModel get politico;
  $FollowOrUnfollowPoliticCopyWith<FollowOrUnfollowPolitic> get copyWith;
}

abstract class $SavePoliticsToFollowCopyWith<$Res> {
  factory $SavePoliticsToFollowCopyWith(SavePoliticsToFollow value,
          $Res Function(SavePoliticsToFollow) then) =
      _$SavePoliticsToFollowCopyWithImpl<$Res>;
  $Res call({UserModel user});
}

class _$SavePoliticsToFollowCopyWithImpl<$Res>
    extends _$PoliticSuggestionEventCopyWithImpl<$Res>
    implements $SavePoliticsToFollowCopyWith<$Res> {
  _$SavePoliticsToFollowCopyWithImpl(
      SavePoliticsToFollow _value, $Res Function(SavePoliticsToFollow) _then)
      : super(_value, (v) => _then(v as SavePoliticsToFollow));

  @override
  SavePoliticsToFollow get _value => super._value as SavePoliticsToFollow;

  @override
  $Res call({
    Object user = freezed,
  }) {
    return _then(SavePoliticsToFollow(
      user: user == freezed ? _value.user : user as UserModel,
    ));
  }
}

class _$SavePoliticsToFollow implements SavePoliticsToFollow {
  _$SavePoliticsToFollow({@required this.user}) : assert(user != null);

  @override
  final UserModel user;

  @override
  String toString() {
    return 'PoliticSuggestionEvent.savePoliticsToFollow(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SavePoliticsToFollow &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @override
  $SavePoliticsToFollowCopyWith<SavePoliticsToFollow> get copyWith =>
      _$SavePoliticsToFollowCopyWithImpl<SavePoliticsToFollow>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result fetchSuggestedPolitics(String stateOption),
    @required Result followOrUnfollowPolitic(PoliticoModel politico),
    @required Result savePoliticsToFollow(UserModel user),
  }) {
    assert(fetchSuggestedPolitics != null);
    assert(followOrUnfollowPolitic != null);
    assert(savePoliticsToFollow != null);
    return savePoliticsToFollow(user);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result fetchSuggestedPolitics(String stateOption),
    Result followOrUnfollowPolitic(PoliticoModel politico),
    Result savePoliticsToFollow(UserModel user),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (savePoliticsToFollow != null) {
      return savePoliticsToFollow(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result fetchSuggestedPolitics(FetchSuggestedPolitics value),
    @required Result followOrUnfollowPolitic(FollowOrUnfollowPolitic value),
    @required Result savePoliticsToFollow(SavePoliticsToFollow value),
  }) {
    assert(fetchSuggestedPolitics != null);
    assert(followOrUnfollowPolitic != null);
    assert(savePoliticsToFollow != null);
    return savePoliticsToFollow(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result fetchSuggestedPolitics(FetchSuggestedPolitics value),
    Result followOrUnfollowPolitic(FollowOrUnfollowPolitic value),
    Result savePoliticsToFollow(SavePoliticsToFollow value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (savePoliticsToFollow != null) {
      return savePoliticsToFollow(this);
    }
    return orElse();
  }
}

abstract class SavePoliticsToFollow implements PoliticSuggestionEvent {
  factory SavePoliticsToFollow({@required UserModel user}) =
      _$SavePoliticsToFollow;

  UserModel get user;
  $SavePoliticsToFollowCopyWith<SavePoliticsToFollow> get copyWith;
}
