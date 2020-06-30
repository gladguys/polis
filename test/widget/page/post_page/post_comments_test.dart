import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/i18n/i18n.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/page/post/comments/widget/comment_tile.dart';
import 'package:polis/widget/field_rounded.dart';

import '../../../mock.dart';
import '../../../utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    initializeDateFormatting('pt_BR', null);
  });

  group('PostComments tests', () {
    testWidgets('should show post comments', (tester) async {
      final mockComments = [
        CommentModel(id: '1', texto: 'first text', respostas: [
          CommentModel(
            id: '3',
            texto: 'reply 1',
          ),
          CommentModel(
            id: '4',
            texto: 'reply 2',
          ),
        ]),
        CommentModel(
          id: '2',
          texto: 'second text',
        ),
      ];
      final mockCommentBloc = MockCommentBloc();
      when(mockCommentBloc.postComments).thenReturn(mockComments);
      when(mockCommentBloc.state).thenReturn(
        GetPostCommentsSuccess(
          comments: mockComments,
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          Scaffold(
              body: PageConnected<CommentBloc>(
            bloc: mockCommentBloc,
            page: PostComments(),
          )),
        ),
      );
      expect(find.byType(CommentTile), findsNWidgets(2));
    });

    testWidgets('should write a comment on the text field', (tester) async {
      final mockComments = [
        CommentModel(
          id: '1',
          texto: 'first text',
        ),
      ];
      final mockCommentBloc = MockCommentBloc();
      when(mockCommentBloc.postComments).thenReturn(mockComments);
      when(mockCommentBloc.state).thenReturn(
        GetPostCommentsSuccess(
          comments: mockComments,
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          Scaffold(
            body: PageConnected<CommentBloc>(
              bloc: mockCommentBloc,
              page: PostComments(),
            ),
          ),
        ),
      );
      final textField = find.byType(FieldRounded);
      expect(textField, findsOneWidget);
      final commentBtn = find.text(SEND);
      expect(commentBtn, findsOneWidget);
      await tester.tap(commentBtn);
      verify(
        mockCommentBloc.add(
          AddComment(text: ''),
        ),
      );
    });
  });
}
