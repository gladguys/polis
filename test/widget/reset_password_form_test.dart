import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/i18n/i18n.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/signin/widget/reset_password_form.dart';

import '../mock.dart';
import '../utils.dart';

void main() {
  group('ResetPasswordForm tests', () {
    testWidgets('should validate and send bloc event', (tester) async {
      final mockSigninBloc = MockSigninBloc();
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SigninBloc>(
            bloc: mockSigninBloc,
            page: Scaffold(
              body: ResetPasswordForm(),
            ),
          ),
        ),
      );
      final form = tester.widget(find.byType(Form)) as Form;
      final formKey = form.key as GlobalKey<FormState>;

      final emailField = find.byType(TextFormField);
      await tester.enterText(emailField, 'test@gmail.com');
      await tester.pump();
      expect(formKey.currentState.validate(), isTrue);

      final sendButton = find.text(CONFIRM);
      expect(sendButton, findsOneWidget);
      await tester.tap(sendButton);
      verify(mockSigninBloc.add(SendResetPasswordEmail('test@gmail.com')))
          .called(1);
    });
  });
}
