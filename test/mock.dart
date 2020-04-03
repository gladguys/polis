import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/abstract/polis_image_picker.dart';
import 'package:polis/core/service/services.dart';
import 'package:polis/model/models.dart';
import 'package:polis/repository/abstract/follow_repository.dart';
import 'package:polis/repository/abstract/politic_followers_repository.dart';
import 'package:polis/repository/abstract/politic_profile_repository.dart';
import 'package:polis/repository/abstract/politic_suggestion_repository.dart';
import 'package:polis/repository/abstract/post_repository.dart';
import 'package:polis/repository/abstract/search_politic_repository.dart';
import 'package:polis/repository/abstract/signin_repository.dart';
import 'package:polis/repository/abstract/signup_repository.dart';
import 'package:polis/repository/abstract/timeline_repository.dart';
import 'package:polis/repository/abstract/user_following_politics_repository.dart';
import 'package:polis/repository/abstract/user_profile_repository.dart';
import 'package:polis/repository/abstract/user_repository.dart';
import 'package:polis/repository/concrete/repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_panel/sliding_panel.dart';

// Bloc
class MockSigninBloc extends MockBloc<SigninEvent, SigninState>
    implements SigninBloc {}

class MockUserFollowingPoliticsBloc
    extends MockBloc<UserFollowingPoliticsEvent, UserFollowingPoliticsState>
    implements UserFollowingPoliticsBloc {}

class MockPoliticSuggestionBloc
    extends MockBloc<PoliticSuggestionEvent, PoliticSuggestionState>
    implements PoliticSuggestionBloc {}

class MockSignupBloc extends MockBloc<SignupEvent, SignupState>
    implements SignupBloc {}

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MockTimelineBloc extends MockBloc<TimelineEvent, TimelineState>
    implements TimelineBloc {}

class MockUserProfileBloc extends MockBloc<UserProfileEvent, UserProfileState>
    implements UserProfileBloc {}

class MockPoliticProfileBloc
    extends MockBloc<PoliticProfileEvent, PoliticProfileState>
    implements PoliticProfileBloc {}

class MockPoliticFollowersBloc
    extends MockBloc<PoliticFollowersEvent, PoliticFollowersState>
    implements PoliticFollowersBloc {}

class MockSearchPoliticBloc
    extends MockBloc<SearchPoliticEvent, SearchPoliticState>
    implements SearchPoliticBloc {}

// Repository
class MockSigninRepository extends Mock implements SigninRepository {}

class MockPoliticSugestionRepository extends Mock
    implements PoliticSuggestionRepository {}

class MockPoliticProfileRepository extends Mock
    implements PoliticProfileRepository {}

class MockPoliticFollowersRepository extends Mock
    implements PoliticFollowersRepository {}

class MockUserProfileRepository extends Mock implements UserProfileRepository {}

class MockSignupRepository extends Mock implements SignupRepository {}

class MockTimelineRepository extends Mock implements TimelineRepository {}

class MockUserRepository extends Mock implements UserRepository {}

class MockUserFollowingPoliticsRepository extends Mock
    implements UserFollowingPoliticsRepository {}

class MockSearchPoliticRepository extends Mock
    implements SearchPoliticRepository {}

class MockPostRepository extends Mock implements PostRepository {}

class MockFollowRepository extends Mock implements FollowRepository {}

class MockFirebasePartidoRepository extends Mock
    implements FirebasePartidoRepository {}

class MockHivePartidoRepository extends Mock implements HivePartidoRepository {}

// Firebase
class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirestore extends Mock implements Firestore {}

class MockFirebaseStorage extends Mock implements FirebaseStorage {}

class MockGoogleSignin extends Mock implements GoogleSignIn {}

class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

class MockQuery extends Mock implements Query {}

class MockQuerySnapshot extends Mock implements QuerySnapshot {}

class MockAuthResult extends Mock implements AuthResult {}

class MockFirebaseUser extends Mock implements FirebaseUser {}

class MockCollectionReference extends Mock implements CollectionReference {}

class MockStorageReference extends Mock implements StorageReference {}

class MockStorageUploadTask extends Mock implements StorageUploadTask {}

class MockStorageTaskSnapshot extends Mock implements StorageTaskSnapshot {}

class MockDocumentReference extends Mock implements DocumentReference {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

class MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}

class MockCrashlytics extends Mock implements Crashlytics {}

// Hive
class MockHive extends Mock implements HiveInterface {}

class MockPartidoBox extends Mock implements Box<PartidoModel> {}

// Service
class MockAnalyticsService extends Mock implements AnalyticsService {}

class MockAdService extends Mock implements AdService {}

class MockSharedPreferencesService extends Mock
    implements SharedPreferencesService {}

class MockPartidoService extends Mock implements PartidoService {}

// Other
class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockBannerAd extends Mock implements BannerAd {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockPolisImagePicker extends Mock implements PolisImagePicker {}

class MockPanelController extends Mock implements PanelController {}
