// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'favorite_posts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$FavoritePostsStateTearOff {
  const _$FavoritePostsStateTearOff();

  InitialFavoritePostsState initial() {
    return InitialFavoritePostsState();
  }

  FetchUserFavoritePostsSuccess fetchUserFavoritePostsSuccess(
      List<dynamic> posts) {
    return FetchUserFavoritePostsSuccess(
      posts,
    );
  }

  FetchUserFavoritePostsFailed fetchUserFavoritePostsFailed() {
    return FetchUserFavoritePostsFailed();
  }

  LoadingFavoritesPosts loadingFavoritesPosts() {
    return LoadingFavoritesPosts();
  }
}

// ignore: unused_element
const $FavoritePostsState = _$FavoritePostsStateTearOff();

mixin _$FavoritePostsState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result fetchUserFavoritePostsSuccess(List<dynamic> posts),
    @required Result fetchUserFavoritePostsFailed(),
    @required Result loadingFavoritesPosts(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result fetchUserFavoritePostsSuccess(List<dynamic> posts),
    Result fetchUserFavoritePostsFailed(),
    Result loadingFavoritesPosts(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialFavoritePostsState value),
    @required
        Result fetchUserFavoritePostsSuccess(
            FetchUserFavoritePostsSuccess value),
    @required
        Result fetchUserFavoritePostsFailed(FetchUserFavoritePostsFailed value),
    @required Result loadingFavoritesPosts(LoadingFavoritesPosts value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialFavoritePostsState value),
    Result fetchUserFavoritePostsSuccess(FetchUserFavoritePostsSuccess value),
    Result fetchUserFavoritePostsFailed(FetchUserFavoritePostsFailed value),
    Result loadingFavoritesPosts(LoadingFavoritesPosts value),
    @required Result orElse(),
  });
}

abstract class $FavoritePostsStateCopyWith<$Res> {
  factory $FavoritePostsStateCopyWith(
          FavoritePostsState value, $Res Function(FavoritePostsState) then) =
      _$FavoritePostsStateCopyWithImpl<$Res>;
}

class _$FavoritePostsStateCopyWithImpl<$Res>
    implements $FavoritePostsStateCopyWith<$Res> {
  _$FavoritePostsStateCopyWithImpl(this._value, this._then);

  final FavoritePostsState _value;
  // ignore: unused_field
  final $Res Function(FavoritePostsState) _then;
}

abstract class $InitialFavoritePostsStateCopyWith<$Res> {
  factory $InitialFavoritePostsStateCopyWith(InitialFavoritePostsState value,
          $Res Function(InitialFavoritePostsState) then) =
      _$InitialFavoritePostsStateCopyWithImpl<$Res>;
}

class _$InitialFavoritePostsStateCopyWithImpl<$Res>
    extends _$FavoritePostsStateCopyWithImpl<$Res>
    implements $InitialFavoritePostsStateCopyWith<$Res> {
  _$InitialFavoritePostsStateCopyWithImpl(InitialFavoritePostsState _value,
      $Res Function(InitialFavoritePostsState) _then)
      : super(_value, (v) => _then(v as InitialFavoritePostsState));

  @override
  InitialFavoritePostsState get _value =>
      super._value as InitialFavoritePostsState;
}

class _$InitialFavoritePostsState implements InitialFavoritePostsState {
  _$InitialFavoritePostsState();

