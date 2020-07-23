import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/model/comment_model.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/keys.dart';
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
  MockCommentCubit mockCommentCubit;

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
      mockCommentCubit = MockCommentCubit();
    });

    testWidgets('should render proposta preview', (tester) async {
      when(mockCommentCubit.post).thenReturn(
        PropostaModel(
          id: '1',
          nomePolitico: 'nome',
          urlPartidoLogo: 'url',
          urlInteiroTeor: 'url',
        ),
      );
      when(mockCommentCubit.state).thenReturn(InitialCommentState());
      when(mockCommentCubit.postComments).thenReturn(postComments);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<CommentCubit>(
            bloc: mockCommentCubit,
            page: PostCommentsPage(),
          ),
        ),
      );
      expect(find.byType(PostPropostaConnected), findsOneWidget);
    });

    testWidgets('should render despesa preview', (tester) async {
      when(mockCommentCubit.post).thenReturn(
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
      when(mockCommentCubit.state).thenReturn(InitialCommentState());
      when(mockCommentCubit.postComments).thenReturn(postComments);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<CommentCubit>(
            bloc: mockCommentCubit,
            page: PostCommentsPage(),
          ),
        ),
      );
      expect(find.byType(PostDespesaConnected), findsOneWidget);
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<CommentCubit>(
            bloc: mockCommentCubit,
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
      when(mockCommentCubit.state).thenReturn(InitialCommentState());
      when(mockCommentCubit.postComments).thenReturn(postComments);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<CommentCubit>(
            bloc: mockCommentCubit,
            page: PostCommentsPage(),
          ),
        ),
      );
    });

    testWidgets('should show comments when state is GetPostCommentsSuccess',
        (tester) async {
      when(mockCommentCubit.state).thenReturn(
        GetPostCommentsSuccess(
          comments: postComments,
        ),
      );
      when(mockCommentCubit.postComments).thenReturn(postComments);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<CommentCubit>(
            bloc: mockCommentCubit,
            page: PostCommentsPage(),
          ),
        ),
      );
    });

    testWidgets('should show comments when state is NewCommentAdded',
        (tester) async {
      when(mockCommentCubit.state).thenReturn(
        NewCommentAdded(
          comment: CommentModel(),
          numberOfComments: 1,
        ),
      );
      when(mockCommentCubit.postComments).thenReturn(postComments);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<CommentCubit>(
            bloc: mockCommentCubit,
            page: PostCommentsPage(),
          ),
        ),
      );
    });

    testWidgets('should show comments when state is CommentDeletedSuccess',
        (tester) async {
      when(mockCommentCubit.state).thenReturn(
        CommentDeletedSuccess(
          comment: CommentModel(),
          numberOfComments: 0,
        ),
      );
      when(mockCommentCubit.postComments).thenReturn(postComments);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<CommentCubit>(
            bloc: mockCommentCubit,
            page: PostCommentsPage(),
          ),
        ),
      );
    });

    testWidgets('should show comments when state is NewSubCommentAdded',
        (tester) async {
      when(mockCommentCubit.state).thenReturn(
        NewSubCommentAdded(
          comment: CommentModel(),
          numberOfSubComments: 1,
        ),
      );
      when(mockCommentCubit.postComments).thenReturn(postComments);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<CommentCubit>(
            bloc: mockCommentCubit,
            page: PostCommentsPage(),
          ),
        ),
      );
    });

    testWidgets('should show comments when state is InitialCommentState',
        (tester) async {
      when(mockCommentCubit.state).thenReturn(InitialCommentState());
      when(mockCommentCubit.postComments).thenReturn(postComments);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<CommentCubit>(
            bloc: mockCommentCubit,
            page: PostCommentsPage(),
          ),
        ),
      );
    });

    testWidgets(
        '''should show comments and edit container when state is EditingCommentStarted''',
        (tester) async {
      when(mockCommentCubit.state).thenReturn(
        EditingCommentStarted(
          CommentModel(
            usuarioNome: 'nome',
            texto: 'texto',
          ),
        ),
      );
      when(mockCommentCubit.postComments).thenReturn(postComments);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<CommentCubit>(
            bloc: mockCommentCubit,
            page: PostCommentsPage(),
          ),
        ),
      );
      expect(find.byType(EditCommentContainer), findsOneWidget);
      final stopEditingBtn = find.byKey(stopEditingCommentKey);
      expect(stopEditingBtn, findsOneWidget);
      await tester.tap(stopEditingBtn);
      verify(mockCommentCubit.stopEditingComment()).called(1);
    });

    testWidgets('should add a comment', (tester) async {
      final comment = CommentModel(
        usuarioNome: 'nome',
        texto: 'texto',
      );
      when(mockCommentCubit.state).thenReturn(
        EditingCommentStarted(comment),
      );
      when(mockCommentCubit.postComments).thenReturn(postComments);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<CommentCubit>(
            bloc: mockCommentCubit,
            page: PostCommentsPage(),
          ),
        ),
      );
      final addCommentBtn = find.byKey(commentButtonKey);
      expect(addCommentBtn, findsOneWidget);
      await tester.tap(addCommentBtn);
      verify(
        mockCommentCubit.editComment(
          comment: comment,
          newText: 'texto',
        ),
      ).called(1);
    });

    testWidgets('should show comments when state is CommentEditedSuccess',
        (tester) async {
      when(mockCommentCubit.state).thenReturn(
        CommentEditedSuccess(
          comment: CommentModel(),
        ),
      );
      when(mockCommentCubit.postComments).thenReturn(postComments);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<CommentCubit>(
            bloc: mockCommentCubit,
            page: PostCommentsPage(),
          ),
        ),
      );
    });
  });
}
