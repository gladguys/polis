import '../../../core/domain/model/models.dart';

abstract class PartidoRepository {
  Future<List<PartidoModel>> getAllPartidos();
}
