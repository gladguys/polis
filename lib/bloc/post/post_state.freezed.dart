// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'post_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PostStateTearOff {
  const _$PostStateTearOff();

  InitialPostState initial() {
    return InitialPostState();
  }

  PostFavoriteStatusChanged postFavoriteStatusChanged(
      {dynamic post, bool isFavorite}) {
    return PostFavoriteStatusChanged(
      post: post,
      isFavorite: isFavorite,
    );
  }

  PostFavoritedSuccess postFavoritedSuccess() {
    return PostFavoritedSuccess();
  }

  PostFavoritedFailed postFavoritedFailed() {
    return PostFavoritedFailed();
  }

  PostSharedSuccess postSharedSuccess() {
    return PostSharedSuccess();
  }

  PostSharedFailed postSharedFailed() {
    return PostSharedFailed();
  }

  PostViewedFailed postViewedFailed() {
    return PostViewedFailed();
  }
}

// ignore: unused_element
const $PostState = _$PostStateTearOff();

mixin _$PostState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result postFavoriteStatusChanged(dynamic post, bool isFavorite),
    @required Result postFavoritedSuccess(),
    @required Result postFavoritedFailed(),
    @required Result postSharedSuccess(),
    @required Result postSharedFailed(),
    @required Result postViewedFailed(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result postFavoriteStatusChanged(dynamic post, bool isFavorite),
    Result postFavoritedSuccess(),
    Result postFavoritedFailed(),
    Result postSharedSuccess(),
    Result postSharedFailed(),
    Result postViewedFailed(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPostState value),
    @required Result postFavoriteStatusChanged(PostFavoriteStatusChanged value),
    @required Result postFavoritedSuccess(PostFavoritedSuccess value),
    @required Result postFavoritedFailed(PostFavoritedFailed value),
    @required Result postSharedSuccess(PostSharedSuccess value),
    @required Result postSharedFailed(PostSharedFailed value),
    @required Result postViewedFailed(PostViewedFailed value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPostState value),
    Result postFavoriteStatusChanged(PostFavoriteStatusChanged value),
    Result postFavoritedSuccess(PostFavoritedSuccess value),
    Result postFavoritedFailed(PostFavoritedFailed value),
    Result postSharedSuccess(PostSharedSuccess value),
    Result postSharedFailed(PostSharedFailed value),
    Result postViewedFailed(PostViewedFailed value),
    @required Result orElse(),
  });
}

abstract class $PostStateCopyWith<$Res> {
  factory $PostStateCopyWith(PostState value, $Res Function(PostState) then) =
      _$PostStateCopyWithImpl<$Res>;
}

class _$PostStateCopyWithImpl<$Res> implements $PostStateCopyWith<$Res> {
  _$PostStateCopyWithImpl(this._value, this._then);

  final PostState _value;
  // ignore: unused_field
  final $Res Function(PostState) _then;
}

abstract class $InitialPostStateCopyWith<$Res> {
  factory $InitialPostStateCopyWith(
          InitialPostState value, $Res Function(InitialPostState) then) =
      _$InitialPostStateCopyWithImpl<$Res>;
}

class _$InitialPostStateCopyWithImpl<$Res> extends _$PostStateCopyWithImpl<$Res>
    implements $InitialPostStateCopyWith<$Res> {
  _$InitialPostStateCopyWithImpl(
      InitialPostState _value, $Res Function(InitialPostState) _then)
      : super(_value, (v) => _then(v as InitialPostState));

  @override
  InitialPostState get _value => super._value as InitialPostState;
}

class _$InitialPostState implements InitialPostState {
  _$InitialPostState();

