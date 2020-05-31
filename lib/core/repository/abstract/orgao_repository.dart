import '../../../core/domain/model/models.dart';

abstract class OrgaoRepository {
  Future<Map<String, OrgaoModel>> getAllOrgaosMap();
}
