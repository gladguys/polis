import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/keys.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/user_following_politics/widget/following_politics_search.dart';

import '../mock.dart';
import '../utils.dart';

void main() {
  group('FollowingPoliticsSearch tests', () {
    testWidgets('build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<UserProfileBloc>(
            bloc: MockUserProfileBloc(),
            page: BlocProvider.value(
              value: UserFollowingPoliticsBloc(
                userFollowingPoliticsRepository:
                    MockUserFollowingPoliticsRepository(),
                followRepository: MockFollowRepository(),
              ),
              child: Scaffold(
                body: FollowingPoliticsSearch(
                  [
                    PoliticoModel(id: '1', nomeEleitoral: 'nome'),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });

    testWidgets('typing on textfield thrigger blocs method', (tester) async {
      final mockUserFollowingPoliticsBloc = MockUserFollowingPoliticsBloc();
      when(mockUserFollowingPoliticsBloc.isPoliticBeingFollowed(any))
          .thenReturn(false);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<UserProfileBloc>(
            bloc: MockUserProfileBloc(),
            page: BlocProvider<UserFollowingPoliticsBloc>(
              create: (_) => mockUserFollowingPoliticsBloc,
              child: Scaffold(
                body: FollowingPoliticsSearch(
                  [
                    PoliticoModel(id: '1', nomeEleitoral: 'nome'),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
      final searchTextfield = find.byKey(searchTextfieldKey).first;
      expect(searchTextfield, findsOneWidget);
      await tester.enterText(searchTextfield, 'teste');
      verify(mockUserFollowingPoliticsBloc.add(SearchPoliticsByTerm('teste')))
          .called(1);
    });
  });
}
