import '../../../core/domain/model/models.dart';

abstract class UserProfileRepository {
  Future<List<PoliticoModel>> getPoliticsFollowing(String userId);
  Future<List<AcaoUsuarioModel>> getUserActions(String userId);
}
