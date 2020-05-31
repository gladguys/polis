import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/page/user_profile/widget/politics_following_quantity.dart';

import '../mock.dart';
import '../utils.dart';

void main() {
  group('PoliticsFollowingQuantity tests', () {
    testWidgets('should go to UserFollowingPoliticsPage when click quantity',
        (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          Scaffold(
            body: BlocProvider.value(
              value: UserBloc(
                user: UserModel(userId: '1'),
                repository: MockUserRepository(),
                analyticsService: MockAnalyticsService(),
                sharedPreferencesService: MockSharedPreferencesService(),
              ),
              child: PoliticsFollowingQuantity(
                politics: [],
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final qtdButton = find.byType(InkWell);
      expect(qtdButton, findsOneWidget);
      await tester.tap(qtdButton);
      verify(mockObserver.didPush(any, any));
    });
  });
}
