import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/keys.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/politic_profile/widget/politic_action_buttons.dart';
import 'package:polis/widget/button_follow_unfollow.dart';

import '../mock.dart';
import '../utils.dart';

void main() {
  MockPoliticProfileBloc mockPoliticProfileBloc;

  group('PoliticAdditionalInfo tests', () {
    setUp(() {
      mockPoliticProfileBloc = MockPoliticProfileBloc();
    });

    test('assert', () {
      expect(
          () =>
              PoliticActionButtons(politico: null, isBeingFollowedByUser: true),
          throwsAssertionError);
      expect(
          () => PoliticActionButtons(
              politico: PoliticoModel(), isBeingFollowedByUser: null),
          throwsAssertionError);
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProfileBloc>(
            bloc: mockPoliticProfileBloc,
            page: Scaffold(
              body: PoliticActionButtons(
                  politico: PoliticoModel(), isBeingFollowedByUser: true),
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
              body: PoliticActionButtons(
                  politico: PoliticoModel(), isBeingFollowedByUser: true),
            ),
          ),
        ),
      );
      final followPoliticButton = find.byKey(followPoliticProfileKey).first;
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
              body: PoliticActionButtons(
                  politico: PoliticoModel(), isBeingFollowedByUser: true),
            ),
          ),
        ),
      );
      final sendEmailButton = find.byKey(sendEmailButtonKey);
      expect(sendEmailButton, findsOneWidget);
      await tester.tap(sendEmailButton);
      await tester.pump();
      verify(mockPoliticProfileBloc.add(SendEmailToPolitic())).called(1);
    });

    testWidgets('should call onUnfollowPolitic when is not null',
        (tester) async {
      var calledOnUnfollowPolitic = false;
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProfileBloc>(
            bloc: mockPoliticProfileBloc,
            page: Scaffold(
              body: PoliticActionButtons(
                politico: PoliticoModel(),
                isBeingFollowedByUser: true,
                onUnfollowPolitic: () => calledOnUnfollowPolitic = true,
              ),
            ),
          ),
        ),
      );
      final followUnfollowButton = find.byType(ButtonFollowUnfollow);
      expect(followUnfollowButton, findsOneWidget);
      await tester.tap(followUnfollowButton);
      await tester.pump();
      expect(calledOnUnfollowPolitic, true);
    });
  });
}
