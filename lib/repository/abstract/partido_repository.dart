import '../../model/partido_model.dart';

abstract class PartidoRepository {
  Future<List<PartidoModel>> getAllPartidos();
}
