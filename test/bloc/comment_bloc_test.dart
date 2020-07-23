import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/model/models.dart';

import '../mock.dart';

void main() {
  group('EditProfileBloc tests', () {
    CommentCubit commentCubit;
    MockCommentRepository mockCommentRepository;

    setUp(() {
      mockCommentRepository = MockCommentRepository();
      commentCubit = CommentCubit(
        post: PropostaModel(
          id: '1',
          idPropostaPolitico: '1',
        ),
        user: UserModel(),
        repository: mockCommentRepository,
      );
    });

    tearDown(() {
      commentCubit?.close();
    });

    test('asserts', () {
      expect(
          () => CommentCubit(
                post: null,
                user: UserModel(),
                repository: mockCommentRepository,
              ),
          throwsAssertionError);
      expect(
          () => CommentCubit(
                post: PropostaModel(),
                user: null,
                repository: mockCommentRepository,
              ),
          throwsAssertionError);
      expect(
          () => CommentCubit(
                post: PropostaModel(),
                user: UserModel(),
                repository: null,
              ),
          throwsAssertionError);
    });

    test('''Expects InitialCommentState to be the initial state''', () {
      expect(commentCubit.state, equals(InitialCommentState()));
    });

    blocTest(
      '''Expects [LoadingPostComments, GetPostCommentsSuccess] when GetPostComments called''',
      build: () {
        when(mockCommentRepository.getPostComments(postId: '1'))
            .thenAnswer((_) => Future.value([]));
        return commentCubit;
      },
      act: (commentCubit) async => commentCubit.getPostComments(postId: '1'),
      expect: [
        LoadingPostComments(),
        GetPostCommentsSuccess(
          comments: [],
        ),
      ],
    );

    blocTest(
      '''Expects [LoadingPostComments, GetPostCommentsFailed] when fails''',
      build: () {
        when(mockCommentRepository.getPostComments(postId: '1'))
            .thenThrow(Exception());
        return commentCubit;
      },
      act: (commentCubit) async => commentCubit.getPostComments(postId: '1'),
      expect: [
        LoadingPostComments(),
        GetPostCommentsFailed(),
      ],
      verify: (commentBloc) async {},
    );

    blocTest(
      'Expects [NewCommentAdded] when added a comment',
      build: () {
        when(mockCommentRepository.saveComment(any)).thenAnswer(
          (_) => Future.value(
            CommentModel(
              id: 1,
              texto: 'a new comment arrive',
            ),
          ),
        );
        return commentCubit;
      },
      act: (commentCubit) async => commentCubit.addComment(
        text: 'a new comment arrive',
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
    );

    blocTest(
      'Expects to update sub comments count',
      build: () {
        commentCubit.postComments = [
          CommentModel(),
        ];
        return commentCubit;
      },
      act: (commentCubit) async => commentCubit.updateSubCommentsCount(
        updatedComment: CommentModel(),
        subComments: [
          SubCommentModel(),
        ],
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
      build: () {
        commentCubit.postComments = [
          CommentModel(
            id: 1,
          ),
        ];
        return commentCubit;
      },
      act: (commentCubit) async => commentCubit.deleteComment(
        CommentModel(
          id: 1,
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
      build: () => commentCubit,
      act: (commentCubit) async => commentCubit.startEditingComment(
        CommentModel(
          id: 1,
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
      build: () => commentCubit,
      act: (commentCubit) async {
        commentCubit.startEditingComment(
          CommentModel(
            id: 1,
          ),
        );
        commentCubit.stopEditingComment();
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
      build: () {
        commentCubit.postComments = [
          CommentModel(
            id: 1,
          ),
          CommentModel(
            id: 2,
          ),
        ];
        when(mockCommentRepository.editComment(comment: anyNamed('comment')))
            .thenAnswer((_) => Future.value());
        return commentCubit;
      },
      act: (commentCubit) async => commentCubit.editComment(
        comment: CommentModel(
          id: 1,
        ),
        newText: 'novo',
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
      build: () {
        commentCubit.postComments = [
          CommentModel(
            id: 1,
          ),
          CommentModel(
            id: 2,
          ),
        ];
        when(mockCommentRepository.editComment(comment: anyNamed('comment')))
            .thenThrow(Exception());
        return commentCubit;
      },
      act: (commentCubit) async => commentCubit.editComment(
        comment: CommentModel(
          id: 1,
        ),
        newText: 'novo',
      ),
      expect: [
        CommentEditedFailed(),
      ],
    );
  });
}
