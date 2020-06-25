import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/i18n/i18n.dart';
import 'package:polis/core/keys.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/widget/loading.dart';

import '../mock.dart';
import '../utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ChangePasswordPage tests', () {
    testWidgets('should build without exploding', (tester) async {
      final mockChangePasswordBloc = MockChangePasswordBloc();
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<MockChangePasswordBloc>(
            bloc: mockChangePasswordBloc,
            page: ChangePasswordPageConnected(),
          ),
        ),
      );
    });

    testWidgets('should show loading', (tester) async {
      final mockChangePasswordBloc = MockChangePasswordBloc();
      when(mockChangePasswordBloc.state).thenReturn(UserPasswordChanging());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<ChangePasswordBloc>(
            bloc: mockChangePasswordBloc,
            page: ChangePasswordPage(),
          ),
        ),
      );
      expect(find.byType(Loading), findsOneWidget);
    });

    testWidgets('should show snackbar when success', (tester) async {
      final mockChangePasswordBloc = MockChangePasswordBloc();
      whenListen(
        mockChangePasswordBloc,
        Stream.fromIterable(
          [
            UserWrongPasswordInformed(),
            UserPasswordChangeSuccess(),
          ],
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<ChangePasswordBloc>(
            bloc: mockChangePasswordBloc,
            page: ChangePasswordPage(),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final snackSuccess = find.text(USER_PASSWORD_UPDATED_WITH_SUCCESS);
      expect(snackSuccess, findsOneWidget);
    });

    testWidgets('should show snackbar when fail', (tester) async {
      final mockChangePasswordBloc = MockChangePasswordBloc();
      whenListen(
        mockChangePasswordBloc,
        Stream.fromIterable(
          [
            UserWrongPasswordInformed(),
            UserPasswordChangeFailed(),
          ],
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<ChangePasswordBloc>(
            bloc: mockChangePasswordBloc,
            page: ChangePasswordPage(),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final snackSuccess = find.text(USER_UPDATE_PASSWORD_FAILED);
      expect(snackSuccess, findsOneWidget);
    });

    testWidgets('should show snackbar when wrong password is given',
        (tester) async {
      final mockChangePasswordBloc = MockChangePasswordBloc();
      whenListen(
        mockChangePasswordBloc,
        Stream.fromIterable(
          [
            UserPasswordChangeFailed(),
            UserWrongPasswordInformed(),
          ],
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<ChangePasswordBloc>(
            bloc: mockChangePasswordBloc,
            page: ChangePasswordPage(),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final snackSuccess = find.text(USER_UPDATE_PASSWORD_WRONG_PASSWORD);
      expect(snackSuccess, findsOneWidget);
    });

    testWidgets('should validate and save the form', (tester) async {
      final mockChangePasswordBloc = MockChangePasswordBloc();
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<ChangePasswordBloc>(
            bloc: mockChangePasswordBloc,
            page: ChangePasswordPage(),
          ),
        ),
      );
      final form = tester.widget(find.byType(Form)) as Form;
      final formKey = form.key as GlobalKey<FormState>;

      final currentPasswordField = find.byKey(currentPasswordFieldKey);
      final newPasswordField = find.byKey(newPasswordFieldKey);
      final newPasswordConfirmationField =
          find.byKey(newPasswordConfirmationFieldKey);

      await tester.enterText(currentPasswordField, '123456');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.enterText(newPasswordField, '12345678');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.enterText(newPasswordConfirmationField, '12345678');
      await tester.pump();

      final confirmBtn = find.text(CONFIRM);
      await tester.tap(confirmBtn);
      await tester.pumpAndSettle();
      expect(formKey.currentState.validate(), isTrue);
      verify(
        mockChangePasswordBloc.add(
          ChangeUserPassword(
            currentPassword: '123456',
            newPassword: '12345678',
          ),
        ),
      ).called(1);
    });

    testWidgets(
        'should validate form when passwords confirmations are not equal',
        (tester) async {
      final mockChangePasswordBloc = MockChangePasswordBloc();
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<ChangePasswordBloc>(
            bloc: mockChangePasswordBloc,
            page: ChangePasswordPage(),
          ),
        ),
      );
      final form = tester.widget(find.byType(Form)) as Form;
      final formKey = form.key as GlobalKey<FormState>;

      final currentPasswordField = find.byKey(currentPasswordFieldKey);
      final newPasswordField = find.byKey(newPasswordFieldKey);
      final newPasswordConfirmationField =
          find.byKey(newPasswordConfirmationFieldKey);

      await tester.enterText(currentPasswordField, '123456');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.enterText(newPasswordField, '12345678');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.enterText(newPasswordConfirmationField, '1234567');
      await tester.pump();

      final confirmBtn = find.text(CONFIRM);
      await tester.tap(confirmBtn);
      await tester.pumpAndSettle();
      expect(formKey.currentState.validate(), isFalse);
      verifyNever(
        mockChangePasswordBloc.add(
          ChangeUserPassword(
            currentPassword: '123456',
            newPassword: '12345678',
          ),
        ),
      );
    });

    testWidgets('should validate form when passwords is not 6 caracters long',
        (tester) async {
      final mockChangePasswordBloc = MockChangePasswordBloc();
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<ChangePasswordBloc>(
            bloc: mockChangePasswordBloc,
            page: ChangePasswordPage(),
          ),
        ),
      );
      final form = tester.widget(find.byType(Form)) as Form;
      final formKey = form.key as GlobalKey<FormState>;

      final currentPasswordField = find.byKey(currentPasswordFieldKey);
      final newPasswordField = find.byKey(newPasswordFieldKey);
      final newPasswordConfirmationField =
          find.byKey(newPasswordConfirmationFieldKey);

      await tester.enterText(currentPasswordField, '12345');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.enterText(newPasswordField, '12345678');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.enterText(newPasswordConfirmationField, '1234567');
      await tester.pump();

      final confirmBtn = find.text(CONFIRM);
      await tester.tap(confirmBtn);
      await tester.pumpAndSettle();
      expect(formKey.currentState.validate(), isFalse);
      verifyNever(
        mockChangePasswordBloc.add(
          ChangeUserPassword(
            currentPassword: '123456',
            newPassword: '12345678',
          ),
        ),
      );
    });
  });
}
