import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/enum/auth_provider.dart';
import 'package:polis/i18n/i18n.dart';
import 'package:polis/model/models.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/widget/centered_loading.dart';

import '../../mock.dart';
import '../utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('EditProfilePage tests', () {
    testWidgets('should build connected without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          EditProfilePageConnected(),
        ),
      );
    });

    testWidgets('should build without exploding', (tester) async {
      final mockEditProfileBloc = MockEditProfileBloc();
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<EditProfileBloc>(
            bloc: mockEditProfileBloc,
            page: EditProfilePage(
              imagePicker: MockPolisImagePicker(),
            ),
          ),
        ),
      );
    });

    testWidgets('should show snackbar when success', (tester) async {
      final mockEditProfileBloc = MockEditProfileBloc();
      whenListen(
        mockEditProfileBloc,
        Stream.fromIterable(
          [
            UpdatingUser(),
            UserUpdateSuccess(),
          ],
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<EditProfileBloc>(
            bloc: mockEditProfileBloc,
            page: EditProfilePage(
              imagePicker: MockPolisImagePicker(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final snackSuccess = find.text(USER_UPDATED_WITH_SUCCESS);
      expect(snackSuccess, findsOneWidget);
    });

    testWidgets('should show snackbar when fails', (tester) async {
      final mockEditProfileBloc = MockEditProfileBloc();
      whenListen(
        mockEditProfileBloc,
        Stream.fromIterable(
          [
            UpdatingUser(),
            UserUpdateFailed(),
          ],
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<EditProfileBloc>(
            bloc: mockEditProfileBloc,
            page: EditProfilePage(
              imagePicker: MockPolisImagePicker(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final snackSuccess = find.text(USER_UPDATE_FAILED);
      expect(snackSuccess, findsOneWidget);
    });

    testWidgets('should show photo from user model', (tester) async {
      provideMockedNetworkImages(() async {
        final mockUserBloc = MockUserBloc();
        when(mockUserBloc.user).thenReturn(
          UserModel(
            photoUrl: 'photo',
          ),
        );
        final mockEditProfileBloc = MockEditProfileBloc();
        await tester.pumpWidget(
          connectedWidget(
            PageConnected<UserBloc>(
              bloc: mockUserBloc,
              page: PageConnected<EditProfileBloc>(
                bloc: mockEditProfileBloc,
                page: EditProfilePage(
                  imagePicker: MockPolisImagePicker(),
                ),
              ),
            ),
          ),
        );
        final userPhoto = find.byKey(const ValueKey('photo-url-user'));
        expect(userPhoto, findsOneWidget);
      });
    });

    testWidgets('should show loading when updating', (tester) async {
      final mockEditProfileBloc = MockEditProfileBloc();
      when(mockEditProfileBloc.state).thenReturn(UpdatingUser());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<EditProfileBloc>(
            bloc: mockEditProfileBloc,
            page: EditProfilePage(
              imagePicker: MockPolisImagePicker(),
            ),
          ),
        ),
      );
      final loading = find.byType(CenteredLoading);
      expect(loading, findsOneWidget);
    });

    testWidgets('should change image when camera called', (tester) async {
      final mockEditProfileBloc = MockEditProfileBloc();
      final mockPolisImagePicker = MockPolisImagePicker();
      when(mockPolisImagePicker.getImage())
          .thenAnswer((_) => Future.value(File('assets/images/google.png')));
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<EditProfileBloc>(
            bloc: mockEditProfileBloc,
            page: EditProfilePage(
              imagePicker: mockPolisImagePicker,
            ),
          ),
        ),
      );
      final profile = find.byKey(const ValueKey('profile-container'));
      expect(profile, findsOneWidget);
      await tester.tap(profile);
      await tester.pumpAndSettle();
      expect(find.byKey(const ValueKey('photo-url-file')), findsOneWidget);
    });

    testWidgets('should validate and save the form', (tester) async {
      final mockEditProfileBloc = MockEditProfileBloc();
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<EditProfileBloc>(
            bloc: mockEditProfileBloc,
            page: EditProfilePage(
              imagePicker: MockPolisImagePicker(),
            ),
          ),
        ),
      );
      final form = tester.widget(find.byType(Form)) as Form;
      final formKey = form.key as GlobalKey<FormState>;

      final nameField = find.byKey(const ValueKey('name-field'));
      final emailField = find.byKey(const ValueKey('email-field'));

      await tester.enterText(nameField, 'test');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.enterText(emailField, 'test@gmail.com');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pump();

      final confirmBtn = find.text(CONFIRM);
      await tester.tap(confirmBtn);
      await tester.pumpAndSettle();
      expect(formKey.currentState.validate(), isTrue);
      verify(
        mockEditProfileBloc.add(
          UpdateUserInfo(
            currentUser: UserModel(userId: '1'),
            name: 'test',
            email: 'test@gmail.com',
            pickedPhoto: null,
          ),
        ),
      ).called(1);
    });

    testWidgets(
        '''should go to ChangePasswordPage when user is not from google and click btn''',
        (tester) async {
      final mockUserBloc = MockUserBloc();
      when(mockUserBloc.user).thenReturn(
        UserModel(
          userId: '1',
          authProvider: AuthProvider.emailAndPassword,
        ),
      );
      final mockEditProfileBloc = MockEditProfileBloc();
      final mockPolisImagePicker = MockPolisImagePicker();
      when(mockPolisImagePicker.getImage())
          .thenAnswer((_) => Future.value(File('assets/images/google.png')));
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<UserBloc>(
            bloc: mockUserBloc,
            page: PageConnected<EditProfileBloc>(
              bloc: mockEditProfileBloc,
              page: EditProfilePage(
                imagePicker: MockPolisImagePicker(),
              ),
            ),
          ),
        ),
      );
      final changePasswordButton = find.text(CHANGE_PASSWORD);
      expect(changePasswordButton, findsOneWidget);
      await tester.tap(changePasswordButton);
      await tester.pumpAndSettle();
      expect(find.byType(ChangePasswordPage), findsOneWidget);
    });

    testWidgets(
        '''ChangePassword button should not appear when user from google''',
        (tester) async {
      final mockUserBloc = MockUserBloc();
      when(mockUserBloc.user).thenReturn(
        UserModel(
          userId: '1',
          authProvider: AuthProvider.google,
        ),
      );
      final mockEditProfileBloc = MockEditProfileBloc();
      final mockPolisImagePicker = MockPolisImagePicker();
      when(mockPolisImagePicker.getImage())
          .thenAnswer((_) => Future.value(File('assets/images/google.png')));
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<UserBloc>(
            bloc: mockUserBloc,
            page: PageConnected<EditProfileBloc>(
              bloc: mockEditProfileBloc,
              page: EditProfilePage(
                imagePicker: MockPolisImagePicker(),
              ),
            ),
          ),
        ),
      );
      final changePasswordButton = find.text(CHANGE_PASSWORD);
      expect(changePasswordButton, findsNothing);
    });
  });
}
