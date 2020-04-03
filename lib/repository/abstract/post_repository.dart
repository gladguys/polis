import '../../enum/post_type.dart';

abstract class PostRepository {
  Future<dynamic> getPost({String id, PostType postType});
}
