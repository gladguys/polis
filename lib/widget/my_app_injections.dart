import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';

import '../repository/concrete/repositories.dart';

const SCOPE_TYPE = 'email';
const SCOPE_URL = 'https://www.googleapis.com/auth/contacts.readonly';

class MyAppInjections extends StatelessWidget {
  MyAppInjections({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => FirebaseSigninRepository(
            firebaseAuth: FirebaseAuth.instance,
            firestore: Firestore.instance,
            googleSignin: GoogleSignIn(
              scopes: [
                SCOPE_TYPE,
                SCOPE_URL,
              ],
            ),
          ),
        ),
        RepositoryProvider(
          create: (_) => FirebaseSignupRepository(
            firebaseAuth: FirebaseAuth.instance,
            firestore: Firestore.instance,
            storage: FirebaseStorage.instance,
          ),
        ),
        RepositoryProvider(
          create: (_) => FirebaseUserFollowingPoliticsRepository(
            firestore: Firestore.instance,
          ),
        ),
        RepositoryProvider(
          create: (_) => FirebaseUserProfileRepository(
            firestore: Firestore.instance,
          ),
        ),
        RepositoryProvider(
          create: (_) => FirebaseUserRepository(
            firestore: Firestore.instance,
            firebaseAuth: FirebaseAuth.instance,
          ),
        ),
        RepositoryProvider(
          create: (_) => FirebaseFollowRepository(
            firestore: Firestore.instance,
          ),
        ),
        RepositoryProvider(
          create: (_) => FirebasePoliticSuggestionRepository(
            firestore: Firestore.instance,
          ),
        ),
        RepositoryProvider(
          create: (_) => FirebaseSearchPoliticRepository(
            firestore: Firestore.instance,
          ),
        ),
        RepositoryProvider(
          create: (_) => FirebasePartidoRepository(
            firestore: Firestore.instance,
          ),
        ),
        RepositoryProvider(
          create: (_) => HivePartidoRepository(
            hive: Hive,
          ),
        ),
        RepositoryProvider(
          create: (_) => FirebaseTimelineRepository(
            firestore: Firestore.instance,
          ),
        ),
        RepositoryProvider(
          create: (_) => FirebasePoliticProfileRepository(
            firestore: Firestore.instance,
          ),
        ),
      ],
      child: child,
    );
  }
}
