// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'document_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$DocumentStateTearOff {
  const _$DocumentStateTearOff();

  InitialDocumentState initial() {
    return InitialDocumentState();
  }

  LaunchUrlFailed launchUrlFailed() {
    return LaunchUrlFailed();
  }
}

// ignore: unused_element
const $DocumentState = _$DocumentStateTearOff();

mixin _$DocumentState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result launchUrlFailed(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result launchUrlFailed(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialDocumentState value),
    @required Result launchUrlFailed(LaunchUrlFailed value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialDocumentState value),
    Result launchUrlFailed(LaunchUrlFailed value),
    @required Result orElse(),
  });
}

abstract class $DocumentStateCopyWith<$Res> {
  factory $DocumentStateCopyWith(
          DocumentState value, $Res Function(DocumentState) then) =
      _$DocumentStateCopyWithImpl<$Res>;
}

class _$DocumentStateCopyWithImpl<$Res>
    implements $DocumentStateCopyWith<$Res> {
  _$DocumentStateCopyWithImpl(this._value, this._then);

  final DocumentState _value;
  // ignore: unused_field
  final $Res Function(DocumentState) _then;
}

abstract class $InitialDocumentStateCopyWith<$Res> {
  factory $InitialDocumentStateCopyWith(InitialDocumentState value,
          $Res Function(InitialDocumentState) then) =
      _$InitialDocumentStateCopyWithImpl<$Res>;
}

class _$InitialDocumentStateCopyWithImpl<$Res>
    extends _$DocumentStateCopyWithImpl<$Res>
    implements $InitialDocumentStateCopyWith<$Res> {
  _$InitialDocumentStateCopyWithImpl(
      InitialDocumentState _value, $Res Function(InitialDocumentState) _then)
      : super(_value, (v) => _then(v as InitialDocumentState));

  @override
  InitialDocumentState get _value => super._value as InitialDocumentState;
}

class _$InitialDocumentState implements InitialDocumentState {
  _$InitialDocumentState();

  @override
  String toString() {
    return 'DocumentState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialDocumentState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result launchUrlFailed(),
  }) {
    assert(initial != null);
    assert(launchUrlFailed != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result launchUrlFailed(),
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
    @required Result initial(InitialDocumentState value),
    @required Result launchUrlFailed(LaunchUrlFailed value),
  }) {
    assert(initial != null);
    assert(launchUrlFailed != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialDocumentState value),
    Result launchUrlFailed(LaunchUrlFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialDocumentState implements DocumentState {
  factory InitialDocumentState() = _$InitialDocumentState;
}

abstract class $LaunchUrlFailedCopyWith<$Res> {
  factory $LaunchUrlFailedCopyWith(
          LaunchUrlFailed value, $Res Function(LaunchUrlFailed) then) =
      _$LaunchUrlFailedCopyWithImpl<$Res>;
}

class _$LaunchUrlFailedCopyWithImpl<$Res>
    extends _$DocumentStateCopyWithImpl<$Res>
    implements $LaunchUrlFailedCopyWith<$Res> {
  _$LaunchUrlFailedCopyWithImpl(
      LaunchUrlFailed _value, $Res Function(LaunchUrlFailed) _then)
      : super(_value, (v) => _then(v as LaunchUrlFailed));

  @override
  LaunchUrlFailed get _value => super._value as LaunchUrlFailed;
}

class _$LaunchUrlFailed implements LaunchUrlFailed {
  _$LaunchUrlFailed();

  @override
  String toString() {
    return 'DocumentState.launchUrlFailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LaunchUrlFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result launchUrlFailed(),
  }) {
    assert(initial != null);
    assert(launchUrlFailed != null);
    return launchUrlFailed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result launchUrlFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (launchUrlFailed != null) {
      return launchUrlFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialDocumentState value),
    @required Result launchUrlFailed(LaunchUrlFailed value),
  }) {
    assert(initial != null);
    assert(launchUrlFailed != null);
    return launchUrlFailed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialDocumentState value),
    Result launchUrlFailed(LaunchUrlFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (launchUrlFailed != null) {
      return launchUrlFailed(this);
    }
    return orElse();
  }
}

abstract class LaunchUrlFailed implements DocumentState {
  factory LaunchUrlFailed() = _$LaunchUrlFailed;
}
