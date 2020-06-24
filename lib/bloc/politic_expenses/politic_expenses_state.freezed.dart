// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'politic_expenses_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PoliticExpensesStateTearOff {
  const _$PoliticExpensesStateTearOff();

  InitialPoliticExpensesState initial() {
    return InitialPoliticExpensesState();
  }

  GetPoliticExpensesSuccess getPoliticExpensesSuccess(
      List<DespesaModel> despesas) {
    return GetPoliticExpensesSuccess(
      despesas,
    );
  }

  GetPoliticExpensesFailed getPoliticExpensesFailed() {
    return GetPoliticExpensesFailed();
  }

  LoadingPoliticExpenses loadingPoliticExpenses() {
    return LoadingPoliticExpenses();
  }
}

// ignore: unused_element
const $PoliticExpensesState = _$PoliticExpensesStateTearOff();

mixin _$PoliticExpensesState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result getPoliticExpensesSuccess(List<DespesaModel> despesas),
    @required Result getPoliticExpensesFailed(),
    @required Result loadingPoliticExpenses(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getPoliticExpensesSuccess(List<DespesaModel> despesas),
    Result getPoliticExpensesFailed(),
    Result loadingPoliticExpenses(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticExpensesState value),
    @required Result getPoliticExpensesSuccess(GetPoliticExpensesSuccess value),
    @required Result getPoliticExpensesFailed(GetPoliticExpensesFailed value),
    @required Result loadingPoliticExpenses(LoadingPoliticExpenses value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticExpensesState value),
    Result getPoliticExpensesSuccess(GetPoliticExpensesSuccess value),
    Result getPoliticExpensesFailed(GetPoliticExpensesFailed value),
    Result loadingPoliticExpenses(LoadingPoliticExpenses value),
    @required Result orElse(),
  });
}

abstract class $PoliticExpensesStateCopyWith<$Res> {
  factory $PoliticExpensesStateCopyWith(PoliticExpensesState value,
          $Res Function(PoliticExpensesState) then) =
      _$PoliticExpensesStateCopyWithImpl<$Res>;
}

class _$PoliticExpensesStateCopyWithImpl<$Res>
    implements $PoliticExpensesStateCopyWith<$Res> {
  _$PoliticExpensesStateCopyWithImpl(this._value, this._then);

  final PoliticExpensesState _value;
  // ignore: unused_field
  final $Res Function(PoliticExpensesState) _then;
}

abstract class $InitialPoliticExpensesStateCopyWith<$Res> {
  factory $InitialPoliticExpensesStateCopyWith(
          InitialPoliticExpensesState value,
          $Res Function(InitialPoliticExpensesState) then) =
      _$InitialPoliticExpensesStateCopyWithImpl<$Res>;
}

class _$InitialPoliticExpensesStateCopyWithImpl<$Res>
    extends _$PoliticExpensesStateCopyWithImpl<$Res>
    implements $InitialPoliticExpensesStateCopyWith<$Res> {
  _$InitialPoliticExpensesStateCopyWithImpl(InitialPoliticExpensesState _value,
      $Res Function(InitialPoliticExpensesState) _then)
      : super(_value, (v) => _then(v as InitialPoliticExpensesState));

  @override
  InitialPoliticExpensesState get _value =>
      super._value as InitialPoliticExpensesState;
}

class _$InitialPoliticExpensesState implements InitialPoliticExpensesState {
  _$InitialPoliticExpensesState();