  @override
  String toString() {
    return 'FavoritePostsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialFavoritePostsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result fetchUserFavoritePostsSuccess(List<dynamic> posts),
    @required Result fetchUserFavoritePostsFailed(),
    @required Result loadingFavoritesPosts(),
  }) {
    assert(initial != null);
    assert(fetchUserFavoritePostsSuccess != null);
    assert(fetchUserFavoritePostsFailed != null);
    assert(loadingFavoritesPosts != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result fetchUserFavoritePostsSuccess(List<dynamic> posts),
    Result fetchUserFavoritePostsFailed(),
    Result loadingFavoritesPosts(),
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
    @required Result initial(InitialFavoritePostsState value),
    @required
        Result fetchUserFavoritePostsSuccess(
            FetchUserFavoritePostsSuccess value),
    @required
        Result fetchUserFavoritePostsFailed(FetchUserFavoritePostsFailed value),
    @required Result loadingFavoritesPosts(LoadingFavoritesPosts value),
  }) {
    assert(initial != null);
    assert(fetchUserFavoritePostsSuccess != null);
    assert(fetchUserFavoritePostsFailed != null);
    assert(loadingFavoritesPosts != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialFavoritePostsState value),
    Result fetchUserFavoritePostsSuccess(FetchUserFavoritePostsSuccess value),
    Result fetchUserFavoritePostsFailed(FetchUserFavoritePostsFailed value),
    Result loadingFavoritesPosts(LoadingFavoritesPosts value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialFavoritePostsState implements FavoritePostsState {
  factory InitialFavoritePostsState() = _$InitialFavoritePostsState;
}

abstract class $FetchUserFavoritePostsSuccessCopyWith<$Res> {
  factory $FetchUserFavoritePostsSuccessCopyWith(
          FetchUserFavoritePostsSuccess value,
          $Res Function(FetchUserFavoritePostsSuccess) then) =
      _$FetchUserFavoritePostsSuccessCopyWithImpl<$Res>;
  $Res call({List<dynamic> posts});
}

class _$FetchUserFavoritePostsSuccessCopyWithImpl<$Res>
    extends _$FavoritePostsStateCopyWithImpl<$Res>
    implements $FetchUserFavoritePostsSuccessCopyWith<$Res> {
  _$FetchUserFavoritePostsSuccessCopyWithImpl(
      FetchUserFavoritePostsSuccess _value,
      $Res Function(FetchUserFavoritePostsSuccess) _then)
      : super(_value, (v) => _then(v as FetchUserFavoritePostsSuccess));

  @override
  FetchUserFavoritePostsSuccess get _value =>
      super._value as FetchUserFavoritePostsSuccess;

  @override
  $Res call({
    Object posts = freezed,
  }) {
    return _then(FetchUserFavoritePostsSuccess(
      posts == freezed ? _value.posts : posts as List<dynamic>,
    ));
  }
}

class _$FetchUserFavoritePostsSuccess implements FetchUserFavoritePostsSuccess {
  _$FetchUserFavoritePostsSuccess(this.posts) : assert(posts != null);

  @override
  final List<dynamic> posts;

  @override
  String toString() {
    return 'FavoritePostsState.fetchUserFavoritePostsSuccess(posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FetchUserFavoritePostsSuccess &&
            (identical(other.posts, posts) ||
                const DeepCollectionEquality().equals(other.posts, posts)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(posts);

  @override
  $FetchUserFavoritePostsSuccessCopyWith<FetchUserFavoritePostsSuccess>
      get copyWith => _$FetchUserFavoritePostsSuccessCopyWithImpl<
          FetchUserFavoritePostsSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result fetchUserFavoritePostsSuccess(List<dynamic> posts),
    @required Result fetchUserFavoritePostsFailed(),
    @required Result loadingFavoritesPosts(),
  }) {
    assert(initial != null);
    assert(fetchUserFavoritePostsSuccess != null);
    assert(fetchUserFavoritePostsFailed != null);
    assert(loadingFavoritesPosts != null);
    return fetchUserFavoritePostsSuccess(posts);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result fetchUserFavoritePostsSuccess(List<dynamic> posts),
    Result fetchUserFavoritePostsFailed(),
    Result loadingFavoritesPosts(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchUserFavoritePostsSuccess != null) {
      return fetchUserFavoritePostsSuccess(posts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialFavoritePostsState value),
    @required
        Result fetchUserFavoritePostsSuccess(
            FetchUserFavoritePostsSuccess value),
    @required
        Result fetchUserFavoritePostsFailed(FetchUserFavoritePostsFailed value),
    @required Result loadingFavoritesPosts(LoadingFavoritesPosts value),
  }) {
    assert(initial != null);
    assert(fetchUserFavoritePostsSuccess != null);
    assert(fetchUserFavoritePostsFailed != null);
    assert(loadingFavoritesPosts != null);
    return fetchUserFavoritePostsSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialFavoritePostsState value),
    Result fetchUserFavoritePostsSuccess(FetchUserFavoritePostsSuccess value),
    Result fetchUserFavoritePostsFailed(FetchUserFavoritePostsFailed value),
    Result loadingFavoritesPosts(LoadingFavoritesPosts value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchUserFavoritePostsSuccess != null) {
      return fetchUserFavoritePostsSuccess(this);
    }
    return orElse();
  }
}

abstract class FetchUserFavoritePostsSuccess implements FavoritePostsState {
  factory FetchUserFavoritePostsSuccess(List<dynamic> posts) =
      _$FetchUserFavoritePostsSuccess;

  List<dynamic> get posts;
  $FetchUserFavoritePostsSuccessCopyWith<FetchUserFavoritePostsSuccess>
      get copyWith;
}

abstract class $FetchUserFavoritePostsFailedCopyWith<$Res> {
  factory $FetchUserFavoritePostsFailedCopyWith(
          FetchUserFavoritePostsFailed value,
          $Res Function(FetchUserFavoritePostsFailed) then) =
      _$FetchUserFavoritePostsFailedCopyWithImpl<$Res>;
}

class _$FetchUserFavoritePostsFailedCopyWithImpl<$Res>
    extends _$FavoritePostsStateCopyWithImpl<$Res>
    implements $FetchUserFavoritePostsFailedCopyWith<$Res> {
  _$FetchUserFavoritePostsFailedCopyWithImpl(
      FetchUserFavoritePostsFailed _value,
      $Res Function(FetchUserFavoritePostsFailed) _then)
      : super(_value, (v) => _then(v as FetchUserFavoritePostsFailed));

  @override
  FetchUserFavoritePostsFailed get _value =>
      super._value as FetchUserFavoritePostsFailed;
}

class _$FetchUserFavoritePostsFailed implements FetchUserFavoritePostsFailed {
  _$FetchUserFavoritePostsFailed();

  @override
  String toString() {
    return 'FavoritePostsState.fetchUserFavoritePostsFailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FetchUserFavoritePostsFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result fetchUserFavoritePostsSuccess(List<dynamic> posts),
    @required Result fetchUserFavoritePostsFailed(),
    @required Result loadingFavoritesPosts(),
  }) {
    assert(initial != null);
    assert(fetchUserFavoritePostsSuccess != null);
    assert(fetchUserFavoritePostsFailed != null);
    assert(loadingFavoritesPosts != null);
    return fetchUserFavoritePostsFailed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result fetchUserFavoritePostsSuccess(List<dynamic> posts),
    Result fetchUserFavoritePostsFailed(),
    Result loadingFavoritesPosts(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchUserFavoritePostsFailed != null) {
      return fetchUserFavoritePostsFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialFavoritePostsState value),
    @required
        Result fetchUserFavoritePostsSuccess(
            FetchUserFavoritePostsSuccess value),
    @required
        Result fetchUserFavoritePostsFailed(FetchUserFavoritePostsFailed value),
    @required Result loadingFavoritesPosts(LoadingFavoritesPosts value),
  }) {
    assert(initial != null);
    assert(fetchUserFavoritePostsSuccess != null);
    assert(fetchUserFavoritePostsFailed != null);
    assert(loadingFavoritesPosts != null);
    return fetchUserFavoritePostsFailed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialFavoritePostsState value),
    Result fetchUserFavoritePostsSuccess(FetchUserFavoritePostsSuccess value),
    Result fetchUserFavoritePostsFailed(FetchUserFavoritePostsFailed value),
    Result loadingFavoritesPosts(LoadingFavoritesPosts value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchUserFavoritePostsFailed != null) {
      return fetchUserFavoritePostsFailed(this);
    }
    return orElse();
  }
}

