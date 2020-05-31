import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../repository/abstract/sync_log_repository.dart';
import '../repository/concrete/repositories.dart';
import 'services.dart';

class PartidoService {
  PartidoService(
      {@required this.firebaseRepository,
      @required this.hiveRepository,
      @required this.syncLogRepository,
      @required this.sharedPreferencesService})
      : assert(firebaseRepository != null),
        assert(hiveRepository != null),
        assert(syncLogRepository != null),
        assert(sharedPreferencesService != null);

  final FirebasePartidoRepository firebaseRepository;
  final HivePartidoRepository hiveRepository;
  final SyncLogRepository syncLogRepository;
  final SharedPreferencesService sharedPreferencesService;

  Future<List<PartidoModel>> getAllPartidos() async {
    final localHash = await sharedPreferencesService.getPartidoHash();
    final remoteHash = await syncLogRepository.getPartidoHash();
    if (localHash != remoteHash) {
      final partidosFromFirebase = await firebaseRepository.getAllPartidos();
      await hiveRepository.storeAllPartidos(partidosFromFirebase);
      await sharedPreferencesService.setPartidoHash(remoteHash);
      return partidosFromFirebase;
    } else {
      return await hiveRepository.getAllPartidos();
    }
  }
}