  @override
  String toString() {
    return 'PoliticExpensesState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialPoliticExpensesState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result getPoliticExpensesSuccess(List<DespesaModel> despesas),
    @required Result getPoliticExpensesFailed(),
    @required Result loadingPoliticExpenses(),
  }) {
    assert(initial != null);
    assert(getPoliticExpensesSuccess != null);
    assert(getPoliticExpensesFailed != null);
    assert(loadingPoliticExpenses != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getPoliticExpensesSuccess(List<DespesaModel> despesas),
    Result getPoliticExpensesFailed(),
    Result loadingPoliticExpenses(),
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
    @required Result initial(InitialPoliticExpensesState value),
    @required Result getPoliticExpensesSuccess(GetPoliticExpensesSuccess value),
    @required Result getPoliticExpensesFailed(GetPoliticExpensesFailed value),
    @required Result loadingPoliticExpenses(LoadingPoliticExpenses value),
  }) {
    assert(initial != null);
    assert(getPoliticExpensesSuccess != null);
    assert(getPoliticExpensesFailed != null);
    assert(loadingPoliticExpenses != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticExpensesState value),
    Result getPoliticExpensesSuccess(GetPoliticExpensesSuccess value),
    Result getPoliticExpensesFailed(GetPoliticExpensesFailed value),
    Result loadingPoliticExpenses(LoadingPoliticExpenses value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialPoliticExpensesState implements PoliticExpensesState {
  factory InitialPoliticExpensesState() = _$InitialPoliticExpensesState;
}

abstract class $GetPoliticExpensesSuccessCopyWith<$Res> {
  factory $GetPoliticExpensesSuccessCopyWith(GetPoliticExpensesSuccess value,
          $Res Function(GetPoliticExpensesSuccess) then) =
      _$GetPoliticExpensesSuccessCopyWithImpl<$Res>;
  $Res call({List<DespesaModel> despesas});
}

class _$GetPoliticExpensesSuccessCopyWithImpl<$Res>
    extends _$PoliticExpensesStateCopyWithImpl<$Res>
    implements $GetPoliticExpensesSuccessCopyWith<$Res> {
  _$GetPoliticExpensesSuccessCopyWithImpl(GetPoliticExpensesSuccess _value,
      $Res Function(GetPoliticExpensesSuccess) _then)
      : super(_value, (v) => _then(v as GetPoliticExpensesSuccess));

  @override
  GetPoliticExpensesSuccess get _value =>
      super._value as GetPoliticExpensesSuccess;

  @override
  $Res call({
    Object despesas = freezed,
  }) {
    return _then(GetPoliticExpensesSuccess(
      despesas == freezed ? _value.despesas : despesas as List<DespesaModel>,
    ));
  }
}

class _$GetPoliticExpensesSuccess implements GetPoliticExpensesSuccess {
  _$GetPoliticExpensesSuccess(this.despesas) : assert(despesas != null);

  @override
  final List<DespesaModel> despesas;

  @override
  String toString() {
    return 'PoliticExpensesState.getPoliticExpensesSuccess(despesas: $despesas)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetPoliticExpensesSuccess &&
            (identical(other.despesas, despesas) ||
                const DeepCollectionEquality()
                    .equals(other.despesas, despesas)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(despesas);

  @override
  $GetPoliticExpensesSuccessCopyWith<GetPoliticExpensesSuccess> get copyWith =>
      _$GetPoliticExpensesSuccessCopyWithImpl<GetPoliticExpensesSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result getPoliticExpensesSuccess(List<DespesaModel> despesas),
    @required Result getPoliticExpensesFailed(),
    @required Result loadingPoliticExpenses(),
  }) {
    assert(initial != null);
    assert(getPoliticExpensesSuccess != null);
    assert(getPoliticExpensesFailed != null);
    assert(loadingPoliticExpenses != null);
    return getPoliticExpensesSuccess(despesas);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getPoliticExpensesSuccess(List<DespesaModel> despesas),
    Result getPoliticExpensesFailed(),
    Result loadingPoliticExpenses(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPoliticExpensesSuccess != null) {
      return getPoliticExpensesSuccess(despesas);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticExpensesState value),
    @required Result getPoliticExpensesSuccess(GetPoliticExpensesSuccess value),
    @required Result getPoliticExpensesFailed(GetPoliticExpensesFailed value),
    @required Result loadingPoliticExpenses(LoadingPoliticExpenses value),
  }) {
    assert(initial != null);
    assert(getPoliticExpensesSuccess != null);
    assert(getPoliticExpensesFailed != null);
    assert(loadingPoliticExpenses != null);
    return getPoliticExpensesSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticExpensesState value),
    Result getPoliticExpensesSuccess(GetPoliticExpensesSuccess value),
    Result getPoliticExpensesFailed(GetPoliticExpensesFailed value),
    Result loadingPoliticExpenses(LoadingPoliticExpenses value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPoliticExpensesSuccess != null) {
      return getPoliticExpensesSuccess(this);
    }
    return orElse();
  }
}

abstract class GetPoliticExpensesSuccess implements PoliticExpensesState {
  factory GetPoliticExpensesSuccess(List<DespesaModel> despesas) =
      _$GetPoliticExpensesSuccess;

  List<DespesaModel> get despesas;
  $GetPoliticExpensesSuccessCopyWith<GetPoliticExpensesSuccess> get copyWith;
}

abstract class $GetPoliticExpensesFailedCopyWith<$Res> {
  factory $GetPoliticExpensesFailedCopyWith(GetPoliticExpensesFailed value,
          $Res Function(GetPoliticExpensesFailed) then) =
      _$GetPoliticExpensesFailedCopyWithImpl<$Res>;
}

class _$GetPoliticExpensesFailedCopyWithImpl<$Res>
    extends _$PoliticExpensesStateCopyWithImpl<$Res>
    implements $GetPoliticExpensesFailedCopyWith<$Res> {
  _$GetPoliticExpensesFailedCopyWithImpl(GetPoliticExpensesFailed _value,
      $Res Function(GetPoliticExpensesFailed) _then)
      : super(_value, (v) => _then(v as GetPoliticExpensesFailed));

  @override
  GetPoliticExpensesFailed get _value =>
      super._value as GetPoliticExpensesFailed;
}

