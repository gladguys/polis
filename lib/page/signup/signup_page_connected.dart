import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../bloc/blocs.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import '../../repository/concrete/firebase/firebase_signup_repository.dart';
import '../page_connected.dart';
import '../pages.dart';

class SignupPageConnected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageConnected<SignupBloc>(
      bloc: SignupBloc(
        repository: FirebaseSignupRepository(
          firebaseAuth: FirebaseAuth.instance,
          firestore: Firestore.instance,
          storage: FirebaseStorage.instance,
        ),
        analyticsService: G<AnalyticsService>(),
      ),
      page: SignupPage(),
    );
  }
}
