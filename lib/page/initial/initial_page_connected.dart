import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../bloc/blocs.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import '../../repository/concrete/firebase/repositories.dart';
import '../page_connected.dart';
import '../pages.dart';

class InitialPageConnected extends StatelessWidget {
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
        sharedPreferencesService: G<SharedPreferencesService>(),
      ),
      page: InitialPage(),
    );
  }
}
