import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/repository/concrete/firebase/firebase.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/post/widget/like_post_button.dart';
import 'package:polis/widget/button_action_card.dart';

import '../../../mock.dart';
import '../../../utils.dart';

void main() {
  group('LikePostButton tests', () {
    testWidgets('should build without exploding', (tester) async {
      final mockUserBloc = MockUserBloc();
      when(mockUserBloc.user).thenReturn(
        UserModel(
          userId: '1',
        ),
      );
      final mockPostBloc = MockPostBloc();
      when(mockPostBloc.post).thenReturn({
        'id': '1',
        QTD_CURTIDAS_FIELD: 0,
      });
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<UserBloc>(
            bloc: mockUserBloc,
            page: PageConnected<PostBloc>(
              bloc: mockPostBloc,
              page: Scaffold(
                body: LikePostButton(
                  post: PropostaModel(id: '1'),
                ),
              ),
            ),
          ),
        ),
      );
    });

    testWidgets('should like when tap', (tester) async {
      final mockUserBloc = MockUserBloc();
      when(mockUserBloc.user).thenReturn(
        UserModel(
          userId: '1',
        ),
      );
      final mockPostBloc = MockPostBloc();
      when(mockPostBloc.post).thenReturn({
        'id': '1',
        'idPropostaPolitico': '1',
        QTD_CURTIDAS_FIELD: 0,
      });
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<UserBloc>(
            bloc: mockUserBloc,
            page: PageConnected<PostBloc>(
              bloc: mockPostBloc,
              page: Scaffold(
                body: LikePostButton(
                  post: PropostaModel(
                    id: '1',
                    idPropostaPolitico: '1',
                    idPoliticoAutor: '1',
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      final button = find.byType(ButtonActionCard);
      expect(button, findsOneWidget);
      await tester.tap(button);
      verify(
        mockPostBloc.add(
          LikePost(
            user: UserModel(
              userId: '1',
            ),
            postId: '1',
            politicoId: '1',
            isUnliked: false,
          ),
        ),
      ).called(1);
    });

    testWidgets('should stop liking already liked post when tap',
        (tester) async {
      final mockUserBloc = MockUserBloc();
      when(mockUserBloc.user).thenReturn(
        UserModel(userId: '1', userLikes: {
          '1': true,
        }),
      );
      final mockPostBloc = MockPostBloc();
      when(mockPostBloc.post).thenReturn({
        'id': '1',
        'idPropostaPolitico': '1',
        QTD_CURTIDAS_FIELD: 1,
      });
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<UserBloc>(
            bloc: mockUserBloc,
            page: PageConnected<PostBloc>(
              bloc: mockPostBloc,
              page: Scaffold(
                body: LikePostButton(
                  post: PropostaModel(
                    id: '1',
                    idPropostaPolitico: '1',
                    idPoliticoAutor: '1',
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      final button = find.byType(ButtonActionCard);
      expect(button, findsOneWidget);
      await tester.tap(button);
      verify(
        mockPostBloc.add(
          StopLikingPost(
            user: UserModel(
              userId: '1',
            ),
            postId: '1',
            politicoId: '1',
          ),
        ),
      ).called(1);
    });
  });
}
