import '../../../core/domain/model/models.dart';

abstract class PoliticoRepository {
  Future<List<PoliticoModel>> getAllPoliticos();
}
