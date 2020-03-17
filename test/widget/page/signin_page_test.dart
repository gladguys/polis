import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/i18n/i18n.dart';
import 'package:polis/model/user_model.dart';
import 'package:polis/page/home/home_page.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/page/signin/signin_page_connected.dart';
import 'package:polis/page/signup/signup_page.dart';

import '../../mock.dart';
import '../utils.dart';

void main() {
  setUpAll(initLocator);

  group('SigninPage tests', () {
    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(SigninPageConnected()),
      );
    });

    testWidgets('should go to SignupPage when clicked on btn', (tester) async {
      await tester.pumpWidget(
        connectedWidget(SigninPageConnected()),
      );
      final signoutBtn = find.text(SIGNUP);
      expect(signoutBtn, findsOneWidget);
      await tester.tap(signoutBtn);
      await tester.pumpAndSettle();
      expect(find.byType(SignupPage), findsOneWidget);
    });

    testWidgets('should add SigninWithGoogle event when click on btn',
        (tester) async {
      final mockSigninBloc = MockSigninBloc();
      when(mockSigninBloc.state).thenReturn(InitialSignin());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SigninBloc>(
            bloc: mockSigninBloc,
            page: SigninPage(),
          ),
        ),
      );
      final signinWithGoogleBtn =
          find.byKey(const ValueKey('google-signin-btn'));
      expect(signinWithGoogleBtn, findsOneWidget);
      await tester.tap(signinWithGoogleBtn);
      await tester.pumpAndSettle();
      verify(mockSigninBloc.add(SigninWithGoogle())).called(1);
    });

    testWidgets('should show error snackbar when signin fails', (tester) async {
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
            page: SigninPage(),
          ),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 10));
      expect(find.text('fail'), findsOneWidget);
    });

    testWidgets('should navigate to HomePage when user auths', (tester) async {
      final mockSigninBloc = MockSigninBloc();
      whenListen(
        mockSigninBloc,
        Stream<SigninState>.fromIterable(
            [InitialSignin(), UserAuthenticated(UserModel(userId: '1'))]),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SigninBloc>(
            bloc: mockSigninBloc,
            page: SigninPage(),
          ),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 10));
      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('should validate and save the form', (tester) async {
      final mockSigninBloc = MockSigninBloc();
      when(mockSigninBloc.state).thenReturn(InitialSignin());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SigninBloc>(
            bloc: mockSigninBloc,
            page: SigninPage(),
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

    testWidgets('should show error message when signin failed', (tester) async {
      final mockSigninBloc = MockSigninBloc();
      when(mockSigninBloc.state).thenReturn(SigninFailed('fail'));
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SigninBloc>(
            bloc: mockSigninBloc,
            page: SigninPage(),
          ),
        ),
      );
      expect(find.text('fail'), findsOneWidget);
    });
  });
}
