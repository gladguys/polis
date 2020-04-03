import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../enum/post_type.dart';
import '../../abstract/post_repository.dart';

class FirebasePostRepository implements PostRepository {
  FirebasePostRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;

  @override
  Future<dynamic> getPost({String id, PostType postType}) async {
    if (postType == PostType.DESPESA) {
    } else {}
  }
}
