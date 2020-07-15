import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../repository/abstract/sync_log_repository.dart';
import '../repository/concrete/repositories.dart';
import 'services.dart';

class PoliticoService {
  PoliticoService(
      {@required this.firebaseRepository,
      @required this.hiveRepository,
      @required this.syncLogRepository,
      @required this.sharedPreferencesService})
      : assert(firebaseRepository != null),
        assert(hiveRepository != null),
        assert(syncLogRepository != null),
        assert(sharedPreferencesService != null);

  final FirebasePoliticoRepository firebaseRepository;
  final HivePoliticoRepository hiveRepository;
  final SyncLogRepository syncLogRepository;
  final SharedPreferencesService sharedPreferencesService;

  Map<String, PoliticoModel> politicosMap;

  Future<List<PoliticoModel>> getAllPoliticos() async {
    final localHash = await sharedPreferencesService.getPoliticoHash();
    final remoteHash = await syncLogRepository.getPoliticoHash();
    if (localHash != remoteHash) {
      final politicosFromFirebase = await firebaseRepository.getAllPoliticos();
      await hiveRepository.storeAllPoliticos(politicosFromFirebase);
      await sharedPreferencesService.setPoliticoHash(remoteHash);
      return politicosFromFirebase;
    } else {
      return await hiveRepository.getAllPoliticos();
    }
  }

  Future<PoliticoModel> getPoliticoById(String politicoId) async {
    if (politicosMap == null) {
      politicosMap = {};
      final politicos = await getAllPoliticos();
      for (var politico in politicos) {
        politicosMap.putIfAbsent(politico.id, () => politico);
      }
    }
    return politicosMap[politicoId];
  }
}
