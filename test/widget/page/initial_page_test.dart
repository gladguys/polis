import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/i18n/i18n.dart';
import 'package:polis/page/pages.dart';

import '../../mock.dart';
import '../utils.dart';

void main() {
  initLocator(MockSharedPreferences());

  group('InitialPage tests', () {
    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(connectedWidget(InitialPage()));
    });

    testWidgets('shuld go to signin page when click the button',
        (tester) async {
      await tester.pumpWidget(connectedWidget(InitialPage()));
      final signinWithEmailButton = find.text(SIGNIN_WITH_EMAIL);
      await tester.tap(signinWithEmailButton);
      await tester.pumpAndSettle();
      expect(find.byType(SigninPage), findsOneWidget);
    });

    testWidgets('shuld do something when signin with google', (tester) async {
      await tester.pumpWidget(connectedWidget(InitialPageConnected()));
      final signinWithGoogle = find.text(SIGNIN_WITH_GOOGLE);
      await tester.tap(signinWithGoogle);
      await tester.pumpAndSettle();
    });

    testWidgets('shuld go to signup page when click on no account button',
        (tester) async {
      await tester.pumpWidget(connectedWidget(InitialPage()));
      final noAccountButton = find.text(NO_ACCOUNT);
      await tester.tap(noAccountButton);
      await tester.pumpAndSettle();
    });
  });
}
