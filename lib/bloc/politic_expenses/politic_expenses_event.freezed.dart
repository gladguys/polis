// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'politic_expenses_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PoliticExpensesEventTearOff {
  const _$PoliticExpensesEventTearOff();

  GetPoliticExpenses getPoliticExpenses(String politicoId) {
    return GetPoliticExpenses(
      politicoId,
    );
  }
}

// ignore: unused_element
const $PoliticExpensesEvent = _$PoliticExpensesEventTearOff();

mixin _$PoliticExpensesEvent {
  String get politicoId;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getPoliticExpenses(String politicoId),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getPoliticExpenses(String politicoId),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getPoliticExpenses(GetPoliticExpenses value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getPoliticExpenses(GetPoliticExpenses value),
    @required Result orElse(),
  });

  $PoliticExpensesEventCopyWith<PoliticExpensesEvent> get copyWith;
}

abstract class $PoliticExpensesEventCopyWith<$Res> {
  factory $PoliticExpensesEventCopyWith(PoliticExpensesEvent value,
          $Res Function(PoliticExpensesEvent) then) =
      _$PoliticExpensesEventCopyWithImpl<$Res>;
  $Res call({String politicoId});
}

class _$PoliticExpensesEventCopyWithImpl<$Res>
    implements $PoliticExpensesEventCopyWith<$Res> {
  _$PoliticExpensesEventCopyWithImpl(this._value, this._then);

  final PoliticExpensesEvent _value;
  // ignore: unused_field
  final $Res Function(PoliticExpensesEvent) _then;

  @override
  $Res call({
    Object politicoId = freezed,
  }) {
    return _then(_value.copyWith(
      politicoId:
          politicoId == freezed ? _value.politicoId : politicoId as String,
    ));
  }
}

abstract class $GetPoliticExpensesCopyWith<$Res>
    implements $PoliticExpensesEventCopyWith<$Res> {
  factory $GetPoliticExpensesCopyWith(
          GetPoliticExpenses value, $Res Function(GetPoliticExpenses) then) =
      _$GetPoliticExpensesCopyWithImpl<$Res>;
  @override
  $Res call({String politicoId});
}

class _$GetPoliticExpensesCopyWithImpl<$Res>
    extends _$PoliticExpensesEventCopyWithImpl<$Res>
    implements $GetPoliticExpensesCopyWith<$Res> {
  _$GetPoliticExpensesCopyWithImpl(
      GetPoliticExpenses _value, $Res Function(GetPoliticExpenses) _then)
      : super(_value, (v) => _then(v as GetPoliticExpenses));

  @override
  GetPoliticExpenses get _value => super._value as GetPoliticExpenses;

  @override
  $Res call({
    Object politicoId = freezed,
  }) {
    return _then(GetPoliticExpenses(
      politicoId == freezed ? _value.politicoId : politicoId as String,
    ));
  }
}

class _$GetPoliticExpenses implements GetPoliticExpenses {
  _$GetPoliticExpenses(this.politicoId) : assert(politicoId != null);

  @override
  final String politicoId;

  @override
  String toString() {
    return 'PoliticExpensesEvent.getPoliticExpenses(politicoId: $politicoId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetPoliticExpenses &&
            (identical(other.politicoId, politicoId) ||
                const DeepCollectionEquality()
                    .equals(other.politicoId, politicoId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(politicoId);

  @override
  $GetPoliticExpensesCopyWith<GetPoliticExpenses> get copyWith =>
      _$GetPoliticExpensesCopyWithImpl<GetPoliticExpenses>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getPoliticExpenses(String politicoId),
  }) {
    assert(getPoliticExpenses != null);
    return getPoliticExpenses(politicoId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getPoliticExpenses(String politicoId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPoliticExpenses != null) {
      return getPoliticExpenses(politicoId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getPoliticExpenses(GetPoliticExpenses value),
  }) {
    assert(getPoliticExpenses != null);
    return getPoliticExpenses(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getPoliticExpenses(GetPoliticExpenses value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPoliticExpenses != null) {
      return getPoliticExpenses(this);
    }
    return orElse();
  }
}

abstract class GetPoliticExpenses implements PoliticExpensesEvent {
  factory GetPoliticExpenses(String politicoId) = _$GetPoliticExpenses;

  @override
  String get politicoId;
  @override
  $GetPoliticExpensesCopyWith<GetPoliticExpenses> get copyWith;
}
