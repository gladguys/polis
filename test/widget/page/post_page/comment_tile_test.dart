import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/keys.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/post/comments/widget/comment_tile.dart';

import '../../../mock.dart';
import '../../../utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    initializeDateFormatting('pt_BR', null);
  });

  group('description', () {
    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          CommentTile(
            CommentModel(
              id: 1,
              texto: 'texto',
              usuarioNome: 'user',
            ),
          ),
          withScaffold: true,
        ),
      );
    });

    testWidgets('should go to replies page when click on comments',
        (tester) async {
      final mockCommentBloc = MockCommentBloc();
      when(mockCommentBloc.post).thenReturn(
        PropostaModel(
          id: '1',
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<CommentBloc>(
            bloc: mockCommentBloc,
            page: CommentTile(
              CommentModel(
                id: 1,
                texto: 'texto',
                usuarioNome: 'user',
              ),
            ),
          ),
          withScaffold: true,
        ),
      );
      final comments = find.byKey(commentsKey);
      await tester.tap(comments);
      await tester.pumpAndSettle();
      verify(mockObserver.didPush(any, any));
    });
  });
}
