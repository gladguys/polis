import 'dart:async';
import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/abstract/polis_google_auth_provider.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/repository/abstract/repositories.dart';
import 'package:polis/core/repository/concrete/repositories.dart';
import 'package:polis/core/service/services.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_panel/sliding_panel.dart';

// Bloc
class MockSigninBloc extends MockBloc<SigninState> implements SigninBloc {}

class MockSubCommentsBloc extends MockBloc<SubCommentsState>
    implements SubCommentsBloc {}

class MockCommentBloc extends MockBloc<CommentState> implements CommentBloc {}

class MockPoliticExpensesAnalysisBloc
    extends MockBloc<PoliticExpensesAnalysisState>
    implements PoliticExpensesAnalysisBloc {}

class MockEditProfileBloc extends MockBloc<EditProfileState>
    implements EditProfileBloc {}

class MockComparativoRankingDespesasBloc
    extends MockBloc<ComparativoRankingDespesasState>
    implements ComparativoRankingDespesasBloc {}

class MockChangePasswordBloc extends MockBloc<ChangePasswordState>
    implements ChangePasswordBloc {}

class MockPostBloc extends MockBloc<PostState> implements PostBloc {}

class MockFavoritePostsBloc extends MockBloc<FavoritePostsState>
    implements FavoritePostsBloc {}

class MockPoliticExpensesBloc extends MockBloc<PoliticExpensesState>
    implements PoliticExpensesBloc {}

class MockUserFollowingPoliticsBloc extends MockBloc<UserFollowingPoliticsState>
    implements UserFollowingPoliticsBloc {}

class MockPoliticSuggestionBloc extends MockBloc<PoliticSuggestionState>
    implements PoliticSuggestionBloc {}

class MockSignupBloc extends MockBloc<SignupState> implements SignupBloc {}

class MockUserBloc extends MockBloc<UserState> implements UserBloc {}

class MockTramitacaoPropostaBloc extends MockBloc<TramitacaoPropostaState>
    implements TramitacaoPropostaBloc {}

class MockTimelineBloc extends MockBloc<TimelineState> implements TimelineBloc {
}

class MockPoliticProposalsBloc extends MockBloc<PoliticProposalsState>
    implements PoliticProposalsBloc {}

class MockUserProfileBloc extends MockBloc<UserProfileState>
    implements UserProfileBloc {}

class MockDocumentBloc extends MockBloc<DocumentState> implements DocumentBloc {
}

class MockPoliticProfileBloc extends MockBloc<PoliticProfileState>
    implements PoliticProfileBloc {}

class MockPoliticFollowersBloc extends MockBloc<PoliticFollowersState>
    implements PoliticFollowersBloc {}

class MockSearchPoliticBloc extends MockBloc<SearchPoliticState>
    implements SearchPoliticBloc {}

// Repository
class MockSigninRepository extends Mock implements SigninRepository {}

class MockActionRepository extends Mock implements ActionRepository {}

class MockEditProfileRepository extends Mock implements EditProfileRepository {}

class MockTramitacaoPropostaRepository extends Mock
    implements TramitacaoPropostaRepository {}

class MockCommentRepository extends Mock implements CommentRepository {}

class MockChangePasswordRepository extends Mock
    implements ChangePasswordRepository {}

class MockPoliticSugestionRepository extends Mock
    implements PoliticSuggestionRepository {}

class MockComparativoRankingDespesasRepository extends Mock
    implements ComparativoRankingDespesasRepository {}

class MockPoliticProfileRepository extends Mock
    implements PoliticProfileRepository {}

class MockPoliticProposalsRepository extends Mock
    implements PoliticProposalsRepository {}

class MockPoliticFollowersRepository extends Mock
    implements PoliticFollowersRepository {}

class MockPoliticExpensesRepository extends Mock
    implements PoliticExpensesRepository {}

class MockPoliticExpensesAnalysisRepository extends Mock
    implements PoliticExpensesAnalysisRepository {}

class MockPoliticExpensesByTypeAnalysisRepository extends Mock
    implements PoliticExpensesByTypeAnalysisRepository {}

class MockPoliticExpensesAnalysisQuotaRepository extends Mock
    implements PoliticExpensesAnalysisQuotaRepository {}

