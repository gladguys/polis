import 'dart:async';
import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/bloc/timeline/timeline_cubit.dart';
import 'package:polis/bloc/tramitacao_proposta/tramitacao_proposta_cubit.dart';
import 'package:polis/core/abstract/polis_google_auth_provider.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/repository/abstract/repositories.dart';
import 'package:polis/core/repository/concrete/repositories.dart';
import 'package:polis/core/service/services.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_panel/sliding_panel.dart';

// Bloc
class MockSigninCubit extends MockBloc<SigninState> implements SigninCubit {}

class MockSubCommentsCubit extends MockBloc<SubCommentsState>
    implements SubCommentsCubit {}

class MockCommentCubit extends MockBloc<CommentState> implements CommentCubit {}

class MockPoliticExpensesAnalysisCubit
    extends MockBloc<PoliticExpensesAnalysisState>
    implements PoliticExpensesAnalysisCubit {}

class MockEditProfileCubit extends MockBloc<EditProfileState>
    implements EditProfileCubit {}

class MockComparativoRankingDespesasCubit
    extends MockBloc<ComparativoRankingDespesasState>
    implements ComparativoRankingDespesasCubit {}

class MockChangePasswordCubit extends MockBloc<ChangePasswordState>
    implements ChangePasswordCubit {}

class MockPostCubit extends MockBloc<PostState> implements PostCubit {}

class MockFavoritePostsCubit extends MockBloc<FavoritePostsState>
    implements FavoritePostsCubit {}

class MockPoliticExpensesCubit extends MockBloc<PoliticExpensesState>
    implements PoliticExpensesCubit {}

class MockUserFollowingPoliticsCubit
    extends MockBloc<UserFollowingPoliticsState>
    implements UserFollowingPoliticsCubit {}

class MockPoliticSuggestionCubit extends MockBloc<PoliticSuggestionState>
    implements PoliticSuggestionCubit {}

class MockSignupCubit extends MockBloc<SignupState> implements SignupCubit {}

class MockUserCubit extends MockBloc<UserState> implements UserCubit {}

class MockTramitacaoPropostaCubit extends MockBloc<TramitacaoPropostaState>
    implements TramitacaoPropostaCubit {}

class MockTimelineCubit extends MockBloc<TimelineState>
    implements TimelineCubit {}

class MockPoliticProposalsCubit extends MockBloc<PoliticProposalsState>
    implements PoliticProposalsCubit {}

class MockUserProfileCubit extends MockBloc<UserProfileState>
    implements UserProfileCubit {}

class MockDocumentCubit extends MockBloc<DocumentState>
    implements DocumentCubit {}

class MockPoliticProfileCubit extends MockBloc<PoliticProfileState>
    implements PoliticProfileCubit {}

class MockPoliticFollowersCubit extends MockBloc<PoliticFollowersState>
    implements PoliticFollowersCubit {}

class MockSearchPoliticCubit extends MockBloc<SearchPoliticState>
    implements SearchPoliticCubit {}

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

// Hive
class MockHive extends Mock implements HiveInterface {}

class MockPartidoBox extends Mock implements Box<PartidoModel> {}

class MockPoliticoBox extends Mock implements Box<PoliticoModel> {}

class MockOrgaoBox extends Mock implements Box<OrgaoModel> {}

// Service
class MockAnalyticsService extends Mock implements AnalyticsService {}

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