class _$GetPoliticExpensesFailed implements GetPoliticExpensesFailed {
  _$GetPoliticExpensesFailed();

  @override
  String toString() {
    return 'PoliticExpensesState.getPoliticExpensesFailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetPoliticExpensesFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result getPoliticExpensesSuccess(List<DespesaModel> despesas),
    @required Result getPoliticExpensesFailed(),
    @required Result loadingPoliticExpenses(),
  }) {
    assert(initial != null);
    assert(getPoliticExpensesSuccess != null);
    assert(getPoliticExpensesFailed != null);
    assert(loadingPoliticExpenses != null);
    return getPoliticExpensesFailed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getPoliticExpensesSuccess(List<DespesaModel> despesas),
    Result getPoliticExpensesFailed(),
    Result loadingPoliticExpenses(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPoliticExpensesFailed != null) {
      return getPoliticExpensesFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticExpensesState value),
    @required Result getPoliticExpensesSuccess(GetPoliticExpensesSuccess value),
    @required Result getPoliticExpensesFailed(GetPoliticExpensesFailed value),
    @required Result loadingPoliticExpenses(LoadingPoliticExpenses value),
  }) {
    assert(initial != null);
    assert(getPoliticExpensesSuccess != null);
    assert(getPoliticExpensesFailed != null);
    assert(loadingPoliticExpenses != null);
    return getPoliticExpensesFailed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticExpensesState value),
    Result getPoliticExpensesSuccess(GetPoliticExpensesSuccess value),
    Result getPoliticExpensesFailed(GetPoliticExpensesFailed value),
    Result loadingPoliticExpenses(LoadingPoliticExpenses value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPoliticExpensesFailed != null) {
      return getPoliticExpensesFailed(this);
    }
    return orElse();
  }
}

abstract class GetPoliticExpensesFailed implements PoliticExpensesState {
  factory GetPoliticExpensesFailed() = _$GetPoliticExpensesFailed;
}

abstract class $LoadingPoliticExpensesCopyWith<$Res> {
  factory $LoadingPoliticExpensesCopyWith(LoadingPoliticExpenses value,
          $Res Function(LoadingPoliticExpenses) then) =
      _$LoadingPoliticExpensesCopyWithImpl<$Res>;
}

class _$LoadingPoliticExpensesCopyWithImpl<$Res>
    extends _$PoliticExpensesStateCopyWithImpl<$Res>
    implements $LoadingPoliticExpensesCopyWith<$Res> {
  _$LoadingPoliticExpensesCopyWithImpl(LoadingPoliticExpenses _value,
      $Res Function(LoadingPoliticExpenses) _then)
      : super(_value, (v) => _then(v as LoadingPoliticExpenses));

  @override
  LoadingPoliticExpenses get _value => super._value as LoadingPoliticExpenses;
}

class _$LoadingPoliticExpenses implements LoadingPoliticExpenses {
  _$LoadingPoliticExpenses();

  @override
  String toString() {
    return 'PoliticExpensesState.loadingPoliticExpenses()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadingPoliticExpenses);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result getPoliticExpensesSuccess(List<DespesaModel> despesas),
    @required Result getPoliticExpensesFailed(),
    @required Result loadingPoliticExpenses(),
  }) {
    assert(initial != null);
    assert(getPoliticExpensesSuccess != null);
    assert(getPoliticExpensesFailed != null);
    assert(loadingPoliticExpenses != null);
    return loadingPoliticExpenses();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getPoliticExpensesSuccess(List<DespesaModel> despesas),
    Result getPoliticExpensesFailed(),
    Result loadingPoliticExpenses(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingPoliticExpenses != null) {
      return loadingPoliticExpenses();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPoliticExpensesState value),
    @required Result getPoliticExpensesSuccess(GetPoliticExpensesSuccess value),
    @required Result getPoliticExpensesFailed(GetPoliticExpensesFailed value),
    @required Result loadingPoliticExpenses(LoadingPoliticExpenses value),
  }) {
    assert(initial != null);
    assert(getPoliticExpensesSuccess != null);
    assert(getPoliticExpensesFailed != null);
    assert(loadingPoliticExpenses != null);
    return loadingPoliticExpenses(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPoliticExpensesState value),
    Result getPoliticExpensesSuccess(GetPoliticExpensesSuccess value),
    Result getPoliticExpensesFailed(GetPoliticExpensesFailed value),
    Result loadingPoliticExpenses(LoadingPoliticExpenses value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingPoliticExpenses != null) {
      return loadingPoliticExpenses(this);
    }
    return orElse();
  }
}

abstract class LoadingPoliticExpenses implements PoliticExpensesState {
  factory LoadingPoliticExpenses() = _$LoadingPoliticExpenses;
}
