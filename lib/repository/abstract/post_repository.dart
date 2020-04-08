import '../../model/models.dart';

abstract class PostRepository {
  Future<void> favoritePost({Map<String, dynamic> post, UserModel user});
  Future<void> unfavoritePost({Map<String, dynamic> post, UserModel user});
}
