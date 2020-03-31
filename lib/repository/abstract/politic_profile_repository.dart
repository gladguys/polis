import '../../model/models.dart';
import '../../model/usuario_seguindo_politico_model.dart';

abstract class PoliticProfileRepository {
  Future<PoliticoModel> getInfoPolitic(String politicId);
  Future<List<UsuarioSeguindoPolitico>> getUsersFollowingPolitic(
      String politicId);
}
