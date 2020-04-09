import '../../model/models.dart';

abstract class PoliticoRepository {
  Future<List<PoliticoModel>> getAllPoliticos();
}
