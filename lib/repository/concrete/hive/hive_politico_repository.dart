import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../model/models.dart';
import '../../abstract/politico_repository.dart';
import 'box.dart';

class HivePoliticoRepository implements PoliticoRepository {
  HivePoliticoRepository({@required this.hive}) : assert(hive != null);

  HiveInterface hive;

  @override
  Future<List<PoliticoModel>> getAllPoliticos() async {
    try {
      await hive.openBox<PoliticoModel>(POLITICOS_BOX);
      final politicoBox = await hive.box<PoliticoModel>(POLITICOS_BOX);
      await politicoBox.clear();
      return Future.value(politicoBox.values.toList());
    } on Exception {
      rethrow;
    }
  }

  Future<void> storeAllPoliticos(List<PoliticoModel> politicos) async {
    try {
      await hive.openBox<PoliticoModel>(POLITICOS_BOX);
      final politicoBox = await hive.box<PoliticoModel>(POLITICOS_BOX);
      for (var politico in politicos) {
        await politicoBox.add(politico);
      }
    } on Exception {
      rethrow;
    }
  }
}
