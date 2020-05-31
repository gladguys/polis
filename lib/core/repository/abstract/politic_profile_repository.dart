import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tuple/tuple.dart';

import '../../../core/domain/model/models.dart';

abstract class PoliticProfileRepository {
  Future<PoliticoModel> getInfoPolitic(String politicId);
  Future<Tuple2<List<dynamic>, DocumentSnapshot>> getLastActivities(
      {String politicId, int count});
  Future<Tuple2<List<dynamic>, DocumentSnapshot>> getMoreActivities(
      {String politicId, int count, DocumentSnapshot lastDocument});
}
