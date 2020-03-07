import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../bloc/blocs.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import '../../repository/concrete/firebase/firebase_signin_repository.dart';
import '../page_connected.dart';
import '../pages.dart';

const SCOPE_TYPE = 'email';
const SCOPE_URL = 'https://www.googleapis.com/auth/contacts.readonly';

class SigninPageConnected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageConnected<SigninBloc>(
      bloc: SigninBloc(
        repository: FirebaseSigninRepository(
          firebaseAuth: FirebaseAuth.instance,
          firestore: Firestore.instance,
          googleSignin: GoogleSignIn(
            scopes: [
              SCOPE_TYPE,
              SCOPE_URL,
            ],
          ),
        ),
        analyticsService: G<AnalyticsService>(),
      ),
      page: SigninPage(),
    );
  }
}
