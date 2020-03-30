import 'package:flutter/material.dart';

import '../../model/partido_model.dart';
import '../../repository/concrete/firebase/firebase_partido_repository.dart';
import '../../repository/concrete/hive/hive_partido_repository.dart';

class PartidoService {
  PartidoService(
      {@required this.firebaseRepository, @required this.hiveRepository})
      : assert(firebaseRepository != null),
        assert(hiveRepository != null);

  final FirebasePartidoRepository firebaseRepository;
  final HivePartidoRepository hiveRepository;

  Future<List<PartidoModel>> getAllPartidos() async {
    final partidosFromHive = await hiveRepository.getAllPartidos();
    if (partidosFromHive.isEmpty) {
      final partidosFromFirebase = await firebaseRepository.getAllPartidos();
      await hiveRepository.storeAllPartidos(partidosFromFirebase);
      return partidosFromFirebase;
    }
    return partidosFromHive;
  }
}
