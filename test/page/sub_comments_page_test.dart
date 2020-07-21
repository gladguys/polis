import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/repository/abstract/repositories.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/page/post/comments/widget/edit_sub_comment_container.dart';

import '../mock.dart';
import '../utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    const channel = MethodChannel('plugins.flutter.io/firebase_performance');
    channel.setMockMethodCallHandler((methodCall) async => true);
    initLocator(MockSharedPreferences());
    initializeDateFormatting('pt_BR', null);
  });

  List<SubCommentModel> subComments;
  MockSubCommentsBloc mockSubCommentsBloc;
  MockCommentBloc mockCommentBloc;

  group('PostCommentsPage tests', () {
    setUp(() {
      mockCommentBloc = MockCommentBloc();
      subComments = [
        SubCommentModel(
          id: 1,
          texto: 'texto1',
          usuarioNome: 'nome',
          diaHora: DateTime.now(),
          comentarioPaiId: 1,
        ),
        SubCommentModel(
          id: 2,
          texto: 'texto2',
          usuarioNome: 'nome2',
          diaHora: DateTime.now(),
          comentarioPaiId: 1,
        ),
      ];
      mockSubCommentsBloc = MockSubCommentsBloc();
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SubCommentsBloc>(
            bloc: mockSubCommentsBloc,
            page: SubCommentsPage(),
          ),
        ),
      );
    });

    testWidgets('should build without exploding with dark mode',
        (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SubCommentsBloc>(
            bloc: mockSubCommentsBloc,
            page: SubCommentsPage(),
          ),
          useDarkMode: true,
        ),
      );
    });

    testWidgets('should build connected without exploding', (tester) async {
      final mockCommentRepository = MockCommentRepository();
      when(mockCommentRepository.getCommentSubComments(commentId: 1))
          .thenAnswer(
        (_) => Future.value(
          [
            SubCommentModel(
              id: 1,
              texto: 'texto',
            ),
          ],
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          SubCommentsPageConnected(
            post: PropostaModel(
              id: '1',
              nomePolitico: 'nome',
              urlPartidoLogo: 'url',
              urlInteiroTeor: 'url',
            ),
            comment: CommentModel(
              id: 1,
              texto: 'texto',
              usuarioNome: 'nome',
              diaHora: DateTime.now(),
            ),
            commentBloc: mockCommentBloc,
          ),
          extraProviders: [
            RepositoryProvider<CommentRepository>(
              create: (_) => mockCommentRepository,
            ),
          ],
        ),
      );
    });

    testWidgets('should build editing container', (tester) async {
      when(mockSubCommentsBloc.comment).thenReturn(
        CommentModel(
          id: 1,
          diaHora: DateTime.now(),
          texto: 'texto',
          usuarioNome: 'nome',
          usuarioId: '1',
          qntSubComentarios: 2,
          foiEditado: false,
        ),
      );
      when(mockSubCommentsBloc.subComments).thenReturn(subComments);
      when(mockSubCommentsBloc.state).thenReturn(
        EditingSubCommentStarted(
          SubCommentModel(
            id: 1,
            usuarioNome: 'nome',
            texto: 'texto',
            diaHora: DateTime.now(),
            comentarioPaiId: 1,
          ),
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SubCommentsBloc>(
            bloc: mockSubCommentsBloc,
            page: SubCommentsPage(),
          ),
        ),
      );
      expect(find.byType(EditSubCommentContainer), findsOneWidget);
    });
  });
}
