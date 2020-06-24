// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'post_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PostEventTearOff {
  const _$PostEventTearOff();

  LikePost likePost(String id) {
    return LikePost(
      id,
    );
  }

  FavoritePostForUser favoritePostForUser(
      {Map<String, dynamic> post, UserModel user}) {
    return FavoritePostForUser(
      post: post,
      user: user,
    );
  }

  SharePost sharePost({File postImage}) {
    return SharePost(
      postImage: postImage,
    );
  }

  SetPostViewed setPostViewed({String userId, String postId}) {
    return SetPostViewed(
      userId: userId,
      postId: postId,
    );
  }

  SetPostFavorited setPostFavorited({String userId, String postId}) {
    return SetPostFavorited(
      userId: userId,
      postId: postId,
    );
  }
}

// ignore: unused_element
const $PostEvent = _$PostEventTearOff();

mixin _$PostEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result likePost(String id),
    @required
        Result favoritePostForUser(Map<String, dynamic> post, UserModel user),
    @required Result sharePost(File postImage),
    @required Result setPostViewed(String userId, String postId),
    @required Result setPostFavorited(String userId, String postId),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result likePost(String id),
    Result favoritePostForUser(Map<String, dynamic> post, UserModel user),
    Result sharePost(File postImage),
    Result setPostViewed(String userId, String postId),
    Result setPostFavorited(String userId, String postId),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result likePost(LikePost value),
    @required Result favoritePostForUser(FavoritePostForUser value),
    @required Result sharePost(SharePost value),
    @required Result setPostViewed(SetPostViewed value),
    @required Result setPostFavorited(SetPostFavorited value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result likePost(LikePost value),
    Result favoritePostForUser(FavoritePostForUser value),
    Result sharePost(SharePost value),
    Result setPostViewed(SetPostViewed value),
    Result setPostFavorited(SetPostFavorited value),
    @required Result orElse(),
  });
}

abstract class $PostEventCopyWith<$Res> {
  factory $PostEventCopyWith(PostEvent value, $Res Function(PostEvent) then) =
      _$PostEventCopyWithImpl<$Res>;
}

class _$PostEventCopyWithImpl<$Res> implements $PostEventCopyWith<$Res> {
  _$PostEventCopyWithImpl(this._value, this._then);

  final PostEvent _value;
  // ignore: unused_field
  final $Res Function(PostEvent) _then;
}

abstract class $LikePostCopyWith<$Res> {
  factory $LikePostCopyWith(LikePost value, $Res Function(LikePost) then) =
      _$LikePostCopyWithImpl<$Res>;
  $Res call({String id});
}

class _$LikePostCopyWithImpl<$Res> extends _$PostEventCopyWithImpl<$Res>
    implements $LikePostCopyWith<$Res> {
  _$LikePostCopyWithImpl(LikePost _value, $Res Function(LikePost) _then)
      : super(_value, (v) => _then(v as LikePost));

  @override
  LikePost get _value => super._value as LikePost;

  @override
  $Res call({
    Object id = freezed,
  }) {
    return _then(LikePost(
      id == freezed ? _value.id : id as String,
    ));
  }
}

class _$LikePost implements LikePost {
  _$LikePost(this.id) : assert(id != null);

  @override
  final String id;

