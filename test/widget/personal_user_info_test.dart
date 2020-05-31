import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/i18n/i18n.dart';
import 'package:polis/page/user_profile/widget/personal_user_info.dart';

import '../utils.dart';

void main() {
  group('PersonalUserInfo tests', () {
    testWidgets('should go to edit profile when click button', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PersonalUserInfo(
            user: UserModel(
              userId: '1',
              name: 'name',
              email: 'email',
              photoUrl: 'photo',
            ),
          ),
        ),
      );
      final editButton = find.text(EDIT_PROFILE);
      expect(editButton, findsOneWidget);
      await tester.tap(editButton);
      verify(mockObserver.didPush(any, any));
    });

    testWidgets('should show default icon when user dont have image',
        (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PersonalUserInfo(
            user: UserModel(
              userId: '1',
              name: 'name',
              email: 'email',
            ),
          ),
        ),
      );
      expect(find.byType(FaIcon), findsOneWidget);
    });
  });
}
