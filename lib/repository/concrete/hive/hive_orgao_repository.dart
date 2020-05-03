import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../model/models.dart';
import '../../abstract/orgao_repository.dart';
import 'box.dart';

class HiveOrgaoRepository implements OrgaoRepository {
  HiveOrgaoRepository({@required this.hive}) : assert(hive != null);

  HiveInterface hive;

  @override
  Future<Map<String, OrgaoModel>> getAllOrgaosMap() async {
    try {
      await hive.openBox<OrgaoModel>(ORGAOS_BOX);
      final orgaoBox = await hive.box<OrgaoModel>(ORGAOS_BOX);
      final orgaos = orgaoBox.values.toList();
      final mapOrgaos = <String, OrgaoModel>{};
      for (var orgao in orgaos) {
        mapOrgaos.putIfAbsent(orgao.sigla, () => orgao);
      }
      return Future.value(mapOrgaos);
    } on Exception {
      rethrow;
    }
  }

  Future<void> storeAllOrgaos(List<OrgaoModel> orgaos) async {
    try {
      await hive.openBox<OrgaoModel>(ORGAOS_BOX);
      final orgaoBox = await hive.box<OrgaoModel>(ORGAOS_BOX);
      await orgaoBox.clear();
      for (var orgao in orgaos) {
        await orgaoBox.add(orgao);
      }
    } on Exception {
      rethrow;
    }
  }
}
