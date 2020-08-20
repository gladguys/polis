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
        CommentModel(
          id: 1,
          texto: 'first text',
          usuarioNome: 'user',
          diaHora: DateTime.now(),
        ),
        CommentModel(
          id: 2,
          texto: 'second text',
          usuarioNome: 'user2',
          diaHora: DateTime.now(),
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
            page: PostCommentsPage(),
          )),
        ),
      );
      expect(find.byType(CommentTile), findsNWidgets(2));
    });

    testWidgets('should write a comment on the text field', (tester) async {
      final mockComments = [
        CommentModel(
          id: 1,
          texto: 'first text',
          usuarioNome: 'user',
          diaHora: DateTime.now(),
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
              page: PostCommentsPage(),
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
