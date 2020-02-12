import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/repository/abstract/signin_repository.dart';
import 'package:polis/repository/abstract/signup_repository.dart';

class MockSigninRepository extends Mock implements SigninRepository {}

class MockSignupRepository extends Mock implements SignupRepository {}

class MockGoogleSignin extends Mock implements GoogleSignIn {}
