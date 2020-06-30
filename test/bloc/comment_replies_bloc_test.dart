import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';

import '../mock.dart';

void main() {
  group('EditProfileBloc tests', () {
    CommentRepliesBloc commentRepliesBloc;
    MockCommentBloc mockCommentBloc;
    MockCommentRepository mockCommentRepository;

    setUp(() {
      mockCommentBloc = MockCommentBloc();
      mockCommentRepository = MockCommentRepository();
      commentRepliesBloc = CommentRepliesBloc(
        post: PropostaModel(
          id: '1',
          idPropostaPolitico: '1',
        ),
        comment: CommentModel(
          id: '1',
          respostas: [],
        ),
        commentBloc: mockCommentBloc,
        repository: mockCommentRepository,
      );
    });

    tearDown(() {
      commentRepliesBloc?.close();
    });

    test('asserts', () {
      expect(
          () => CommentRepliesBloc(
                post: null,
                comment: CommentModel(),
                commentBloc: mockCommentBloc,
                repository: mockCommentRepository,
              ),
          throwsAssertionError);
      expect(
          () => CommentRepliesBloc(
                post: PropostaModel(),
                comment: null,
                commentBloc: mockCommentBloc,
                repository: mockCommentRepository,
              ),
          throwsAssertionError);
      expect(
          () => CommentRepliesBloc(
                post: PropostaModel(),
                comment: CommentModel(),
                commentBloc: null,
                repository: mockCommentRepository,
              ),
          throwsAssertionError);
      expect(
          () => CommentRepliesBloc(
                post: PropostaModel(),
                comment: CommentModel(),
                commentBloc: mockCommentBloc,
                repository: null,
              ),
          throwsAssertionError);
    });

    test('''Expects InitialCommentRepliesState to be the initial state''', () {
      expect(commentRepliesBloc.state, equals(InitialCommentRepliesState()));
    });

    blocTest(
      '''Expects [LoadingPostComments, GetPostCommentsSuccess] when GetPostComments called''',
      build: () async => commentRepliesBloc,
      act: (commentBloc) async => commentBloc.add(
        AddReplyComment(
          text: 'a reply',
          commentReplied: CommentModel(
            id: '1',
            respostas: [],
          ),
        ),
      ),
      expect: [
        AddedReplyCommentSuccess(
          replyCommentAdded: CommentModel(
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
                id: '1',
              ),
              replies: [CommentModel(texto: 'a reply')],
            ),
          ),
        );
      },
    );
  });
}