abstract class FetchUserFavoritePostsFailed implements FavoritePostsState {
  factory FetchUserFavoritePostsFailed() = _$FetchUserFavoritePostsFailed;
}

abstract class $LoadingFavoritesPostsCopyWith<$Res> {
  factory $LoadingFavoritesPostsCopyWith(LoadingFavoritesPosts value,
          $Res Function(LoadingFavoritesPosts) then) =
      _$LoadingFavoritesPostsCopyWithImpl<$Res>;
}

class _$LoadingFavoritesPostsCopyWithImpl<$Res>
    extends _$FavoritePostsStateCopyWithImpl<$Res>
    implements $LoadingFavoritesPostsCopyWith<$Res> {
  _$LoadingFavoritesPostsCopyWithImpl(
      LoadingFavoritesPosts _value, $Res Function(LoadingFavoritesPosts) _then)
      : super(_value, (v) => _then(v as LoadingFavoritesPosts));

  @override
  LoadingFavoritesPosts get _value => super._value as LoadingFavoritesPosts;
}

class _$LoadingFavoritesPosts implements LoadingFavoritesPosts {
  _$LoadingFavoritesPosts();

  @override
  String toString() {
    return 'FavoritePostsState.loadingFavoritesPosts()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadingFavoritesPosts);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result fetchUserFavoritePostsSuccess(List<dynamic> posts),
    @required Result fetchUserFavoritePostsFailed(),
    @required Result loadingFavoritesPosts(),
  }) {
    assert(initial != null);
    assert(fetchUserFavoritePostsSuccess != null);
    assert(fetchUserFavoritePostsFailed != null);
    assert(loadingFavoritesPosts != null);
    return loadingFavoritesPosts();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result fetchUserFavoritePostsSuccess(List<dynamic> posts),
    Result fetchUserFavoritePostsFailed(),
    Result loadingFavoritesPosts(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingFavoritesPosts != null) {
      return loadingFavoritesPosts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialFavoritePostsState value),
    @required
        Result fetchUserFavoritePostsSuccess(
            FetchUserFavoritePostsSuccess value),
    @required
        Result fetchUserFavoritePostsFailed(FetchUserFavoritePostsFailed value),
    @required Result loadingFavoritesPosts(LoadingFavoritesPosts value),
  }) {
    assert(initial != null);
    assert(fetchUserFavoritePostsSuccess != null);
    assert(fetchUserFavoritePostsFailed != null);
    assert(loadingFavoritesPosts != null);
    return loadingFavoritesPosts(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialFavoritePostsState value),
    Result fetchUserFavoritePostsSuccess(FetchUserFavoritePostsSuccess value),
    Result fetchUserFavoritePostsFailed(FetchUserFavoritePostsFailed value),
    Result loadingFavoritesPosts(LoadingFavoritesPosts value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingFavoritesPosts != null) {
      return loadingFavoritesPosts(this);
    }
    return orElse();
  }
}

abstract class LoadingFavoritesPosts implements FavoritePostsState {
  factory LoadingFavoritesPosts() = _$LoadingFavoritesPosts;
}