  @override
  String toString() {
    return 'PostState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialPostState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result postFavoriteStatusChanged(dynamic post, bool isFavorite),
    @required Result postFavoritedSuccess(),
    @required Result postFavoritedFailed(),
    @required Result postSharedSuccess(),
    @required Result postSharedFailed(),
    @required Result postViewedFailed(),
  }) {
    assert(initial != null);
    assert(postFavoriteStatusChanged != null);
    assert(postFavoritedSuccess != null);
    assert(postFavoritedFailed != null);
    assert(postSharedSuccess != null);
    assert(postSharedFailed != null);
    assert(postViewedFailed != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result postFavoriteStatusChanged(dynamic post, bool isFavorite),
    Result postFavoritedSuccess(),
    Result postFavoritedFailed(),
    Result postSharedSuccess(),
    Result postSharedFailed(),
    Result postViewedFailed(),
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
    @required Result initial(InitialPostState value),
    @required Result postFavoriteStatusChanged(PostFavoriteStatusChanged value),
    @required Result postFavoritedSuccess(PostFavoritedSuccess value),
    @required Result postFavoritedFailed(PostFavoritedFailed value),
    @required Result postSharedSuccess(PostSharedSuccess value),
    @required Result postSharedFailed(PostSharedFailed value),
    @required Result postViewedFailed(PostViewedFailed value),
  }) {
    assert(initial != null);
    assert(postFavoriteStatusChanged != null);
    assert(postFavoritedSuccess != null);
    assert(postFavoritedFailed != null);
    assert(postSharedSuccess != null);
    assert(postSharedFailed != null);
    assert(postViewedFailed != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPostState value),
    Result postFavoriteStatusChanged(PostFavoriteStatusChanged value),
    Result postFavoritedSuccess(PostFavoritedSuccess value),
    Result postFavoritedFailed(PostFavoritedFailed value),
    Result postSharedSuccess(PostSharedSuccess value),
    Result postSharedFailed(PostSharedFailed value),
    Result postViewedFailed(PostViewedFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialPostState implements PostState {
  factory InitialPostState() = _$InitialPostState;
}

abstract class $PostFavoriteStatusChangedCopyWith<$Res> {
  factory $PostFavoriteStatusChangedCopyWith(PostFavoriteStatusChanged value,
          $Res Function(PostFavoriteStatusChanged) then) =
      _$PostFavoriteStatusChangedCopyWithImpl<$Res>;
  $Res call({dynamic post, bool isFavorite});
}

class _$PostFavoriteStatusChangedCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res>
    implements $PostFavoriteStatusChangedCopyWith<$Res> {
  _$PostFavoriteStatusChangedCopyWithImpl(PostFavoriteStatusChanged _value,
      $Res Function(PostFavoriteStatusChanged) _then)
      : super(_value, (v) => _then(v as PostFavoriteStatusChanged));

  @override
  PostFavoriteStatusChanged get _value =>
      super._value as PostFavoriteStatusChanged;

  @override
  $Res call({
    Object post = freezed,
    Object isFavorite = freezed,
  }) {
    return _then(PostFavoriteStatusChanged(
      post: post == freezed ? _value.post : post as dynamic,
      isFavorite:
          isFavorite == freezed ? _value.isFavorite : isFavorite as bool,
    ));
  }
}

class _$PostFavoriteStatusChanged implements PostFavoriteStatusChanged {
  _$PostFavoriteStatusChanged({this.post, this.isFavorite});

  @override
  final dynamic post;
  @override
  final bool isFavorite;

  @override
  String toString() {
    return 'PostState.postFavoriteStatusChanged(post: $post, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PostFavoriteStatusChanged &&
            (identical(other.post, post) ||
                const DeepCollectionEquality().equals(other.post, post)) &&
            (identical(other.isFavorite, isFavorite) ||
                const DeepCollectionEquality()
                    .equals(other.isFavorite, isFavorite)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(post) ^
      const DeepCollectionEquality().hash(isFavorite);

  @override
  $PostFavoriteStatusChangedCopyWith<PostFavoriteStatusChanged> get copyWith =>
      _$PostFavoriteStatusChangedCopyWithImpl<PostFavoriteStatusChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result postFavoriteStatusChanged(dynamic post, bool isFavorite),
    @required Result postFavoritedSuccess(),
    @required Result postFavoritedFailed(),
    @required Result postSharedSuccess(),
    @required Result postSharedFailed(),
    @required Result postViewedFailed(),
  }) {
    assert(initial != null);
    assert(postFavoriteStatusChanged != null);
    assert(postFavoritedSuccess != null);
    assert(postFavoritedFailed != null);
    assert(postSharedSuccess != null);
    assert(postSharedFailed != null);
    assert(postViewedFailed != null);
    return postFavoriteStatusChanged(post, isFavorite);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result postFavoriteStatusChanged(dynamic post, bool isFavorite),
    Result postFavoritedSuccess(),
    Result postFavoritedFailed(),
    Result postSharedSuccess(),
    Result postSharedFailed(),
    Result postViewedFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (postFavoriteStatusChanged != null) {
      return postFavoriteStatusChanged(post, isFavorite);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPostState value),
    @required Result postFavoriteStatusChanged(PostFavoriteStatusChanged value),
    @required Result postFavoritedSuccess(PostFavoritedSuccess value),
    @required Result postFavoritedFailed(PostFavoritedFailed value),
    @required Result postSharedSuccess(PostSharedSuccess value),
    @required Result postSharedFailed(PostSharedFailed value),
    @required Result postViewedFailed(PostViewedFailed value),
  }) {
    assert(initial != null);
    assert(postFavoriteStatusChanged != null);
    assert(postFavoritedSuccess != null);
    assert(postFavoritedFailed != null);
    assert(postSharedSuccess != null);
    assert(postSharedFailed != null);
    assert(postViewedFailed != null);
    return postFavoriteStatusChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPostState value),
    Result postFavoriteStatusChanged(PostFavoriteStatusChanged value),
    Result postFavoritedSuccess(PostFavoritedSuccess value),
    Result postFavoritedFailed(PostFavoritedFailed value),
    Result postSharedSuccess(PostSharedSuccess value),
    Result postSharedFailed(PostSharedFailed value),
    Result postViewedFailed(PostViewedFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (postFavoriteStatusChanged != null) {
      return postFavoriteStatusChanged(this);
    }
    return orElse();
  }
}

abstract class PostFavoriteStatusChanged implements PostState {
  factory PostFavoriteStatusChanged({dynamic post, bool isFavorite}) =
      _$PostFavoriteStatusChanged;

  dynamic get post;
  bool get isFavorite;
  $PostFavoriteStatusChangedCopyWith<PostFavoriteStatusChanged> get copyWith;
}

abstract class $PostFavoritedSuccessCopyWith<$Res> {
  factory $PostFavoritedSuccessCopyWith(PostFavoritedSuccess value,
          $Res Function(PostFavoritedSuccess) then) =
      _$PostFavoritedSuccessCopyWithImpl<$Res>;
}

class _$PostFavoritedSuccessCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res>
    implements $PostFavoritedSuccessCopyWith<$Res> {
  _$PostFavoritedSuccessCopyWithImpl(
      PostFavoritedSuccess _value, $Res Function(PostFavoritedSuccess) _then)
      : super(_value, (v) => _then(v as PostFavoritedSuccess));

  @override
  PostFavoritedSuccess get _value => super._value as PostFavoritedSuccess;
}

class _$PostFavoritedSuccess implements PostFavoritedSuccess {
  _$PostFavoritedSuccess();

  @override
  String toString() {
    return 'PostState.postFavoritedSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is PostFavoritedSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result postFavoriteStatusChanged(dynamic post, bool isFavorite),
    @required Result postFavoritedSuccess(),
    @required Result postFavoritedFailed(),
    @required Result postSharedSuccess(),
    @required Result postSharedFailed(),
    @required Result postViewedFailed(),
  }) {
    assert(initial != null);
    assert(postFavoriteStatusChanged != null);
    assert(postFavoritedSuccess != null);
    assert(postFavoritedFailed != null);
    assert(postSharedSuccess != null);
    assert(postSharedFailed != null);
    assert(postViewedFailed != null);
    return postFavoritedSuccess();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result postFavoriteStatusChanged(dynamic post, bool isFavorite),
    Result postFavoritedSuccess(),
    Result postFavoritedFailed(),
    Result postSharedSuccess(),
    Result postSharedFailed(),
    Result postViewedFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (postFavoritedSuccess != null) {
      return postFavoritedSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPostState value),
    @required Result postFavoriteStatusChanged(PostFavoriteStatusChanged value),
    @required Result postFavoritedSuccess(PostFavoritedSuccess value),
    @required Result postFavoritedFailed(PostFavoritedFailed value),
    @required Result postSharedSuccess(PostSharedSuccess value),
    @required Result postSharedFailed(PostSharedFailed value),
    @required Result postViewedFailed(PostViewedFailed value),
  }) {
    assert(initial != null);
    assert(postFavoriteStatusChanged != null);
    assert(postFavoritedSuccess != null);
    assert(postFavoritedFailed != null);
    assert(postSharedSuccess != null);
    assert(postSharedFailed != null);
    assert(postViewedFailed != null);
    return postFavoritedSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPostState value),
    Result postFavoriteStatusChanged(PostFavoriteStatusChanged value),
    Result postFavoritedSuccess(PostFavoritedSuccess value),
    Result postFavoritedFailed(PostFavoritedFailed value),
    Result postSharedSuccess(PostSharedSuccess value),
    Result postSharedFailed(PostSharedFailed value),
    Result postViewedFailed(PostViewedFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (postFavoritedSuccess != null) {
      return postFavoritedSuccess(this);
    }
    return orElse();
  }
}

