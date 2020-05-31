import '../../../core/domain/model/models.dart';

abstract class PostRepository {
  Future<void> favoritePost({Map<String, dynamic> post, UserModel user});
  Future<void> unfavoritePost({Map<String, dynamic> post, UserModel user});
  Future<void> setPostVisible({String userId, String postId});
  Future<bool> isPostFavorited({String userId, String postId});
}
