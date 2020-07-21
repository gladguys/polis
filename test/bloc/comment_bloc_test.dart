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
        NewSubCommentAdded(
          comment: CommentModel(),
          numberOfSubComments: 1,
        ),
      ],
    );

    blocTest(
      'Expects [CommentDeletedSuccess] when deleted a comment',
      build: () async {
        commentBloc.postComments = [
          CommentModel(
            id: 1,
          ),
        ];
        return commentBloc;
      },
      act: (commentBloc) async => commentBloc.add(
        DeleteComment(
          CommentModel(
            id: 1,
          ),
        ),
      ),
      expect: [
        CommentDeletedSuccess(
          comment: CommentModel(
            id: 1,
          ),
          numberOfComments: 0,
        ),
      ],
    );

    blocTest(
      'Expects [EditingCommentStarted] when starting edition of  a comment',
      build: () async => commentBloc,
      act: (commentBloc) async => commentBloc.add(
        StartEditingComment(
          CommentModel(
            id: 1,
          ),
        ),
      ),
      expect: [
        EditingCommentStarted(
          CommentModel(
            id: 1,
          ),
        ),
      ],
    );

    blocTest(
      'Expects [InitialCommentState] when stops editing',
      build: () async => commentBloc,
      act: (commentBloc) async {
        commentBloc.add(
          StartEditingComment(
            CommentModel(
              id: 1,
            ),
          ),
        );
        commentBloc.add(
          StopEditingComment(),
        );
      },
      expect: [
        EditingCommentStarted(
          CommentModel(
            id: 1,
          ),
        ),
        InitialCommentState(),
      ],
    );

    blocTest(
      'Expects [CommentEditedSuccess] when EditComment added',
      build: () async {
        commentBloc.postComments = [
          CommentModel(
            id: 1,
          ),
          CommentModel(
            id: 2,
          ),
        ];
        when(mockCommentRepository.editComment(comment: anyNamed('comment')))
            .thenAnswer((_) => Future.value());
        return commentBloc;
      },
      act: (commentBloc) async => commentBloc.add(
        EditComment(
          comment: CommentModel(
            id: 1,
          ),
          newText: 'novo',
        ),
      ),
      expect: [
        CommentEditedSuccess(
          comment: CommentModel(
            id: 1,
          ),
        ),
      ],
      verify: (commentBloc) async {
        verify(
          mockCommentRepository.editComment(
            comment: CommentModel(
              id: 1,
              texto: 'novo',
            ),
          ),
        ).called(1);
      },
    );

    blocTest(
      'Expects [CommentEditedFailed] when fails',
      build: () async {
        commentBloc.postComments = [
          CommentModel(
            id: 1,
          ),
          CommentModel(
            id: 2,
          ),
        ];
        when(mockCommentRepository.editComment(comment: anyNamed('comment')))
            .thenThrow(Exception());
        return commentBloc;
      },
      act: (commentBloc) async => commentBloc.add(
        EditComment(
          comment: CommentModel(
            id: 1,
          ),
          newText: 'novo',
        ),
      ),
      expect: [
        CommentEditedFailed(),
      ],
    );
  });
}
