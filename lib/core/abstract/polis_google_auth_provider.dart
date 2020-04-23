import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PolisGoogleAuthProvider {
  AuthCredential getCredential(
      {@required String accessToken, @required String idToken}) {
    assert(accessToken != null);
    assert(idToken != null);

    return GoogleAuthProvider.getCredential(
      accessToken: accessToken,
      idToken: idToken,
    );
  }
}
