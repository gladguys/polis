import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/keys.dart';
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
  MockSubCommentsCubit mockSubCommentsCubit;
  MockCommentCubit mockCommentCubit;

  group('PostCommentsPage tests', () {
    setUp(() {
      mockCommentCubit = MockCommentCubit();
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
      mockSubCommentsCubit = MockSubCommentsCubit();
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SubCommentsCubit>(
            bloc: mockSubCommentsCubit,
            page: SubCommentsPage(),
          ),
        ),
      );
    });

    testWidgets('should build without exploding with dark mode',
        (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SubCommentsCubit>(
            bloc: mockSubCommentsCubit,
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
            commentCubit: mockCommentCubit,
          ),
          extraProviders: [
            RepositoryProvider<CommentRepository>(
              create: (_) => mockCommentRepository,
            ),
          ],
        ),
      );
    });

    testWidgets(
        '''should show sub comments and edit container when state is EditingSubCommentStarted''',
        (tester) async {
      when(mockSubCommentsCubit.comment).thenReturn(
        CommentModel(
          id: 1,
          usuarioNome: 'nome',
          texto: 'texto',
          diaHora: DateTime.now(),
        ),
      );
      when(mockSubCommentsCubit.state).thenReturn(
        EditingSubCommentStarted(
          SubCommentModel(
            usuarioNome: 'nome',
            texto: 'texto',
          ),
        ),
      );
      when(mockSubCommentsCubit.subComments).thenReturn(subComments);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SubCommentsCubit>(
            bloc: mockSubCommentsCubit,
            page: SubCommentsPage(),
          ),
        ),
      );
      expect(find.byType(EditSubCommentContainer), findsOneWidget);
      final stopEditingBtn = find.byKey(stopEditingCommentKey);
      expect(stopEditingBtn, findsOneWidget);
      await tester.tap(stopEditingBtn);
      verify(mockSubCommentsCubit.stopEditingSubComment()).called(1);
    });

    testWidgets('should add a sub comment', (tester) async {
      when(mockSubCommentsCubit.comment).thenReturn(
        CommentModel(
          id: 1,
          usuarioNome: 'nome',
          texto: 'texto',
          diaHora: DateTime.now(),
        ),
      );
      final subComment = SubCommentModel(
        usuarioNome: 'nome',
        texto: 'texto',
        diaHora: DateTime.now(),
      );
      when(mockSubCommentsCubit.state).thenReturn(
        EditingSubCommentStarted(subComment),
      );
      when(mockSubCommentsCubit.subComments).thenReturn(subComments);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SubCommentsCubit>(
            bloc: mockSubCommentsCubit,
            page: SubCommentsPage(),
          ),
        ),
      );
      final addCommentBtn = find.byKey(commentButtonKey);
      expect(addCommentBtn, findsOneWidget);
      await tester.tap(addCommentBtn);
      verify(
        mockSubCommentsCubit.editSubComment(
          subComment: subComment,
          newText: 'texto',
        ),
      ).called(1);
    });

    testWidgets('should build editing container', (tester) async {
      when(mockSubCommentsCubit.comment).thenReturn(
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
      when(mockSubCommentsCubit.subComments).thenReturn(subComments);
      when(mockSubCommentsCubit.state).thenReturn(
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
          PageConnected<SubCommentsCubit>(
            bloc: mockSubCommentsCubit,
            page: SubCommentsPage(),
          ),
        ),
      );
      expect(find.byType(EditSubCommentContainer), findsOneWidget);
    });
  });
}
