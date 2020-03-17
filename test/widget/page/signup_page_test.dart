import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/model/user_model.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/page/signup/signup_page.dart';
import 'package:polis/page/signup/signup_page_connected.dart';

import '../../mock.dart';
import '../utils.dart';

void main() {
  group('SignupPage tests', () {
    setUpAll(initLocator);

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(SignupPageConnected()),
      );
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(SignupPageConnected()),
      );
      final signinBtn = find.byKey(const ValueKey('signin-btn'));
      await tester.tap(signinBtn);
      await tester.pumpAndSettle();
      expect(find.byType(SigninPage), findsOneWidget);
    });

    testWidgets('should validate and save the form', (tester) async {
      final mockSignupBloc = MockSignupBloc();
      when(mockSignupBloc.state).thenReturn(InitialSignup());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SignupBloc>(
            bloc: mockSignupBloc,
            page: SignupPage(),
          ),
        ),
      );
      final form = tester.widget(find.byType(Form)) as Form;
      final formKey = form.key as GlobalKey<FormState>;

      final nameField = find.byKey(const ValueKey('name-field'));
      final emailField = find.byKey(const ValueKey('email-field'));
      final passwordField = find.byKey(const ValueKey('password-field'));
      final confirmPasswordField =
          find.byKey(const ValueKey('confirm-password-field'));

      final signupUser = UserModel(
        name: 'test',
        email: 'test@gmail.com',
        password: 'secret',
      );
      await tester.enterText(nameField, 'test');
      await tester.enterText(emailField, 'test@gmail.com');
      await tester.enterText(passwordField, 'secret');
      await tester.enterText(confirmPasswordField, 'secret');
      await tester.pump();

      final signupBtn = find.byKey(const ValueKey('signup-btn'));
      await tester.tap(signupBtn);
      await tester.pumpAndSettle();
      expect(formKey.currentState.validate(), isTrue);
      verify(mockSignupBloc.add(Signup(signupUser))).called(1);
    });

    testWidgets('should go to SigninPage when user created', (tester) async {
      final mockSignupBloc = MockSignupBloc();
      whenListen(
        mockSignupBloc,
        Stream<SignupState>.fromIterable([InitialSignup(), UserCreated()]),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SignupBloc>(
            bloc: mockSignupBloc,
            page: SignupPage(),
          ),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 10));
      expect(find.byType(SigninPage), findsOneWidget);
    });

    testWidgets('should show loading indicator', (tester) async {
      final mockSignupBloc = MockSignupBloc();
      when(mockSignupBloc.state).thenReturn(SignupLoading());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SignupBloc>(
            bloc: mockSignupBloc,
            page: SignupPage(),
          ),
        ),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should show error when signin fail', (tester) async {
      final mockSignupBloc = MockSignupBloc();
      whenListen(
        mockSignupBloc,
        Stream<SignupState>.fromIterable(
            [InitialSignup(), UserCreationFailed('fail')]),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SignupBloc>(
            bloc: mockSignupBloc,
            page: SignupPage(),
          ),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 10));
    });

    testWidgets('should show error when signin failed', (tester) async {
      final mockSignupBloc = MockSignupBloc();
      whenListen(
        mockSignupBloc,
        Stream<SignupState>.fromIterable(
            [InitialSignup(), SignupFailed('fail')]),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SignupBloc>(
            bloc: mockSignupBloc,
            page: SignupPage(),
          ),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 10));
    });
  });
}
