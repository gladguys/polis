import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';

import '../mock.dart';

void main() {
  group('EditProfileBloc tests', () {
    SubCommentsBloc subCommentsBloc;
    MockCommentBloc mockCommentBloc;
    MockCommentRepository mockCommentRepository;

    setUp(() {
      mockCommentBloc = MockCommentBloc();
      when(mockCommentBloc.user).thenReturn(
        UserModel(
          userId: '1',
        ),
      );
      mockCommentRepository = MockCommentRepository();
      subCommentsBloc = SubCommentsBloc(
        post: PropostaModel(
          id: '1',
          idPropostaPolitico: '1',
        ),
        comment: CommentModel(
          id: 1,
        ),
        commentBloc: mockCommentBloc,
        repository: mockCommentRepository,
      );
    });

    tearDown(() {
      subCommentsBloc?.close();
    });

    test('asserts', () {
      expect(
          () => SubCommentsBloc(
                post: null,
                comment: CommentModel(),
                commentBloc: mockCommentBloc,
                repository: mockCommentRepository,
              ),
          throwsAssertionError);
      expect(
          () => SubCommentsBloc(
                post: PropostaModel(),
                comment: null,
                commentBloc: mockCommentBloc,
                repository: mockCommentRepository,
              ),
          throwsAssertionError);
      expect(
          () => SubCommentsBloc(
                post: PropostaModel(),
                comment: CommentModel(),
                commentBloc: null,
                repository: mockCommentRepository,
              ),
          throwsAssertionError);
      expect(
          () => SubCommentsBloc(
                post: PropostaModel(),
                comment: CommentModel(),
                commentBloc: mockCommentBloc,
                repository: null,
              ),
          throwsAssertionError);
    });

    test('''Expects InitialCommentRepliesState to be the initial state''', () {
      expect(subCommentsBloc.state, equals(InitialSubCommentsState()));
    });

    blocTest(
      '''Expects [LoadingPostComments, GetPostCommentsSuccess] when GetPostComments called''',
      build: () async {
        when(mockCommentRepository.saveSubComment(
                commentId: anyNamed('commentId'),
                subComment: anyNamed('subComment')))
            .thenAnswer(
          (_) => Future.value(
            SubCommentModel(
              texto: 'a reply',
            ),
          ),
        );
        return subCommentsBloc;
      },
      act: (commentBloc) async => commentBloc.add(
        AddSubComment(
          text: 'a reply',
        ),
      ),
      expect: [
        AddedSubCommentSuccess(
          subCommentAdded: SubCommentModel(
            texto: 'a reply',
          ),
          numberOfReplies: 1,
        ),
      ],
      verify: (commentBloc) async {
        verify(
          mockCommentBloc.add(
            UpdateCommentReplies(
              comment: CommentModel(
                id: 1,
              ),
              subComments: [
                SubCommentModel(texto: 'a reply'),
              ],
            ),
          ),
        );
      },
    );
  });
}
