import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/exception/exceptions.dart';
import '../../abstract/user_repository.dart';

class FirebaseUserRepository implements UserRepository {
  FirebaseUserRepository({@required this.firebaseAuth})
      : assert(firebaseAuth != null);

  final FirebaseAuth firebaseAuth;

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } on Exception {
      throw SignOutException();
    }
  }
}
