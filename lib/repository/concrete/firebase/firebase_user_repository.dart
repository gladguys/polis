import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/exception/exceptions.dart';
import '../../abstract/user_repository.dart';

class FirebaseUserRepository implements UserRepository {
  FirebaseUserRepository(this.firebaseAuth);

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
