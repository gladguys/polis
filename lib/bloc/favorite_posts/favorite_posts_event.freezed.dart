// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'favorite_posts_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$FavoritePostsEventTearOff {
  const _$FavoritePostsEventTearOff();

  FetchUserFavoritePosts fetchUserFavoritePosts({@required String userId}) {
    return FetchUserFavoritePosts(
      userId: userId,
    );
  }
}

// ignore: unused_element
const $FavoritePostsEvent = _$FavoritePostsEventTearOff();

mixin _$FavoritePostsEvent {
  String get userId;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result fetchUserFavoritePosts(String userId),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result fetchUserFavoritePosts(String userId),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result fetchUserFavoritePosts(FetchUserFavoritePosts value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result fetchUserFavoritePosts(FetchUserFavoritePosts value),
    @required Result orElse(),
  });

  $FavoritePostsEventCopyWith<FavoritePostsEvent> get copyWith;
}

abstract class $FavoritePostsEventCopyWith<$Res> {
  factory $FavoritePostsEventCopyWith(
          FavoritePostsEvent value, $Res Function(FavoritePostsEvent) then) =
      _$FavoritePostsEventCopyWithImpl<$Res>;
  $Res call({String userId});
}

class _$FavoritePostsEventCopyWithImpl<$Res>
    implements $FavoritePostsEventCopyWith<$Res> {
  _$FavoritePostsEventCopyWithImpl(this._value, this._then);

  final FavoritePostsEvent _value;
  // ignore: unused_field
  final $Res Function(FavoritePostsEvent) _then;

  @override
  $Res call({
    Object userId = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed ? _value.userId : userId as String,
    ));
  }
}

abstract class $FetchUserFavoritePostsCopyWith<$Res>
    implements $FavoritePostsEventCopyWith<$Res> {
  factory $FetchUserFavoritePostsCopyWith(FetchUserFavoritePosts value,
          $Res Function(FetchUserFavoritePosts) then) =
      _$FetchUserFavoritePostsCopyWithImpl<$Res>;
  @override
  $Res call({String userId});
}

class _$FetchUserFavoritePostsCopyWithImpl<$Res>
    extends _$FavoritePostsEventCopyWithImpl<$Res>
    implements $FetchUserFavoritePostsCopyWith<$Res> {
  _$FetchUserFavoritePostsCopyWithImpl(FetchUserFavoritePosts _value,
      $Res Function(FetchUserFavoritePosts) _then)
      : super(_value, (v) => _then(v as FetchUserFavoritePosts));

  @override
  FetchUserFavoritePosts get _value => super._value as FetchUserFavoritePosts;

  @override
  $Res call({
    Object userId = freezed,
  }) {
    return _then(FetchUserFavoritePosts(
      userId: userId == freezed ? _value.userId : userId as String,
    ));
  }
}

class _$FetchUserFavoritePosts implements FetchUserFavoritePosts {
  _$FetchUserFavoritePosts({@required this.userId}) : assert(userId != null);

  @override
  final String userId;

  @override
  String toString() {
    return 'FavoritePostsEvent.fetchUserFavoritePosts(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FetchUserFavoritePosts &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(userId);

  @override
  $FetchUserFavoritePostsCopyWith<FetchUserFavoritePosts> get copyWith =>
      _$FetchUserFavoritePostsCopyWithImpl<FetchUserFavoritePosts>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result fetchUserFavoritePosts(String userId),
  }) {
    assert(fetchUserFavoritePosts != null);
    return fetchUserFavoritePosts(userId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result fetchUserFavoritePosts(String userId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchUserFavoritePosts != null) {
      return fetchUserFavoritePosts(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result fetchUserFavoritePosts(FetchUserFavoritePosts value),
  }) {
    assert(fetchUserFavoritePosts != null);
    return fetchUserFavoritePosts(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result fetchUserFavoritePosts(FetchUserFavoritePosts value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchUserFavoritePosts != null) {
      return fetchUserFavoritePosts(this);
    }
    return orElse();
  }
}

abstract class FetchUserFavoritePosts implements FavoritePostsEvent {
  factory FetchUserFavoritePosts({@required String userId}) =
      _$FetchUserFavoritePosts;

  @override
  String get userId;
  @override
  $FetchUserFavoritePostsCopyWith<FetchUserFavoritePosts> get copyWith;
}
