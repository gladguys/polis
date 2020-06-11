import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/extension/extensions.dart';
import 'package:polis/core/keys.dart';
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

  MockPanelController mockPanelController;

  group('SignupPage tests', () {
    setUp(() {
      mockPanelController = MockPanelController();
    });

    test('asserts', () {
      expect(
          () => SignupPageConnected(
                panelController: null,
              ),
          throwsAssertionError);

      expect(
          () => SignupPage(
                imagePicker: null,
                panelController: mockPanelController,
              ),
          throwsAssertionError);

      expect(
          () => SignupPage(
                imagePicker: MockImagePicker(),
                panelController: null,
              ),
          throwsAssertionError);
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          Scaffold(
            body: SignupPageConnected(panelController: mockPanelController),
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
                panelController: mockPanelController,
                imagePicker: ImagePicker(),
              ),
            ),
          ),
        ),
      );
      final form = tester.widget(find.byType(Form)) as Form;
      final formKey = form.key as GlobalKey<FormState>;

      final nameField = find.byKey(nameFieldKey);
      final emailField = find.byKey(signupEmailFieldKey);
      final passwordField = find.byKey(signupPasswordFieldKey);
      final confirmPasswordField = find.byKey(confirmPasswordFieldKey);

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

      final signupBtn = find.byKey(signupButtonKey);
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
                panelController: mockPanelController,
                imagePicker: ImagePicker(),
              ),
            ),
          ),
        ),
      );
      final form = tester.widget(find.byType(Form)) as Form;
      final formKey = form.key as GlobalKey<FormState>;

      final nameField = find.byKey(nameFieldKey);
      final emailField = find.byKey(signupEmailFieldKey);
      final passwordField = find.byKey(signupPasswordFieldKey);
      final confirmPasswordField = find.byKey(confirmPasswordFieldKey);

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
      when(mockSignupBloc.state).thenReturn(InitialSignup());
      whenListen(
        mockSignupBloc,
        Stream<SignupState>.fromIterable([
          InitialSignup(),
          UserCreated(),
        ]),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SignupBloc>(
            bloc: mockSignupBloc,
            page: Scaffold(
              body: SignupPage(
                panelController: mockPanelController,
                imagePicker: ImagePicker(),
              ),
            ),
          ),
        ),
      );
      await tester.pump();
      await tester.pumpAndSettle(10.seconds);
      verify(mockObserver.didPush(any, any));
      verify(mockPanelController.close()).called(1);
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
                panelController: mockPanelController,
                imagePicker: ImagePicker(),
              ),
            ),
          ),
        ),
      );
      expect(find.byType(Loading), findsOneWidget);
    });

    testWidgets('should show error when signup failed', (tester) async {
      final mockSignupBloc = MockSignupBloc();
      when(mockSignupBloc.state).thenReturn(InitialSignup());
      whenListen(
        mockSignupBloc,
        Stream<SignupState>.fromIterable([
          InitialSignup(),
          SignupFailed('fail'),
        ]),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SignupBloc>(
            bloc: mockSignupBloc,
            page: Scaffold(
              body: SignupPage(
                panelController: mockPanelController,
                imagePicker: ImagePicker(),
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
      when(mockSignupBloc.state).thenReturn(InitialSignup());
      whenListen(
        mockSignupBloc,
        Stream<SignupState>.fromIterable([
          InitialSignup(),
          UserCreationFailed('fail create'),
        ]),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SignupBloc>(
            bloc: mockSignupBloc,
            page: Scaffold(
              body: SignupPage(
                panelController: mockPanelController,
                imagePicker: ImagePicker(),
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
      final mockPolisImagePicker = MockImagePicker();
      when(mockPolisImagePicker.getImage(source: ImageSource.camera))
          .thenAnswer(
              (_) => Future.value(PickedFile('assets/images/google.png')));
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SignupBloc>(
            bloc: mockSignupBloc,
            page: Scaffold(
              body: SignupPage(
                panelController: mockPanelController,
                imagePicker: mockPolisImagePicker,
              ),
            ),
          ),
        ),
      );
      final profile = find.byKey(profileContainerKey);
      expect(profile, findsOneWidget);
      await tester.tap(profile);
      await tester.pumpAndSettle();
      expect(find.byType(ClipRRect), findsOneWidget);
    });
  });
}
