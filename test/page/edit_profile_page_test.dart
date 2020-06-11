import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/enum/auth_provider.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/i18n/i18n.dart';
import 'package:polis/core/keys.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/widget/loading.dart';

import '../mock.dart';
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
      when(mockEditProfileBloc.state).thenReturn(InitialEditProfileState());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<EditProfileBloc>(
            bloc: mockEditProfileBloc,
            page: EditProfilePage(
              imagePicker: MockImagePicker(),
            ),
          ),
        ),
      );
    });

    testWidgets('should show snackbar when success', (tester) async {
      final mockEditProfileBloc = MockEditProfileBloc();
      when(mockEditProfileBloc.state).thenReturn(UserUpdateSuccess());
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
              imagePicker: MockImagePicker(),
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
      when(mockEditProfileBloc.state).thenReturn(UserUpdateFailed());
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
              imagePicker: MockImagePicker(),
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
        when(mockEditProfileBloc.state).thenReturn(InitialEditProfileState());
        await tester.pumpWidget(
          connectedWidget(
            PageConnected<UserBloc>(
              bloc: mockUserBloc,
              page: PageConnected<EditProfileBloc>(
                bloc: mockEditProfileBloc,
                page: EditProfilePage(
                  imagePicker: MockImagePicker(),
                ),
              ),
            ),
          ),
        );
        final userPhoto = find.byKey(photoUrlUserKey);
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
              imagePicker: MockImagePicker(),
            ),
          ),
        ),
      );
      final loading = find.byType(Loading);
      expect(loading, findsOneWidget);
    });

    testWidgets('should change image when camera called', (tester) async {
      final mockEditProfileBloc = MockEditProfileBloc();
      when(mockEditProfileBloc.state).thenReturn(InitialEditProfileState());
      final mockPolisImagePicker = MockImagePicker();
      when(mockPolisImagePicker.getImage(source: ImageSource.camera))
          .thenAnswer(
              (_) => Future.value(PickedFile('assets/images/google.png')));
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
      final profile = find.byKey(profileContainerKey);
      expect(profile, findsOneWidget);
      await tester.tap(profile);
      await tester.pumpAndSettle();
      expect(find.byKey(photoUrlFileKey), findsOneWidget);
    });

    testWidgets('should validate and save the form', (tester) async {
      final mockEditProfileBloc = MockEditProfileBloc();
      when(mockEditProfileBloc.state).thenReturn(InitialEditProfileState());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<EditProfileBloc>(
            bloc: mockEditProfileBloc,
            page: EditProfilePage(
              imagePicker: MockImagePicker(),
            ),
          ),
        ),
      );
      final form = tester.widget(find.byType(Form)) as Form;
      final formKey = form.key as GlobalKey<FormState>;

      final nameField = find.byKey(editProfileNameFieldKey);
      final emailField = find.byKey(editProfileEmailFieldKey);

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
      when(mockEditProfileBloc.state).thenReturn(InitialEditProfileState());
      final mockPolisImagePicker = MockImagePicker();
      when(mockPolisImagePicker.getImage(source: ImageSource.camera))
          .thenAnswer(
              (_) => Future.value(PickedFile('assets/images/google.png')));
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<UserBloc>(
            bloc: mockUserBloc,
            page: PageConnected<EditProfileBloc>(
              bloc: mockEditProfileBloc,
              page: EditProfilePage(
                imagePicker: MockImagePicker(),
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
      when(mockEditProfileBloc.state).thenReturn(InitialEditProfileState());
      final mockPolisImagePicker = MockImagePicker();
      when(mockPolisImagePicker.getImage(source: ImageSource.camera))
          .thenAnswer(
              (_) => Future.value(PickedFile('assets/images/google.png')));
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<UserBloc>(
            bloc: mockUserBloc,
            page: PageConnected<EditProfileBloc>(
              bloc: mockEditProfileBloc,
              page: EditProfilePage(
                imagePicker: MockImagePicker(),
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
