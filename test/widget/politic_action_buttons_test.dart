import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/politic_profile/widget/politic_action_buttons.dart';

import '../mock.dart';
import 'utils.dart';

void main() {
  MockPoliticProfileBloc mockPoliticProfileBloc;

  group('PoliticAdditionalInfo tests', () {
    setUp(() {
      mockPoliticProfileBloc = MockPoliticProfileBloc();
    });

    test('assert', () {
      expect(() => PoliticActionButtons(isBeingFollowedByUser: null),
          throwsAssertionError);
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProfileBloc>(
            bloc: mockPoliticProfileBloc,
            page: Scaffold(
              body: PoliticActionButtons(isBeingFollowedByUser: true),
            ),
          ),
        ),
      );
    });

    testWidgets('should follow politic when clicking', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProfileBloc>(
            bloc: mockPoliticProfileBloc,
            page: Scaffold(
              body: PoliticActionButtons(isBeingFollowedByUser: true),
            ),
          ),
        ),
      );
      final followPoliticButton =
          find.byKey(const ValueKey('follow-politic-profile')).first;
      expect(followPoliticButton, findsOneWidget);
      await tester.tap(followPoliticButton);
      await tester.pump();
    });

    testWidgets('should send email when clicking', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProfileBloc>(
            bloc: mockPoliticProfileBloc,
            page: Scaffold(
              body: PoliticActionButtons(isBeingFollowedByUser: true),
            ),
          ),
        ),
      );
      final sendEmailButton = find.byKey(const ValueKey('send-email-btn'));
      expect(sendEmailButton, findsOneWidget);
      await tester.tap(sendEmailButton);
      await tester.pump();
    });
  });
}
