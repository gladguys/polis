import '../../../core/domain/model/models.dart';
import '../../domain/enum/post_type.dart';

abstract class UserProfileRepository {
  Future<UserModel> getUserInfo(String userId);
  Future<List<PoliticoModel>> getPoliticsFollowing(String userId);
  Future<List<AcaoUsuarioModel>> getUserActions(String userId);
  Future<dynamic> getPostInfo(
      {String postId, String politicoId, PostType postType});
}