class MockPoliticExpensesAnalysisConfigRepository extends Mock
    implements PoliticExpensesAnalysisConfigRepository {}

class MockUserProfileRepository extends Mock implements UserProfileRepository {}

class MockSignupRepository extends Mock implements SignupRepository {}

class MockTimelineRepository extends Mock implements TimelineRepository {}

class MockUserRepository extends Mock implements UserRepository {}

class MockUserFollowingPoliticsRepository extends Mock
    implements UserFollowingPoliticsRepository {}

class MockPostRepository extends Mock implements PostRepository {}

class MockFavoritePostsRepository extends Mock
    implements FavoritePostsRepository {}

class MockFollowRepository extends Mock implements FollowRepository {}

class MockFirebasePartidoRepository extends Mock
    implements FirebasePartidoRepository {}

class MockFirebaseOrgaoRepository extends Mock
    implements FirebaseOrgaoRepository {}

class MockHiveOrgaoRepository extends Mock implements HiveOrgaoRepository {}

class MockHivePartidoRepository extends Mock implements HivePartidoRepository {}

class MockFirebasePoliticoRepository extends Mock
    implements FirebasePoliticoRepository {}

class MockHivePoliticoRepository extends Mock
    implements HivePoliticoRepository {}

class MockHttpCommentRepository extends Mock implements HttpCommentRepository {}

class MockSyncLogRepository extends Mock implements SyncLogRepository {}

// Firebase
class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirestore extends Mock implements Firestore {}

class MockFirebaseStorage extends Mock implements FirebaseStorage {}

class MockGoogleSignin extends Mock implements GoogleSignIn {}

class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

class MockQuery extends Mock implements Query {}

class MockDocumentChange extends Mock implements DocumentChange {}

class MockQuerySnapshot extends Mock implements QuerySnapshot {}

class MockAuthResult extends Mock implements AuthResult {}

class MockFirebaseUser extends Mock implements FirebaseUser {}

class MockGoogleSignInAuthentication extends Mock
    implements GoogleSignInAuthentication {}

class MockPolisGoogleAuthProvider extends Mock
    implements PolisGoogleAuthProvider {}

class MockAuthCredential extends Mock implements AuthCredential {}

class MockCollectionReference extends Mock implements CollectionReference {}

class MockStorageReference extends Mock implements StorageReference {}

class MockStorageUploadTask extends Mock implements StorageUploadTask {}

class MockStorageTaskSnapshot extends Mock implements StorageTaskSnapshot {}

class MockDocumentReference extends Mock implements DocumentReference {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

class MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}

class MockFirebaseMessaging extends Mock implements FirebaseMessaging {}

class MockCrashlytics extends Mock implements Crashlytics {}

class MockFirebasePerformance extends Mock implements FirebasePerformance {}

// Hive
class MockHive extends Mock implements HiveInterface {}

class MockPartidoBox extends Mock implements Box<PartidoModel> {}

class MockPoliticoBox extends Mock implements Box<PoliticoModel> {}

class MockOrgaoBox extends Mock implements Box<OrgaoModel> {}

// Service
class MockAnalyticsService extends Mock implements AnalyticsService {}

class MockPerformanceService extends Mock implements PerformanceService {}

class MockShareService extends Mock implements ShareService {}

class MockMessageService extends Mock implements MessageService {}

class MockSharedPreferencesService extends Mock
    implements SharedPreferencesService {}

class MockPartidoService extends Mock implements PartidoService {}

class MockOrgaoService extends Mock implements OrgaoService {}

class MockPoliticoService extends Mock implements PoliticoService {}

class MockAppUpdateService extends Mock implements AppUpdateService {}

class MockUrlLauncherService extends Mock implements UrlLauncherService {}

// Other
class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockTrace extends Mock implements Trace {}

class MockScreenshotController extends Mock implements ScreenshotController {}

class MockFile extends Mock implements File {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockImagePicker extends Mock implements ImagePicker {}

class MockPanelController extends Mock implements PanelController {}

class MockPoliticProfileStreamSubscription extends Mock
    implements StreamSubscription<PoliticProfileState> {}

// Http
class MockDio extends Mock implements Dio {}

class MockResponse extends Mock implements Response {}
