import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/i18n/i18n.dart';
import 'package:polis/model/models.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';

import '../../mock.dart';
import '../utils.dart';

void main() {
  setUpAll(() {
    initLocator(MockSharedPreferences());
  });

  group('SigninPage tests', () {
    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          Scaffold(
            body: SigninPageConnected(),
          ),
        ),
      );
    });

    testWidgets(
        '''should navigate to PoliticSugestionPage when user auths and has not yet done signin''',
        (tester) async {
      final mockSigninBloc = MockSigninBloc();
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
              body: SigninPage(),
            ),
          ),
        ),
      );
    });

    testWidgets(
        'should navigate to Timeline when user auths and has yet done signin',
        (tester) async {
      final mockSigninBloc = MockSigninBloc();
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
              body: SigninPage(),
            ),
          ),
        ),
      );
    });

    testWidgets('should validate and save the form', (tester) async {
      final mockSigninBloc = MockSigninBloc();
      when(mockSigninBloc.state).thenReturn(InitialSignin());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SigninBloc>(
            bloc: mockSigninBloc,
            page: Scaffold(
              body: SigninPage(),
            ),
          ),
        ),
      );
      final form = tester.widget(find.byType(Form)) as Form;
      final formKey = form.key as GlobalKey<FormState>;

      final emailField = find.byKey(const ValueKey('email-field'));
      final passwordField = find.byKey(const ValueKey('password-field'));

      await tester.enterText(emailField, 'test@gmail.com');
      await tester.enterText(passwordField, 'secret');
      await tester.pump();

      final signinBtn = find.byKey(const ValueKey('signin-btn'));
      await tester.tap(signinBtn);
      await tester.pumpAndSettle();
      expect(formKey.currentState.validate(), isTrue);
      verify(mockSigninBloc
              .add(SigninWithEmailAndPassword('test@gmail.com', 'secret')))
          .called(1);
    });

    testWidgets('''should validate and save the form when clicking keyboard''',
        (tester) async {
      final mockSigninBloc = MockSigninBloc();
      when(mockSigninBloc.state).thenReturn(InitialSignin());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SigninBloc>(
            bloc: mockSigninBloc,
            page: Scaffold(
              body: SigninPage(),
            ),
          ),
        ),
      );
      final form = tester.widget(find.byType(Form)) as Form;
      final formKey = form.key as GlobalKey<FormState>;

      final emailField = find.byKey(const ValueKey('email-field'));
      final passwordField = find.byKey(const ValueKey('password-field'));

      await tester.enterText(emailField, 'test@gmail.com');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.enterText(passwordField, 'secret');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(formKey.currentState.validate(), isTrue);
      verify(mockSigninBloc
              .add(SigninWithEmailAndPassword('test@gmail.com', 'secret')))
          .called(1);
    });

    testWidgets('should show error message when signin failed', (tester) async {
      final mockSigninBloc = MockSigninBloc();
      whenListen(
        mockSigninBloc,
        Stream<SigninState>.fromIterable(
            [InitialSignin(), SigninFailed('fail')]),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SigninBloc>(
            bloc: mockSigninBloc,
            page: Scaffold(
              body: SigninPage(),
            ),
          ),
        ),
      );
      await tester.pump();
      expect(find.text(SIGNIN_FAILED), findsOneWidget);
    });

    testWidgets('should show error message when signin auth failed',
        (tester) async {
      final mockSigninBloc = MockSigninBloc();
      whenListen(
        mockSigninBloc,
        Stream<SigninState>.fromIterable(
            [InitialSignin(), UserAuthenticationFailed('fail')]),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SigninBloc>(
            bloc: mockSigninBloc,
            page: Scaffold(
              body: SigninPage(),
            ),
          ),
        ),
      );
      await tester.pump();
      expect(find.text(ERROR_AUTENTICATING_USER), findsOneWidget);
    });

    testWidgets('should do something when recover password is clicked',
        (tester) async {
      final mockSigninBloc = MockSigninBloc();
      when(mockSigninBloc.state).thenReturn(InitialSignin());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SigninBloc>(
            bloc: mockSigninBloc,
            page: Scaffold(
              body: SigninPage(),
            ),
          ),
        ),
      );
      final recoverPasswordButton = find.text(RECOVERY_PASSWORD);
      expect(recoverPasswordButton, findsOneWidget);
      await tester.tap(recoverPasswordButton);
      await tester.pumpAndSettle();
    });
  });
}
