import 'package:flutter/material.dart';

import '../../model/models.dart';
import '../../repository/abstract/sync_log_repository.dart';
import '../../repository/concrete/repositories.dart';
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
}
