import 'package:hive/hive.dart';

import '../../../model/partido_model.dart';
import '../../abstract/partido_repository.dart';
import 'box.dart';

class HivePartidoRepository implements PartidoRepository {
  @override
  Future<List<PartidoModel>> getAllPartidos() async {
    await Hive.openBox<PartidoModel>(PARTIDOS_BOX);
    final partidoBox = await Hive.box<PartidoModel>(PARTIDOS_BOX);
    return Future.value(partidoBox.values.toList());
  }

  Future<void> storeAllPartidos(List<PartidoModel> partidos) async {
    await Hive.openBox<PartidoModel>(PARTIDOS_BOX);
    final partidoBox = await Hive.box<PartidoModel>(PARTIDOS_BOX);
    for (var partido in partidos) {
      await partidoBox.add(partido);
    }
  }
}