  @override
  String toString() {
    return 'PostEvent.likePost(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LikePost &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @override
  $LikePostCopyWith<LikePost> get copyWith =>
      _$LikePostCopyWithImpl<LikePost>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result likePost(String id),
    @required
        Result favoritePostForUser(Map<String, dynamic> post, UserModel user),
    @required Result sharePost(File postImage),
    @required Result setPostViewed(String userId, String postId),
    @required Result setPostFavorited(String userId, String postId),
  }) {
    assert(likePost != null);
    assert(favoritePostForUser != null);
    assert(sharePost != null);
    assert(setPostViewed != null);
    assert(setPostFavorited != null);
    return likePost(id);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result likePost(String id),
    Result favoritePostForUser(Map<String, dynamic> post, UserModel user),
    Result sharePost(File postImage),
    Result setPostViewed(String userId, String postId),
    Result setPostFavorited(String userId, String postId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (likePost != null) {
      return likePost(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result likePost(LikePost value),
    @required Result favoritePostForUser(FavoritePostForUser value),
    @required Result sharePost(SharePost value),
    @required Result setPostViewed(SetPostViewed value),
    @required Result setPostFavorited(SetPostFavorited value),
  }) {
    assert(likePost != null);
    assert(favoritePostForUser != null);
    assert(sharePost != null);
    assert(setPostViewed != null);
    assert(setPostFavorited != null);
    return likePost(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result likePost(LikePost value),
    Result favoritePostForUser(FavoritePostForUser value),
    Result sharePost(SharePost value),
    Result setPostViewed(SetPostViewed value),
    Result setPostFavorited(SetPostFavorited value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (likePost != null) {
      return likePost(this);
    }
    return orElse();
  }
}

abstract class LikePost implements PostEvent {
  factory LikePost(String id) = _$LikePost;

  String get id;
  $LikePostCopyWith<LikePost> get copyWith;
}

abstract class $FavoritePostForUserCopyWith<$Res> {
  factory $FavoritePostForUserCopyWith(
          FavoritePostForUser value, $Res Function(FavoritePostForUser) then) =
      _$FavoritePostForUserCopyWithImpl<$Res>;
  $Res call({Map<String, dynamic> post, UserModel user});
}

class _$FavoritePostForUserCopyWithImpl<$Res>
    extends _$PostEventCopyWithImpl<$Res>
    implements $FavoritePostForUserCopyWith<$Res> {
  _$FavoritePostForUserCopyWithImpl(
      FavoritePostForUser _value, $Res Function(FavoritePostForUser) _then)
      : super(_value, (v) => _then(v as FavoritePostForUser));

  @override
  FavoritePostForUser get _value => super._value as FavoritePostForUser;

  @override
  $Res call({
    Object post = freezed,
    Object user = freezed,
  }) {
    return _then(FavoritePostForUser(
      post: post == freezed ? _value.post : post as Map<String, dynamic>,
      user: user == freezed ? _value.user : user as UserModel,
    ));
  }
}

class _$FavoritePostForUser implements FavoritePostForUser {
  _$FavoritePostForUser({this.post, this.user});

  @override
  final Map<String, dynamic> post;
  @override
  final UserModel user;

  @override
  String toString() {
    return 'PostEvent.favoritePostForUser(post: $post, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FavoritePostForUser &&
            (identical(other.post, post) ||
                const DeepCollectionEquality().equals(other.post, post)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(post) ^
      const DeepCollectionEquality().hash(user);

  @override
  $FavoritePostForUserCopyWith<FavoritePostForUser> get copyWith =>
      _$FavoritePostForUserCopyWithImpl<FavoritePostForUser>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result likePost(String id),
    @required
        Result favoritePostForUser(Map<String, dynamic> post, UserModel user),
    @required Result sharePost(File postImage),
    @required Result setPostViewed(String userId, String postId),
    @required Result setPostFavorited(String userId, String postId),
  }) {
    assert(likePost != null);
    assert(favoritePostForUser != null);
    assert(sharePost != null);
    assert(setPostViewed != null);
    assert(setPostFavorited != null);
    return favoritePostForUser(post, user);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result likePost(String id),
    Result favoritePostForUser(Map<String, dynamic> post, UserModel user),
    Result sharePost(File postImage),
    Result setPostViewed(String userId, String postId),
    Result setPostFavorited(String userId, String postId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (favoritePostForUser != null) {
      return favoritePostForUser(post, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result likePost(LikePost value),
    @required Result favoritePostForUser(FavoritePostForUser value),
    @required Result sharePost(SharePost value),
    @required Result setPostViewed(SetPostViewed value),
    @required Result setPostFavorited(SetPostFavorited value),
  }) {
    assert(likePost != null);
    assert(favoritePostForUser != null);
    assert(sharePost != null);
    assert(setPostViewed != null);
    assert(setPostFavorited != null);
    return favoritePostForUser(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result likePost(LikePost value),
    Result favoritePostForUser(FavoritePostForUser value),
    Result sharePost(SharePost value),
    Result setPostViewed(SetPostViewed value),
    Result setPostFavorited(SetPostFavorited value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (favoritePostForUser != null) {
      return favoritePostForUser(this);
    }
    return orElse();
  }
}

abstract class FavoritePostForUser implements PostEvent {
  factory FavoritePostForUser({Map<String, dynamic> post, UserModel user}) =
      _$FavoritePostForUser;

  Map<String, dynamic> get post;
  UserModel get user;
  $FavoritePostForUserCopyWith<FavoritePostForUser> get copyWith;
}

abstract class $SharePostCopyWith<$Res> {
  factory $SharePostCopyWith(SharePost value, $Res Function(SharePost) then) =
      _$SharePostCopyWithImpl<$Res>;
  $Res call({File postImage});
}

class _$SharePostCopyWithImpl<$Res> extends _$PostEventCopyWithImpl<$Res>
    implements $SharePostCopyWith<$Res> {
  _$SharePostCopyWithImpl(SharePost _value, $Res Function(SharePost) _then)
      : super(_value, (v) => _then(v as SharePost));

  @override
  SharePost get _value => super._value as SharePost;

  @override
  $Res call({
    Object postImage = freezed,
  }) {
    return _then(SharePost(
      postImage: postImage == freezed ? _value.postImage : postImage as File,
    ));
  }
}

class _$SharePost implements SharePost {
  _$SharePost({this.postImage});

  @override
  final File postImage;

  @override
  String toString() {
    return 'PostEvent.sharePost(postImage: $postImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SharePost &&
            (identical(other.postImage, postImage) ||
                const DeepCollectionEquality()
                    .equals(other.postImage, postImage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(postImage);

  @override
  $SharePostCopyWith<SharePost> get copyWith =>
      _$SharePostCopyWithImpl<SharePost>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result likePost(String id),
    @required
        Result favoritePostForUser(Map<String, dynamic> post, UserModel user),
    @required Result sharePost(File postImage),
    @required Result setPostViewed(String userId, String postId),
    @required Result setPostFavorited(String userId, String postId),
  }) {
    assert(likePost != null);
    assert(favoritePostForUser != null);
    assert(sharePost != null);
    assert(setPostViewed != null);
    assert(setPostFavorited != null);
    return sharePost(postImage);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result likePost(String id),
    Result favoritePostForUser(Map<String, dynamic> post, UserModel user),
    Result sharePost(File postImage),
    Result setPostViewed(String userId, String postId),
    Result setPostFavorited(String userId, String postId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sharePost != null) {
      return sharePost(postImage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result likePost(LikePost value),
    @required Result favoritePostForUser(FavoritePostForUser value),
    @required Result sharePost(SharePost value),
    @required Result setPostViewed(SetPostViewed value),
    @required Result setPostFavorited(SetPostFavorited value),
  }) {
    assert(likePost != null);
    assert(favoritePostForUser != null);
    assert(sharePost != null);
    assert(setPostViewed != null);
    assert(setPostFavorited != null);
    return sharePost(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result likePost(LikePost value),
    Result favoritePostForUser(FavoritePostForUser value),
    Result sharePost(SharePost value),
    Result setPostViewed(SetPostViewed value),
    Result setPostFavorited(SetPostFavorited value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sharePost != null) {
      return sharePost(this);
    }
    return orElse();
  }
}

abstract class SharePost implements PostEvent {
  factory SharePost({File postImage}) = _$SharePost;

  File get postImage;
  $SharePostCopyWith<SharePost> get copyWith;
}

abstract class $SetPostViewedCopyWith<$Res> {
  factory $SetPostViewedCopyWith(
          SetPostViewed value, $Res Function(SetPostViewed) then) =
      _$SetPostViewedCopyWithImpl<$Res>;
  $Res call({String userId, String postId});
}

class _$SetPostViewedCopyWithImpl<$Res> extends _$PostEventCopyWithImpl<$Res>
    implements $SetPostViewedCopyWith<$Res> {
  _$SetPostViewedCopyWithImpl(
      SetPostViewed _value, $Res Function(SetPostViewed) _then)
      : super(_value, (v) => _then(v as SetPostViewed));

  @override
  SetPostViewed get _value => super._value as SetPostViewed;

  @override
  $Res call({
    Object userId = freezed,
    Object postId = freezed,
  }) {
    return _then(SetPostViewed(
      userId: userId == freezed ? _value.userId : userId as String,
      postId: postId == freezed ? _value.postId : postId as String,
    ));
  }
}

class _$SetPostViewed implements SetPostViewed {
  _$SetPostViewed({this.userId, this.postId});

  @override
  final String userId;
  @override
  final String postId;

  @override
  String toString() {
    return 'PostEvent.setPostViewed(userId: $userId, postId: $postId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SetPostViewed &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.postId, postId) ||
                const DeepCollectionEquality().equals(other.postId, postId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(postId);

  @override
  $SetPostViewedCopyWith<SetPostViewed> get copyWith =>
      _$SetPostViewedCopyWithImpl<SetPostViewed>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result likePost(String id),
    @required
        Result favoritePostForUser(Map<String, dynamic> post, UserModel user),
    @required Result sharePost(File postImage),
    @required Result setPostViewed(String userId, String postId),
    @required Result setPostFavorited(String userId, String postId),
  }) {
    assert(likePost != null);
    assert(favoritePostForUser != null);
    assert(sharePost != null);
    assert(setPostViewed != null);
    assert(setPostFavorited != null);
    return setPostViewed(userId, postId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result likePost(String id),
    Result favoritePostForUser(Map<String, dynamic> post, UserModel user),
    Result sharePost(File postImage),
    Result setPostViewed(String userId, String postId),
    Result setPostFavorited(String userId, String postId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (setPostViewed != null) {
      return setPostViewed(userId, postId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result likePost(LikePost value),
    @required Result favoritePostForUser(FavoritePostForUser value),
    @required Result sharePost(SharePost value),
    @required Result setPostViewed(SetPostViewed value),
    @required Result setPostFavorited(SetPostFavorited value),
  }) {
    assert(likePost != null);
    assert(favoritePostForUser != null);
    assert(sharePost != null);
    assert(setPostViewed != null);
    assert(setPostFavorited != null);
    return setPostViewed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result likePost(LikePost value),
    Result favoritePostForUser(FavoritePostForUser value),
    Result sharePost(SharePost value),
    Result setPostViewed(SetPostViewed value),
    Result setPostFavorited(SetPostFavorited value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (setPostViewed != null) {
      return setPostViewed(this);
    }
    return orElse();
  }
}

abstract class SetPostViewed implements PostEvent {
  factory SetPostViewed({String userId, String postId}) = _$SetPostViewed;

  String get userId;
  String get postId;
  $SetPostViewedCopyWith<SetPostViewed> get copyWith;
}

abstract class $SetPostFavoritedCopyWith<$Res> {
  factory $SetPostFavoritedCopyWith(
          SetPostFavorited value, $Res Function(SetPostFavorited) then) =
      _$SetPostFavoritedCopyWithImpl<$Res>;
  $Res call({String userId, String postId});
}

class _$SetPostFavoritedCopyWithImpl<$Res> extends _$PostEventCopyWithImpl<$Res>
    implements $SetPostFavoritedCopyWith<$Res> {
  _$SetPostFavoritedCopyWithImpl(
      SetPostFavorited _value, $Res Function(SetPostFavorited) _then)
      : super(_value, (v) => _then(v as SetPostFavorited));

  @override
  SetPostFavorited get _value => super._value as SetPostFavorited;

  @override
  $Res call({
    Object userId = freezed,
    Object postId = freezed,
  }) {
    return _then(SetPostFavorited(
      userId: userId == freezed ? _value.userId : userId as String,
      postId: postId == freezed ? _value.postId : postId as String,
    ));
  }
}

class _$SetPostFavorited implements SetPostFavorited {
  _$SetPostFavorited({this.userId, this.postId});

  @override
  final String userId;
  @override
  final String postId;

  @override
  String toString() {
    return 'PostEvent.setPostFavorited(userId: $userId, postId: $postId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SetPostFavorited &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.postId, postId) ||
                const DeepCollectionEquality().equals(other.postId, postId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(postId);

  @override
  $SetPostFavoritedCopyWith<SetPostFavorited> get copyWith =>
      _$SetPostFavoritedCopyWithImpl<SetPostFavorited>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result likePost(String id),
    @required
        Result favoritePostForUser(Map<String, dynamic> post, UserModel user),
    @required Result sharePost(File postImage),
    @required Result setPostViewed(String userId, String postId),
    @required Result setPostFavorited(String userId, String postId),
  }) {
    assert(likePost != null);
    assert(favoritePostForUser != null);
    assert(sharePost != null);
    assert(setPostViewed != null);
    assert(setPostFavorited != null);
    return setPostFavorited(userId, postId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result likePost(String id),
    Result favoritePostForUser(Map<String, dynamic> post, UserModel user),
    Result sharePost(File postImage),
    Result setPostViewed(String userId, String postId),
    Result setPostFavorited(String userId, String postId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (setPostFavorited != null) {
      return setPostFavorited(userId, postId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result likePost(LikePost value),
    @required Result favoritePostForUser(FavoritePostForUser value),
    @required Result sharePost(SharePost value),
    @required Result setPostViewed(SetPostViewed value),
    @required Result setPostFavorited(SetPostFavorited value),
  }) {
    assert(likePost != null);
    assert(favoritePostForUser != null);
    assert(sharePost != null);
    assert(setPostViewed != null);
    assert(setPostFavorited != null);
    return setPostFavorited(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result likePost(LikePost value),
    Result favoritePostForUser(FavoritePostForUser value),
    Result sharePost(SharePost value),
    Result setPostViewed(SetPostViewed value),
    Result setPostFavorited(SetPostFavorited value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (setPostFavorited != null) {
      return setPostFavorited(this);
    }
    return orElse();
  }
}

abstract class SetPostFavorited implements PostEvent {
  factory SetPostFavorited({String userId, String postId}) = _$SetPostFavorited;

  String get userId;
  String get postId;
  $SetPostFavoritedCopyWith<SetPostFavorited> get copyWith;
}
