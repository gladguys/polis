import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../../core/domain/model/models.dart';
import '../../abstract/partido_repository.dart';
import 'box.dart';

class HivePartidoRepository implements PartidoRepository {
  HivePartidoRepository({@required this.hive}) : assert(hive != null);

  HiveInterface hive;

  @override
  Future<List<PartidoModel>> getAllPartidos() async {
    try {
      await hive.openBox<PartidoModel>(PARTIDOS_BOX);
      final partidoBox = await hive.box<PartidoModel>(PARTIDOS_BOX);
      return Future.value(partidoBox.values.toList());
    } on Exception {
      rethrow;
    }
  }

  Future<void> storeAllPartidos(List<PartidoModel> partidos) async {
    try {
      await hive.openBox<PartidoModel>(PARTIDOS_BOX);
      final partidoBox = await hive.box<PartidoModel>(PARTIDOS_BOX);
      await partidoBox.clear();
      for (var partido in partidos) {
        await partidoBox.add(partido);
      }
    } on Exception {
      rethrow;
    }
  }
}
