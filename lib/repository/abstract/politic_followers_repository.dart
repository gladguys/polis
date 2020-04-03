import '../../model/models.dart';

abstract class PoliticFollowersRepository {
  Future<List<UsuarioSeguindoPolitico>> getUsersFollowingPolitic(
      String politicId);
}
