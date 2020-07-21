import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/comment_model.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/repository/abstract/repositories.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/page/post/comments/widget/edit_comment_container.dart';
import 'package:polis/widget/post/post_despesa_connected.dart';
import 'package:polis/widget/post/post_proposta_connected.dart';

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

  List<CommentModel> postComments;
  MockCommentBloc mockCommentBloc;

  group('PostCommentsPage tests', () {
    setUp(() {
      postComments = [
        CommentModel(
          id: 1,
          texto: 'texto1',
          usuarioNome: 'nome',
          diaHora: DateTime.now(),
        ),
        CommentModel(
          id: 2,
          texto: 'texto2',
          usuarioNome: 'nome2',
          diaHora: DateTime.now(),
        ),
      ];
      mockCommentBloc = MockCommentBloc();
    });

    testWidgets('should render proposta preview', (tester) async {
      when(mockCommentBloc.post).thenReturn(
        PropostaModel(
          id: '1',
          nomePolitico: 'nome',
          urlPartidoLogo: 'url',
          urlInteiroTeor: 'url',
        ),
      );
      when(mockCommentBloc.state).thenReturn(InitialCommentState());
      when(mockCommentBloc.postComments).thenReturn(postComments);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<CommentBloc>(
            bloc: mockCommentBloc,
            page: PostCommentsPage(),
          ),
        ),
      );
      expect(find.byType(PostPropostaConnected), findsOneWidget);
    });

    testWidgets('should render despesa preview', (tester) async {
      when(mockCommentBloc.post).thenReturn(
        DespesaModel(
          id: '1',
          nomePolitico: 'nome',
          urlPartidoLogo: 'url',
          tipoAtividade: 'tipo',
          tipoDespesa: 'tipoD',
          valorLiquido: '20.00',
          dataDocumento: '20-01-2020',
          visualizado: false,
        ),
      );
      when(mockCommentBloc.state).thenReturn(InitialCommentState());
      when(mockCommentBloc.postComments).thenReturn(postComments);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<CommentBloc>(
            bloc: mockCommentBloc,
            page: PostCommentsPage(),
          ),
        ),
      );
      expect(find.byType(PostDespesaConnected), findsOneWidget);
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<CommentBloc>(
            bloc: mockCommentBloc,
            page: PostCommentsPage(),
          ),
        ),
      );
    });

    testWidgets('should build connected without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PostCommentsPageConnected(
            post: PropostaModel(
              id: '1',
              nomePolitico: 'nome',
              urlPartidoLogo: 'url',
              urlInteiroTeor: 'url',
            ),
          ),
          extraProviders: [
            RepositoryProvider<CommentRepository>(
              create: (_) => MockCommentRepository(),
            ),
          ],
        ),
      );
    });

    test('assert', () {
      expect(
        () => PostCommentsPageConnected(
          post: null,
        ),
        throwsAssertionError,
      );
    });

    testWidgets('should show comments when state is InitialCommentState',
        (tester) async {
      when(mockCommentBloc.state).thenReturn(InitialCommentState());
      when(mockCommentBloc.postComments).thenReturn(postComments);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<CommentBloc>(
            bloc: mockCommentBloc,
            page: PostCommentsPage(),
          ),
        ),
      );
    });

    testWidgets('should show comments when state is GetPostCommentsSuccess',
        (tester) async {
      when(mockCommentBloc.state).thenReturn(
        GetPostCommentsSuccess(
          comments: postComments,
        ),
      );
      when(mockCommentBloc.postComments).thenReturn(postComments);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<CommentBloc>(
            bloc: mockCommentBloc,
            page: PostCommentsPage(),
          ),
        ),
      );
    });

    testWidgets('should show comments when state is NewCommentAdded',
        (tester) async {
      when(mockCommentBloc.state).thenReturn(
        NewCommentAdded(
          comment: CommentModel(),
          numberOfComments: 1,
        ),
      );
      when(mockCommentBloc.postComments).thenReturn(postComments);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<CommentBloc>(
            bloc: mockCommentBloc,
            page: PostCommentsPage(),
          ),
        ),
      );
    });

    testWidgets('should show comments when state is CommentDeletedSuccess',
        (tester) async {
      when(mockCommentBloc.state).thenReturn(
        CommentDeletedSuccess(
          comment: CommentModel(),
          numberOfComments: 0,
        ),
      );
      when(mockCommentBloc.postComments).thenReturn(postComments);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<CommentBloc>(
            bloc: mockCommentBloc,
            page: PostCommentsPage(),
          ),
        ),
      );
    });

    testWidgets('should show comments when state is NewSubCommentAdded',
        (tester) async {
      when(mockCommentBloc.state).thenReturn(
        NewSubCommentAdded(
          comment: CommentModel(),
          numberOfSubComments: 1,
        ),
      );
      when(mockCommentBloc.postComments).thenReturn(postComments);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<CommentBloc>(
            bloc: mockCommentBloc,
            page: PostCommentsPage(),
          ),
        ),
      );
    });

    testWidgets('should show comments when state is InitialCommentState',
        (tester) async {
      when(mockCommentBloc.state).thenReturn(InitialCommentState());
      when(mockCommentBloc.postComments).thenReturn(postComments);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<CommentBloc>(
            bloc: mockCommentBloc,
            page: PostCommentsPage(),
          ),
        ),
      );
    });

    testWidgets(
        '''should show comments and edit container when state is EditingCommentStarted''',
        (tester) async {
      when(mockCommentBloc.state).thenReturn(
        EditingCommentStarted(
          CommentModel(
            usuarioNome: 'nome',
            texto: 'texto',
          ),
        ),
      );
      when(mockCommentBloc.postComments).thenReturn(postComments);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<CommentBloc>(
            bloc: mockCommentBloc,
            page: PostCommentsPage(),
          ),
        ),
      );
      expect(find.byType(EditCommentContainer), findsOneWidget);
    });

    testWidgets('should show comments when state is CommentEditedSuccess',
        (tester) async {
      when(mockCommentBloc.state).thenReturn(
        CommentEditedSuccess(
          comment: CommentModel(),
        ),
      );
      when(mockCommentBloc.postComments).thenReturn(postComments);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<CommentBloc>(
            bloc: mockCommentBloc,
            page: PostCommentsPage(),
          ),
        ),
      );
    });
  });
}
