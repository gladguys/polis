import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';

import '../mock.dart';

void main() {
  group('EditProfileBloc tests', () {
    CommentBloc commentBloc;
    MockCommentRepository mockCommentRepository;

    setUp(() {
      mockCommentRepository = MockCommentRepository();
      commentBloc = CommentBloc(
        post: PropostaModel(
          id: '1',
          idPropostaPolitico: '1',
        ),
        user: UserModel(),
        repository: mockCommentRepository,
      );
    });

    tearDown(() {
      commentBloc?.close();
    });

    test('asserts', () {
      expect(
          () => CommentBloc(
                post: null,
                user: UserModel(),
                repository: mockCommentRepository,
              ),
          throwsAssertionError);
      expect(
          () => CommentBloc(
                post: PropostaModel(),
                user: null,
                repository: mockCommentRepository,
              ),
          throwsAssertionError);
      expect(
          () => CommentBloc(
                post: PropostaModel(),
                user: UserModel(),
                repository: null,
              ),
          throwsAssertionError);
    });

    test('''Expects InitialCommentState to be the initial state''', () {
      expect(commentBloc.state, equals(InitialCommentState()));
    });

    blocTest(
      '''Expects [LoadingPostComments, GetPostCommentsSuccess] when GetPostComments called''',
      build: () async {
        when(mockCommentRepository.getPostComments(postId: '1'))
            .thenAnswer((_) => Future.value([]));
        return commentBloc;
      },
      act: (commentBloc) async => commentBloc.add(
        GetPostComments(postId: '1'),
      ),
      expect: [
        LoadingPostComments(),
        GetPostCommentsSuccess(
          comments: [],
        ),
      ],
    );

    blocTest(
      '''Expects [LoadingPostComments, GetPostCommentsFailed] when fails''',
      build: () async {
        when(mockCommentRepository.getPostComments(postId: '1'))
            .thenThrow(Exception());
        return commentBloc;
      },
      act: (commentBloc) async => commentBloc.add(
        GetPostComments(postId: '1'),
      ),
      expect: [
        LoadingPostComments(),
        GetPostCommentsFailed(),
      ],
      verify: (commentBloc) async {},
    );

    blocTest(
      'Expects [NewCommentAdded] when added a comment',
      build: () async {
        when(mockCommentRepository.saveComment(any)).thenAnswer(
          (_) => Future.value(
            CommentModel(
              id: 1,
              texto: 'a new comment arrive',
            ),
          ),
        );
        return commentBloc;
      },
      act: (commentBloc) async => commentBloc.add(
        AddComment(
          text: 'a new comment arrive',
        ),
      ),
      expect: [
        NewCommentAdded(
          comment: CommentModel(
            id: 1,
            texto: 'a new comment arrive',
          ),
          numberOfComments: 1,
        ),
      ],
      verify: (commentBloc) async {},
    );

    blocTest(
      'Expects [NewCommentAdded] when added a comment',
      build: () async {
        commentBloc.postComments = [
          CommentModel(),
        ];
        return commentBloc;
      },
      act: (commentBloc) async => commentBloc.add(
        UpdateCommentReplies(
          comment: CommentModel(),
          subComments: [
            SubCommentModel(),
          ],
        ),
      ),
      expect: [
        NewReplyCommentAdded(
          comment: CommentModel(),
          numberOfReplies: 1,
        ),
      ],
    );
  });
}
