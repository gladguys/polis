import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/abstract/polis_image_picker.dart';
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
    setUpAll(() {
      initLocator(MockSharedPreferences());
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          Scaffold(
            body: SignupPageConnected(),
          ),
        ),
      );
    });

    testWidgets('should validate and save the form', (tester) async {
      final mockSignupBloc = MockSignupBloc();
      when(mockSignupBloc.state).thenReturn(InitialSignup());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SignupBloc>(
            bloc: mockSignupBloc,
            page: Scaffold(
              body: SignupPage(
                imagePicker: PolisImagePicker(),
              ),
            ),
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
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.enterText(emailField, 'test@gmail.com');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.enterText(passwordField, 'secret');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.enterText(confirmPasswordField, 'secret');
      await tester.pump();

      final signupBtn = find.byKey(const ValueKey('signup-btn'));
      await tester.tap(signupBtn);
      await tester.pumpAndSettle();
      expect(formKey.currentState.validate(), isTrue);
      verify(mockSignupBloc.add(Signup(user: signupUser, profilePhoto: null)))
          .called(1);
    });

    testWidgets('''should validate and save the form whn click on keyboard''',
        (tester) async {
      final mockSignupBloc = MockSignupBloc();
      when(mockSignupBloc.state).thenReturn(InitialSignup());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SignupBloc>(
            bloc: mockSignupBloc,
            page: Scaffold(
              body: SignupPage(
                imagePicker: PolisImagePicker(),
              ),
            ),
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

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      expect(formKey.currentState.validate(), isTrue);
      verify(mockSignupBloc.add(Signup(user: signupUser, profilePhoto: null)))
          .called(1);
    });

    testWidgets('should go to InitialPage when user created', (tester) async {
      final mockSignupBloc = MockSignupBloc();
      whenListen(
        mockSignupBloc,
        Stream<SignupState>.fromIterable([InitialSignup(), UserCreated()]),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SignupBloc>(
            bloc: mockSignupBloc,
            page: Scaffold(
              body: SignupPage(
                imagePicker: PolisImagePicker(),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 10));
      expect(find.byType(InitialPage), findsOneWidget);
      verify(mockObserver.didPush(any, any));
    });

    testWidgets('should show loading indicator', (tester) async {
      final mockSignupBloc = MockSignupBloc();
      when(mockSignupBloc.state).thenReturn(SignupLoading());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SignupBloc>(
            bloc: mockSignupBloc,
            page: Scaffold(
              body: SignupPage(
                imagePicker: PolisImagePicker(),
              ),
            ),
          ),
        ),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should show error when signup failed', (tester) async {
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
            page: Scaffold(
              body: SignupPage(
                imagePicker: PolisImagePicker(),
              ),
            ),
          ),
        ),
      );
      await tester.pump();
      expect(find.text('fail'), findsOneWidget);
    });

    testWidgets('should show error when user creation failed', (tester) async {
      final mockSignupBloc = MockSignupBloc();
      whenListen(
        mockSignupBloc,
        Stream<SignupState>.fromIterable(
            [InitialSignup(), UserCreationFailed('fail create')]),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SignupBloc>(
            bloc: mockSignupBloc,
            page: Scaffold(
              body: SignupPage(
                imagePicker: PolisImagePicker(),
              ),
            ),
          ),
        ),
      );
      await tester.pump();
      expect(find.text('fail create'), findsOneWidget);
    });

    testWidgets('should change image when camera called', (tester) async {
      final mockSignupBloc = MockSignupBloc();
      when(mockSignupBloc.state).thenReturn(InitialSignup());
      final mockPolisImagePicker = MockPolisImagePicker();
      when(mockPolisImagePicker.getImage())
          .thenAnswer((_) => Future.value(File('assets/images/google.png')));
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SignupBloc>(
            bloc: mockSignupBloc,
            page: Scaffold(
              body: SignupPage(
                imagePicker: mockPolisImagePicker,
              ),
            ),
          ),
        ),
      );
      final profile = find.byKey(const ValueKey('profile-container'));
      expect(profile, findsOneWidget);
      await tester.tap(profile);
      await tester.pumpAndSettle();
      expect(find.byType(ClipRRect), findsOneWidget);
    });
  });
}
