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
    testWidgets('should show replies', (tester) async {
      final mockSubCommentsBloc = MockSubCommentsBloc();
      final mockCommentBloc = MockCommentBloc();
      when(mockSubCommentsBloc.commentBloc).thenAnswer((_) => mockCommentBloc);
      when(mockSubCommentsBloc.comment).thenReturn(
        CommentModel(
          postId: '1',
          texto: '1111',
          usuarioNome: 'nome',
        ),
      );
      when(mockSubCommentsBloc.subComments).thenReturn([
        SubCommentModel(
          id: 1,
          texto: 'a reply',
        ),
      ]);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SubCommentsBloc>(
            bloc: mockSubCommentsBloc,
            page: SubCommentsPage(),
          ),
        ),
      );
    });

    testWidgets('should write a comment on the textfield', (tester) async {
      final mockSubCommentsBloc = MockSubCommentsBloc();
      final mockCommentBloc = MockCommentBloc();
      when(mockSubCommentsBloc.state).thenReturn(
        GetCommentSubCommentsSuccess(
          [
            SubCommentModel(
              id: 2,
              texto: 'a reply',
              usuarioNome: 'nome',
              diaHora: DateTime.now(),
            ),
          ],
        ),
      );
      when(mockSubCommentsBloc.commentBloc).thenAnswer((_) => mockCommentBloc);
      when(mockSubCommentsBloc.comment).thenReturn(
        CommentModel(
          id: 1,
          texto: 'a comment',
          usuarioNome: 'nome',
          diaHora: DateTime.now(),
        ),
      );
      when(mockSubCommentsBloc.subComments).thenReturn(
        [
          SubCommentModel(
            id: 2,
            texto: 'a reply',
            usuarioNome: 'nome',
            diaHora: DateTime.now(),
          ),
        ],
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SubCommentsBloc>(
            bloc: mockSubCommentsBloc,
            page: SubCommentsPage(),
          ),
        ),
      );

      final textField = find.byType(FieldRounded);
      expect(textField, findsOneWidget);
      final commentBtn = find.text(SEND);
      expect(commentBtn, findsOneWidget);
      await tester.tap(commentBtn);
      verify(
        mockSubCommentsBloc.add(
          AddSubComment(
            text: '',
          ),
        ),
      );
    });
  });
}
