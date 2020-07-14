import '../../../core/domain/model/models.dart';

abstract class UserProfileRepository {
  Future<UserModel> getUserInfo(String userId);
  Future<List<PoliticoModel>> getPoliticsFollowing(String userId);
  Future<List<AcaoUsuarioModel>> getUserActions(String userId);
}
