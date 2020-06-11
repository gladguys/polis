import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/i18n/i18n.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/widget/loading.dart';

import '../mock.dart';
import '../utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    const channel = MethodChannel('plugins.flutter.io/firebase_performance');
    channel.setMockMethodCallHandler((methodCall) async => true);
    initLocator(MockSharedPreferences());
  });

  group('InitialPage tests', () {
    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(connectedWidget(InitialPageConnected()));
    });

    testWidgets('shuld go to signin page when click the button',
        (tester) async {
      await tester.pumpWidget(connectedWidget(InitialPageConnected()));
      final signinWithEmailButton = find.text(SIGNIN_WITH_EMAIL);
      await tester.tap(signinWithEmailButton);
      await tester.pumpAndSettle();
      expect(find.byType(SigninPage), findsOneWidget);
    });

    testWidgets('''shuld call SigninBloc event when signin with google''',
        (tester) async {
      final mockSigninBloc = MockSigninBloc();
      when(mockSigninBloc.state).thenReturn(InitialSignin());
      when(mockSigninBloc.add(SigninWithGoogle()))
          .thenAnswer((_) => Future.value());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SigninBloc>(
            bloc: mockSigninBloc,
            page: InitialPage(),
          ),
        ),
      );
      final signinWithGoogle = find.text(SIGNIN_WITH_GOOGLE);
      await tester.tap(signinWithGoogle);
      verify(mockSigninBloc.add(SigninWithGoogle())).called(1);
    });

    testWidgets(
        '''should navigate to PoliticSugestionPage when user auths and has not yet done signin''',
        (tester) async {
      final mockSigninBloc = MockSigninBloc();
      when(mockSigninBloc.state).thenReturn(InitialSignin());
      whenListen(
        mockSigninBloc,
        Stream<SigninState>.fromIterable([
          InitialSignin(),
          UserAuthenticated(
            UserModel(userId: '1', isFirstLoginDone: false),
          ),
        ]),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SigninBloc>(
            bloc: mockSigninBloc,
            page: Scaffold(
              body: InitialPage(),
            ),
          ),
        ),
      );
    });

    testWidgets(
        'should navigate to Timeline when user auths and has yet done signin',
        (tester) async {
      final mockSigninBloc = MockSigninBloc();
      when(mockSigninBloc.state).thenReturn(InitialSignin());
      whenListen(
        mockSigninBloc,
        Stream<SigninState>.fromIterable([
          InitialSignin(),
          UserAuthenticated(
            UserModel(
              userId: '1',
              isFirstLoginDone: true,
            ),
          )
        ]),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SigninBloc>(
            bloc: mockSigninBloc,
            page: Scaffold(
              body: InitialPage(),
            ),
          ),
        ),
      );
    });

    testWidgets('should show error message when google signin failed',
        (tester) async {
      final mockSigninBloc = MockSigninBloc();
      when(mockSigninBloc.state).thenReturn(InitialSignin());
      whenListen(
        mockSigninBloc,
        Stream<SigninState>.fromIterable(
            [InitialSignin(), SigninFailed(ERROR_INVALID_CREDENTIALS)]),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SigninBloc>(
            bloc: mockSigninBloc,
            page: Scaffold(
              body: InitialPage(),
            ),
          ),
        ),
      );
      await tester.pump();
      expect(find.text(ERROR_INVALID_CREDENTIALS), findsOneWidget);
    });

    testWidgets('should show error message when google user auth fails failed',
        (tester) async {
      final mockSigninBloc = MockSigninBloc();
      when(mockSigninBloc.state).thenReturn(InitialSignin());
      whenListen(
        mockSigninBloc,
        Stream<SigninState>.fromIterable([
          InitialSignin(),
          UserAuthenticationFailed(ERROR_INVALID_CREDENTIALS)
        ]),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SigninBloc>(
            bloc: mockSigninBloc,
            page: Scaffold(
              body: InitialPage(),
            ),
          ),
        ),
      );
      await tester.pump();
      expect(find.text(ERROR_AUTENTICATING_USER), findsOneWidget);
    });

    testWidgets('should show loading', (tester) async {
      final mockSigninBloc = MockSigninBloc();
      when(mockSigninBloc.state).thenReturn(InitialSignin());
      whenListen(
        mockSigninBloc,
        Stream<SigninState>.fromIterable([
          InitialSignin(),
          SigninLoading(),
        ]),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SigninBloc>(
            bloc: mockSigninBloc,
            page: Scaffold(
              body: InitialPage(),
            ),
          ),
        ),
      );
      await tester.pump();
      expect(find.byType(Loading), findsOneWidget);
    });

    testWidgets('shuld go to signup page when click on no account button',
        (tester) async {
      await tester.pumpWidget(connectedWidget(InitialPageConnected()));
      final noAccountButton = find.text(NO_ACCOUNT);
      await tester.tap(noAccountButton);
      await tester.pumpAndSettle();
    });
  });
}