abstract class PostFavoritedSuccess implements PostState {
  factory PostFavoritedSuccess() = _$PostFavoritedSuccess;
}

abstract class $PostFavoritedFailedCopyWith<$Res> {
  factory $PostFavoritedFailedCopyWith(
          PostFavoritedFailed value, $Res Function(PostFavoritedFailed) then) =
      _$PostFavoritedFailedCopyWithImpl<$Res>;
}

class _$PostFavoritedFailedCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res>
    implements $PostFavoritedFailedCopyWith<$Res> {
  _$PostFavoritedFailedCopyWithImpl(
      PostFavoritedFailed _value, $Res Function(PostFavoritedFailed) _then)
      : super(_value, (v) => _then(v as PostFavoritedFailed));

  @override
  PostFavoritedFailed get _value => super._value as PostFavoritedFailed;
}

class _$PostFavoritedFailed implements PostFavoritedFailed {
  _$PostFavoritedFailed();

  @override
  String toString() {
    return 'PostState.postFavoritedFailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is PostFavoritedFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result postFavoriteStatusChanged(dynamic post, bool isFavorite),
    @required Result postFavoritedSuccess(),
    @required Result postFavoritedFailed(),
    @required Result postSharedSuccess(),
    @required Result postSharedFailed(),
    @required Result postViewedFailed(),
  }) {
    assert(initial != null);
    assert(postFavoriteStatusChanged != null);
    assert(postFavoritedSuccess != null);
    assert(postFavoritedFailed != null);
    assert(postSharedSuccess != null);
    assert(postSharedFailed != null);
    assert(postViewedFailed != null);
    return postFavoritedFailed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result postFavoriteStatusChanged(dynamic post, bool isFavorite),
    Result postFavoritedSuccess(),
    Result postFavoritedFailed(),
    Result postSharedSuccess(),
    Result postSharedFailed(),
    Result postViewedFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (postFavoritedFailed != null) {
      return postFavoritedFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPostState value),
    @required Result postFavoriteStatusChanged(PostFavoriteStatusChanged value),
    @required Result postFavoritedSuccess(PostFavoritedSuccess value),
    @required Result postFavoritedFailed(PostFavoritedFailed value),
    @required Result postSharedSuccess(PostSharedSuccess value),
    @required Result postSharedFailed(PostSharedFailed value),
    @required Result postViewedFailed(PostViewedFailed value),
  }) {
    assert(initial != null);
    assert(postFavoriteStatusChanged != null);
    assert(postFavoritedSuccess != null);
    assert(postFavoritedFailed != null);
    assert(postSharedSuccess != null);
    assert(postSharedFailed != null);
    assert(postViewedFailed != null);
    return postFavoritedFailed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPostState value),
    Result postFavoriteStatusChanged(PostFavoriteStatusChanged value),
    Result postFavoritedSuccess(PostFavoritedSuccess value),
    Result postFavoritedFailed(PostFavoritedFailed value),
    Result postSharedSuccess(PostSharedSuccess value),
    Result postSharedFailed(PostSharedFailed value),
    Result postViewedFailed(PostViewedFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (postFavoritedFailed != null) {
      return postFavoritedFailed(this);
    }
    return orElse();
  }
}

