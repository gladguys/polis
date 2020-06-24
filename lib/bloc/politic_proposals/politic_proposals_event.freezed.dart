// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'politic_proposals_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PoliticProposalsEventTearOff {
  const _$PoliticProposalsEventTearOff();

  GetPoliticProposals getPoliticProposals(String politicId) {
    return GetPoliticProposals(
      politicId,
    );
  }
}

// ignore: unused_element
const $PoliticProposalsEvent = _$PoliticProposalsEventTearOff();

mixin _$PoliticProposalsEvent {
  String get politicId;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getPoliticProposals(String politicId),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getPoliticProposals(String politicId),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getPoliticProposals(GetPoliticProposals value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getPoliticProposals(GetPoliticProposals value),
    @required Result orElse(),
  });

  $PoliticProposalsEventCopyWith<PoliticProposalsEvent> get copyWith;
}

abstract class $PoliticProposalsEventCopyWith<$Res> {
  factory $PoliticProposalsEventCopyWith(PoliticProposalsEvent value,
          $Res Function(PoliticProposalsEvent) then) =
      _$PoliticProposalsEventCopyWithImpl<$Res>;
  $Res call({String politicId});
}

class _$PoliticProposalsEventCopyWithImpl<$Res>
    implements $PoliticProposalsEventCopyWith<$Res> {
  _$PoliticProposalsEventCopyWithImpl(this._value, this._then);

  final PoliticProposalsEvent _value;
  // ignore: unused_field
  final $Res Function(PoliticProposalsEvent) _then;

  @override
  $Res call({
    Object politicId = freezed,
  }) {
    return _then(_value.copyWith(
      politicId: politicId == freezed ? _value.politicId : politicId as String,
    ));
  }
}

abstract class $GetPoliticProposalsCopyWith<$Res>
    implements $PoliticProposalsEventCopyWith<$Res> {
  factory $GetPoliticProposalsCopyWith(
          GetPoliticProposals value, $Res Function(GetPoliticProposals) then) =
      _$GetPoliticProposalsCopyWithImpl<$Res>;
  @override
  $Res call({String politicId});
}

class _$GetPoliticProposalsCopyWithImpl<$Res>
    extends _$PoliticProposalsEventCopyWithImpl<$Res>
    implements $GetPoliticProposalsCopyWith<$Res> {
  _$GetPoliticProposalsCopyWithImpl(
      GetPoliticProposals _value, $Res Function(GetPoliticProposals) _then)
      : super(_value, (v) => _then(v as GetPoliticProposals));

  @override
  GetPoliticProposals get _value => super._value as GetPoliticProposals;

  @override
  $Res call({
    Object politicId = freezed,
  }) {
    return _then(GetPoliticProposals(
      politicId == freezed ? _value.politicId : politicId as String,
    ));
  }
}

class _$GetPoliticProposals implements GetPoliticProposals {
  _$GetPoliticProposals(this.politicId) : assert(politicId != null);

  @override
  final String politicId;

  @override
  String toString() {
    return 'PoliticProposalsEvent.getPoliticProposals(politicId: $politicId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetPoliticProposals &&
            (identical(other.politicId, politicId) ||
                const DeepCollectionEquality()
                    .equals(other.politicId, politicId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(politicId);

  @override
  $GetPoliticProposalsCopyWith<GetPoliticProposals> get copyWith =>
      _$GetPoliticProposalsCopyWithImpl<GetPoliticProposals>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getPoliticProposals(String politicId),
  }) {
    assert(getPoliticProposals != null);
    return getPoliticProposals(politicId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getPoliticProposals(String politicId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPoliticProposals != null) {
      return getPoliticProposals(politicId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getPoliticProposals(GetPoliticProposals value),
  }) {
    assert(getPoliticProposals != null);
    return getPoliticProposals(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getPoliticProposals(GetPoliticProposals value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPoliticProposals != null) {
      return getPoliticProposals(this);
    }
    return orElse();
  }
}

abstract class GetPoliticProposals implements PoliticProposalsEvent {
  factory GetPoliticProposals(String politicId) = _$GetPoliticProposals;

  @override
  String get politicId;
  @override
  $GetPoliticProposalsCopyWith<GetPoliticProposals> get copyWith;
}
