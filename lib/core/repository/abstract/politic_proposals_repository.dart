import '../../../core/domain/model/models.dart';

abstract class PoliticProposalsRepository {
  Future<List<PropostaModel>> getPoliticProposals(String politicId);
}
