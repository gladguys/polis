import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../repository/abstract/sync_log_repository.dart';
import '../repository/concrete/firebase/firebase_orgao_repository.dart';
import '../repository/concrete/hive/hive_orgao_repository.dart';
import 'services.dart';

class OrgaoService {
  OrgaoService({
    @required this.firebaseRepository,
    @required this.hiveRepository,
    @required this.syncLogRepository,
    @required this.sharedPreferencesService,
  })  : assert(firebaseRepository != null),
        assert(hiveRepository != null),
        assert(syncLogRepository != null),
        assert(sharedPreferencesService != null);

  final FirebaseOrgaoRepository firebaseRepository;
  final HiveOrgaoRepository hiveRepository;
  final SyncLogRepository syncLogRepository;
  final SharedPreferencesService sharedPreferencesService;

  Future<Map<String, OrgaoModel>> getAllOrgaosMap() async {
    final localHash = await sharedPreferencesService.getOrgaoHash();
    final remoteHash = await syncLogRepository.getOrgaoHash();
    if (localHash != remoteHash) {
      final orgaosFromFirebase = await firebaseRepository.getAllOrgaos();
      await hiveRepository.storeAllOrgaos(orgaosFromFirebase);
      await sharedPreferencesService.setOrgaoHash(remoteHash);
      return await firebaseRepository.getAllOrgaosMap();
    } else {
      return await hiveRepository.getAllOrgaosMap();
    }
  }
}
