import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../abstract/post_repository.dart';

class FirebasePostRepository implements PostRepository {
  FirebasePostRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;
}