abstract class PostFavoritedFailed implements PostState {
  factory PostFavoritedFailed() = _$PostFavoritedFailed;
}

abstract class $PostSharedSuccessCopyWith<$Res> {
  factory $PostSharedSuccessCopyWith(
          PostSharedSuccess value, $Res Function(PostSharedSuccess) then) =
      _$PostSharedSuccessCopyWithImpl<$Res>;
}

class _$PostSharedSuccessCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res>
    implements $PostSharedSuccessCopyWith<$Res> {
  _$PostSharedSuccessCopyWithImpl(
      PostSharedSuccess _value, $Res Function(PostSharedSuccess) _then)
      : super(_value, (v) => _then(v as PostSharedSuccess));

  @override
  PostSharedSuccess get _value => super._value as PostSharedSuccess;
}

class _$PostSharedSuccess implements PostSharedSuccess {
  _$PostSharedSuccess();

  @override
  String toString() {
    return 'PostState.postSharedSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is PostSharedSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result postFavoriteStatusChanged(dynamic post, bool isFavorite),
    @required Result postFavoritedSuccess(),
    @required Result postFavoritedFailed(),
    @required Result postSharedSuccess(),
    @required Result postSharedFailed(),
    @required Result postViewedFailed(),
  }) {
    assert(initial != null);
    assert(postFavoriteStatusChanged != null);
    assert(postFavoritedSuccess != null);
    assert(postFavoritedFailed != null);
    assert(postSharedSuccess != null);
    assert(postSharedFailed != null);
    assert(postViewedFailed != null);
    return postSharedSuccess();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result postFavoriteStatusChanged(dynamic post, bool isFavorite),
    Result postFavoritedSuccess(),
    Result postFavoritedFailed(),
    Result postSharedSuccess(),
    Result postSharedFailed(),
    Result postViewedFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (postSharedSuccess != null) {
      return postSharedSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPostState value),
    @required Result postFavoriteStatusChanged(PostFavoriteStatusChanged value),
    @required Result postFavoritedSuccess(PostFavoritedSuccess value),
    @required Result postFavoritedFailed(PostFavoritedFailed value),
    @required Result postSharedSuccess(PostSharedSuccess value),
    @required Result postSharedFailed(PostSharedFailed value),
    @required Result postViewedFailed(PostViewedFailed value),
  }) {
    assert(initial != null);
    assert(postFavoriteStatusChanged != null);
    assert(postFavoritedSuccess != null);
    assert(postFavoritedFailed != null);
    assert(postSharedSuccess != null);
    assert(postSharedFailed != null);
    assert(postViewedFailed != null);
    return postSharedSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPostState value),
    Result postFavoriteStatusChanged(PostFavoriteStatusChanged value),
    Result postFavoritedSuccess(PostFavoritedSuccess value),
    Result postFavoritedFailed(PostFavoritedFailed value),
    Result postSharedSuccess(PostSharedSuccess value),
    Result postSharedFailed(PostSharedFailed value),
    Result postViewedFailed(PostViewedFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (postSharedSuccess != null) {
      return postSharedSuccess(this);
    }
    return orElse();
  }
}

