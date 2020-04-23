import '../../model/models.dart';

abstract class TramitacaoPropostaRepository {
  Future<List<TramitacaoPropostaModel>> getTramitacoesProposta(
      String propostaId);
}
