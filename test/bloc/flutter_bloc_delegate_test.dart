import 'package:bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/bloc/flutter_bloc_delegate.dart';
import 'package:polis/model/user_model.dart';

import '../mock.dart';

void main() {
  group('FlutterBlocDelegate tests', () {
    FlutterBlocDelegate delegate;
    SigninBloc signinBloc;
    MockSigninRepository mockSigninRepository;
    MockAnalyticsService mockAnalyticsService;
    MockSharedPreferencesService mockSharedPreferencesService;

    setUp(() {
      delegate = FlutterBlocDelegate();
      mockSigninRepository = MockSigninRepository();
      mockAnalyticsService = MockAnalyticsService();
      mockSharedPreferencesService = MockSharedPreferencesService();
      signinBloc = SigninBloc(
        repository: mockSigninRepository,
        analyticsService: mockAnalyticsService,
        sharedPreferencesService: mockSharedPreferencesService,
      );
    });

    test('onEvent test', () {
      delegate.onEvent(signinBloc, SigninWithEmailAndPassword('email', 'pass'));
    });

    test('onTransition test', () {
      delegate.onTransition(
        signinBloc,
        Transition(
          currentState: InitialSignin(),
          event: SigninWithEmailAndPassword('email', 'pass'),
          nextState: UserAuthenticated(UserModel()),
        ),
      );
    });

    test('onError test', () {
      delegate.onError(signinBloc, 'error', null);
    });
  });
}