abstract class PostSharedSuccess implements PostState {
  factory PostSharedSuccess() = _$PostSharedSuccess;
}

abstract class $PostSharedFailedCopyWith<$Res> {
  factory $PostSharedFailedCopyWith(
          PostSharedFailed value, $Res Function(PostSharedFailed) then) =
      _$PostSharedFailedCopyWithImpl<$Res>;
}

class _$PostSharedFailedCopyWithImpl<$Res> extends _$PostStateCopyWithImpl<$Res>
    implements $PostSharedFailedCopyWith<$Res> {
  _$PostSharedFailedCopyWithImpl(
      PostSharedFailed _value, $Res Function(PostSharedFailed) _then)
      : super(_value, (v) => _then(v as PostSharedFailed));

  @override
  PostSharedFailed get _value => super._value as PostSharedFailed;
}

class _$PostSharedFailed implements PostSharedFailed {
  _$PostSharedFailed();

  @override
  String toString() {
    return 'PostState.postSharedFailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is PostSharedFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result postFavoriteStatusChanged(dynamic post, bool isFavorite),
    @required Result postFavoritedSuccess(),
    @required Result postFavoritedFailed(),
    @required Result postSharedSuccess(),
    @required Result postSharedFailed(),
    @required Result postViewedFailed(),
  }) {
    assert(initial != null);
    assert(postFavoriteStatusChanged != null);
    assert(postFavoritedSuccess != null);
    assert(postFavoritedFailed != null);
    assert(postSharedSuccess != null);
    assert(postSharedFailed != null);
    assert(postViewedFailed != null);
    return postSharedFailed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result postFavoriteStatusChanged(dynamic post, bool isFavorite),
    Result postFavoritedSuccess(),
    Result postFavoritedFailed(),
    Result postSharedSuccess(),
    Result postSharedFailed(),
    Result postViewedFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (postSharedFailed != null) {
      return postSharedFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPostState value),
    @required Result postFavoriteStatusChanged(PostFavoriteStatusChanged value),
    @required Result postFavoritedSuccess(PostFavoritedSuccess value),
    @required Result postFavoritedFailed(PostFavoritedFailed value),
    @required Result postSharedSuccess(PostSharedSuccess value),
    @required Result postSharedFailed(PostSharedFailed value),
    @required Result postViewedFailed(PostViewedFailed value),
  }) {
    assert(initial != null);
    assert(postFavoriteStatusChanged != null);
    assert(postFavoritedSuccess != null);
    assert(postFavoritedFailed != null);
    assert(postSharedSuccess != null);
    assert(postSharedFailed != null);
    assert(postViewedFailed != null);
    return postSharedFailed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPostState value),
    Result postFavoriteStatusChanged(PostFavoriteStatusChanged value),
    Result postFavoritedSuccess(PostFavoritedSuccess value),
    Result postFavoritedFailed(PostFavoritedFailed value),
    Result postSharedSuccess(PostSharedSuccess value),
    Result postSharedFailed(PostSharedFailed value),
    Result postViewedFailed(PostViewedFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (postSharedFailed != null) {
      return postSharedFailed(this);
    }
    return orElse();
  }
}

