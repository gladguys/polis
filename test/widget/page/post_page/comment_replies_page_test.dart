import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/i18n/i18n.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/widget/field_rounded.dart';

import '../../../mock.dart';
import '../../../utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    initializeDateFormatting('pt_BR', null);
  });

  group('CommentRepliesPage tests', () {
    testWidgets('should build without exploding', (tester) async {
      final mockCommentBloc = MockCommentBloc();
      await tester.pumpWidget(
        connectedWidget(
          CommentRepliesPageConnected(
            post: PropostaModel(
              id: '1',
            ),
            comment: CommentModel(),
            commentBloc: mockCommentBloc,
          ),
        ),
      );
    });

    testWidgets('should show replies', (tester) async {
      final mockCommentRepliesBloc = MockCommentRepliesBloc();
      final mockCommentBloc = MockCommentBloc();
      when(mockCommentRepliesBloc.commentBloc)
          .thenAnswer((_) => mockCommentBloc);
      when(mockCommentRepliesBloc.commentReplies).thenReturn([
        CommentModel(
          id: '1',
          texto: 'a reply',
        ),
      ]);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<CommentRepliesBloc>(
            bloc: mockCommentRepliesBloc,
            page: CommentRepliesPage(),
          ),
        ),
      );
    });

    testWidgets('should write a comment on the textfield', (tester) async {
      final mockCommentRepliesBloc = MockCommentRepliesBloc();
      final mockCommentBloc = MockCommentBloc();
      when(mockCommentRepliesBloc.commentBloc)
          .thenAnswer((_) => mockCommentBloc);
      when(mockCommentRepliesBloc.comment).thenReturn(CommentModel(
        id: '1',
        texto: 'a comment',
      ));
      when(mockCommentRepliesBloc.commentReplies).thenReturn([
        CommentModel(
          id: '2',
          texto: 'a reply',
        ),
      ]);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<CommentRepliesBloc>(
            bloc: mockCommentRepliesBloc,
            page: CommentRepliesPage(),
          ),
        ),
      );

      final textField = find.byType(FieldRounded);
      expect(textField, findsOneWidget);
      final commentBtn = find.text(SEND);
      expect(commentBtn, findsOneWidget);
      await tester.tap(commentBtn);
      verify(
        mockCommentRepliesBloc.add(
          AddReplyComment(
            commentReplied: CommentModel(
              id: '1',
              texto: 'a comment',
            ),
            text: '',
          ),
        ),
      );
    });
  });
}
