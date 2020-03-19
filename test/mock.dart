import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/service/ad_service.dart';
import 'package:polis/core/service/analytics_service.dart';
import 'package:polis/repository/abstract/politic_suggestion_repository.dart';
import 'package:polis/repository/abstract/signin_repository.dart';
import 'package:polis/repository/abstract/signup_repository.dart';
import 'package:polis/repository/abstract/user_profile_repository.dart';
import 'package:polis/repository/abstract/user_repository.dart';

// Bloc
class MockSigninBloc extends MockBloc<SigninEvent, SigninState>
    implements SigninBloc {}

class MockPoliticSuggestionBloc
    extends MockBloc<PoliticSuggestionEvent, PoliticSuggestionState>
    implements PoliticSuggestionBloc {}

class MockSignupBloc extends MockBloc<SignupEvent, SignupState>
    implements SignupBloc {}

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MockUserProfileBloc extends MockBloc<UserProfileEvent, UserProfileState>
    implements UserProfileBloc {}

// Repository
class MockSigninRepository extends Mock implements SigninRepository {}

class MockPoliticSugestionRepository extends Mock
    implements PoliticSuggestionRepository {}

class MockUserProfileRepository extends Mock implements UserProfileRepository {}

class MockSignupRepository extends Mock implements SignupRepository {}

class MockUserRepository extends Mock implements UserRepository {}

// Firebase
class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirestore extends Mock implements Firestore {}

class MockGoogleSignin extends Mock implements GoogleSignIn {}

class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

class MockQuery extends Mock implements Query {}

class MockQuerySnapshot extends Mock implements QuerySnapshot {}

class MockAuthResult extends Mock implements AuthResult {}

class MockFirebaseUser extends Mock implements FirebaseUser {}

class MockCollectionReference extends Mock implements CollectionReference {}

class MockDocumentReference extends Mock implements DocumentReference {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

class MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}

class MockCrashlytics extends Mock implements Crashlytics {}

// Service
class MockAnalyticsService extends Mock implements AnalyticsService {}

class MockAdService extends Mock implements AdService {}

// Other
class MockBannerAd extends Mock implements BannerAd {}