abstract class PostSharedFailed implements PostState {
  factory PostSharedFailed() = _$PostSharedFailed;
}

abstract class $PostViewedFailedCopyWith<$Res> {
  factory $PostViewedFailedCopyWith(
          PostViewedFailed value, $Res Function(PostViewedFailed) then) =
      _$PostViewedFailedCopyWithImpl<$Res>;
}

class _$PostViewedFailedCopyWithImpl<$Res> extends _$PostStateCopyWithImpl<$Res>
    implements $PostViewedFailedCopyWith<$Res> {
  _$PostViewedFailedCopyWithImpl(
      PostViewedFailed _value, $Res Function(PostViewedFailed) _then)
      : super(_value, (v) => _then(v as PostViewedFailed));

  @override
  PostViewedFailed get _value => super._value as PostViewedFailed;
}

class _$PostViewedFailed implements PostViewedFailed {
  _$PostViewedFailed();

  @override
  String toString() {
    return 'PostState.postViewedFailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is PostViewedFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result postFavoriteStatusChanged(dynamic post, bool isFavorite),
    @required Result postFavoritedSuccess(),
    @required Result postFavoritedFailed(),
    @required Result postSharedSuccess(),
    @required Result postSharedFailed(),
    @required Result postViewedFailed(),
  }) {
    assert(initial != null);
    assert(postFavoriteStatusChanged != null);
    assert(postFavoritedSuccess != null);
    assert(postFavoritedFailed != null);
    assert(postSharedSuccess != null);
    assert(postSharedFailed != null);
    assert(postViewedFailed != null);
    return postViewedFailed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result postFavoriteStatusChanged(dynamic post, bool isFavorite),
    Result postFavoritedSuccess(),
    Result postFavoritedFailed(),
    Result postSharedSuccess(),
    Result postSharedFailed(),
    Result postViewedFailed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (postViewedFailed != null) {
      return postViewedFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialPostState value),
    @required Result postFavoriteStatusChanged(PostFavoriteStatusChanged value),
    @required Result postFavoritedSuccess(PostFavoritedSuccess value),
    @required Result postFavoritedFailed(PostFavoritedFailed value),
    @required Result postSharedSuccess(PostSharedSuccess value),
    @required Result postSharedFailed(PostSharedFailed value),
    @required Result postViewedFailed(PostViewedFailed value),
  }) {
    assert(initial != null);
    assert(postFavoriteStatusChanged != null);
    assert(postFavoritedSuccess != null);
    assert(postFavoritedFailed != null);
    assert(postSharedSuccess != null);
    assert(postSharedFailed != null);
    assert(postViewedFailed != null);
    return postViewedFailed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialPostState value),
    Result postFavoriteStatusChanged(PostFavoriteStatusChanged value),
    Result postFavoritedSuccess(PostFavoritedSuccess value),
    Result postFavoritedFailed(PostFavoritedFailed value),
    Result postSharedSuccess(PostSharedSuccess value),
    Result postSharedFailed(PostSharedFailed value),
    Result postViewedFailed(PostViewedFailed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (postViewedFailed != null) {
      return postViewedFailed(this);
    }
    return orElse();
  }
}

abstract class PostViewedFailed implements PostState {
  factory PostViewedFailed() = _$PostViewedFailed;
}
