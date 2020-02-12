import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/exception/exceptions.dart';
import '../../../message/message.dart';
import '../../../model/user_model.dart';
import '../../abstract/signin_repository.dart';

class FirebaseSigninRepository extends SigninRepository {
  FirebaseSigninRepository({this.firebaseAuth, this.googleSignIn});

  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final CollectionReference userRef = Firestore.instance.collection('users');

  @override
  Future<UserModel> signInWithEmailAndPassword(
      String email, String password) async {
    final authResult = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    if (authResult != null) {
      return UserModel();
    }
    return null;
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      final googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final userRetrieved = getUserById(googleSignInAccount.id);
        if (userRetrieved != null) {
          return userRetrieved;
        } else {
          final userCreated = await createUserFromGoogle(googleSignInAccount);
          return userCreated;
        }
      } else {
        throw Exception(ERROR_GOOGLE_SIGNIN);
      }
    } on CreateUserFromGoogleException {
      throw Exception(ERROR_CREATE_USER_GOOGLE);
    } on ComunicationException {
      throw Exception(ERROR_COMUNICATION);
    }
  }

  @override
  Future<UserModel> getUserById(String userId) async {
    try {
      final userDocument = await userRef.document(userId).get();
      return userDocument.exists ? UserModel.fromJson(userDocument.data) : null;
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<UserModel> createUserFromGoogle(
      GoogleSignInAccount googleSignInAccount) async {
    try {
      final user = UserModel.userFromGoogle(googleSignInAccount);
      await userRef.document(user.userId).setData(user.toJson());
      return user;
    } on Exception {
      throw CreateUserFromGoogleException();
    }
  }
}
