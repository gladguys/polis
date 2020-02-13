import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../bloc/blocs.dart';
import '../../repository/concrete/firebase/firebase_signin_repository.dart';
import '../page_connected.dart';
import '../pages.dart';

class SigninPageConnected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageConnected<SigninBloc>(
      bloc: SigninBloc(
        repository: FirebaseSigninRepository(
            firebaseAuth: FirebaseAuth.instance, firestore: Firestore.instance),
      ),
      page: SigninPage(),
    );
  }
}
