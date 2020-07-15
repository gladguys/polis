import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';

import '../core/abstract/polis_google_auth_provider.dart';
import '../core/repository/concrete/repositories.dart';
import '../core/service/locator.dart';
import '../core/service/services.dart';

const SCOPE_TYPE = 'email';
const SCOPE_URL = 'https://www.googleapis.com/auth/userinfo.profile';

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
            polisGoogleAuthProvider: PolisGoogleAuthProvider(),
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
            googleSignIn: GoogleSignIn(),
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
          create: (_) => FirebasePoliticoRepository(
            firestore: Firestore.instance,
          ),
        ),
        RepositoryProvider(
          create: (_) => HivePoliticoRepository(
            hive: Hive,
          ),
        ),
        RepositoryProvider(
          create: (_) => FirebaseOrgaoRepository(
            firestore: Firestore.instance,
          ),
        ),
        RepositoryProvider(
          create: (_) => HiveOrgaoRepository(
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
        RepositoryProvider(
          create: (_) => FirebasePoliticFollowersRepository(
            firestore: Firestore.instance,
          ),
        ),
        RepositoryProvider(
          create: (_) => FirebasePostRepository(
            firestore: Firestore.instance,
          ),
        ),
        RepositoryProvider(
          create: (_) => FirebaseFavoritePostsRepository(
            firestore: Firestore.instance,
          ),
        ),
        RepositoryProvider(
          create: (_) => FirebaseSyncLogRepository(
            firestore: Firestore.instance,
          ),
        ),
        RepositoryProvider(
          create: (_) => FirebaseEditProfileRepository(
            firestore: Firestore.instance,
            firebaseAuth: FirebaseAuth.instance,
            firebaseStorage: FirebaseStorage.instance,
          ),
        ),
        RepositoryProvider(
          create: (_) => FirebaseChangePasswordRepository(
            firebaseAuth: FirebaseAuth.instance,
          ),
        ),
        RepositoryProvider(
          create: (_) => FirebaseTramitacaoPropostaRepository(
            firestore: Firestore.instance,
          ),
        ),
        RepositoryProvider(
          create: (_) => FirebasePoliticExpensesRepository(
            firestore: Firestore.instance,
          ),
        ),
        RepositoryProvider(
          create: (_) => FirebaseComparativoRankingDespesasRepository(
            firestore: Firestore.instance,
          ),
        ),
        RepositoryProvider(
          create: (_) => FirebasePoliticProposalsRepository(
            firestore: Firestore.instance,
          ),
        ),
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (_) => PoliticoService(
              firebaseRepository: _.repository<FirebasePoliticoRepository>(),
              hiveRepository: _.repository<HivePoliticoRepository>(),
              syncLogRepository: _.repository<FirebaseSyncLogRepository>(),
              sharedPreferencesService: G<SharedPreferencesService>(),
            ),
          ),
        ],
        child: MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (__) => FirebaseActionRepository(
                firestore: Firestore.instance,
                politicoService: __.repository<PoliticoService>(),
              ),
            ),
          ],
          child: child,
        ),
      ),
    );
  }
}
