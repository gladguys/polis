import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tuple/tuple.dart';

abstract class TimelineRepository {
  Stream<List<dynamic>> getUserTimeline(String userId);
  Future<Tuple2<List<dynamic>, DocumentSnapshot>> getTimelineFirstPosts(
      String userId, int count);
  Future<Tuple2<List<dynamic>, DocumentSnapshot>> getMorePosts(
      String userId, int count, DocumentSnapshot lastDocument);
}
