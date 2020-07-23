import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/model/models.dart';

import '../mock.dart';

void main() {
  group('EditProfileBloc tests', () {
    SubCommentsCubit subCommentsCubit;
    MockCommentCubit mockCommentCubit;
    MockCommentRepository mockCommentRepository;

    setUp(() {
      mockCommentCubit = MockCommentCubit();
      when(mockCommentCubit.user).thenReturn(
        UserModel(
          userId: '1',
        ),
      );
      mockCommentRepository = MockCommentRepository();
      subCommentsCubit = SubCommentsCubit(
        post: PropostaModel(
          id: '1',
          idPropostaPolitico: '1',
        ),
        comment: CommentModel(
          id: 1,
        ),
        commentCubit: mockCommentCubit,
        repository: mockCommentRepository,
      );
    });

    tearDown(() {
      subCommentsCubit?.close();
    });

    test('asserts', () {
      expect(
          () => SubCommentsCubit(
                post: null,
                comment: CommentModel(),
                commentCubit: mockCommentCubit,
                repository: mockCommentRepository,
              ),
          throwsAssertionError);
      expect(
          () => SubCommentsCubit(
                post: PropostaModel(),
                comment: null,
                commentCubit: mockCommentCubit,
                repository: mockCommentRepository,
              ),
          throwsAssertionError);
      expect(
          () => SubCommentsCubit(
                post: PropostaModel(),
                comment: CommentModel(),
                commentCubit: null,
                repository: mockCommentRepository,
              ),
          throwsAssertionError);
      expect(
          () => SubCommentsCubit(
                post: PropostaModel(),
                comment: CommentModel(),
                commentCubit: mockCommentCubit,
                repository: null,
              ),
          throwsAssertionError);
    });

    test('''Expects InitialCommentRepliesState to be the initial state''', () {
      expect(subCommentsCubit.state, equals(InitialSubCommentsState()));
    });

    blocTest(
      '''Expects [AddedSubCommentSuccess] when AddSubComment called''',
      build: () {
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
        return subCommentsCubit;
      },
      act: (subCommentsCubit) async => subCommentsCubit.addSubComment(
        text: 'a reply',
      ),
      expect: [
        AddedSubCommentSuccess(
          subCommentAdded: SubCommentModel(
            texto: 'a reply',
          ),
          numberOfReplies: 1,
        ),
      ],
      verify: (subCommentsCubit) async {
        verify(
          mockCommentCubit.updateSubCommentsCount(
            updatedComment: CommentModel(
              id: 1,
            ),
            subComments: [
              SubCommentModel(texto: 'a reply'),
            ],
          ),
        );
      },
    );

    blocTest(
      '''Expects [GetCommentSubCommentsSuccess] when GetCommentSubComments called''',
      build: () {
        when(mockCommentRepository.getCommentSubComments(commentId: 1))
            .thenAnswer(
          (_) => Future.value(
            [
              SubCommentModel(
                id: 1,
              ),
              SubCommentModel(
                id: 2,
              ),
            ],
          ),
        );
        return subCommentsCubit;
      },
      act: (subCommentsCubit) async => subCommentsCubit.getCommentSubComments(
        commentId: 1,
      ),
      expect: [
        CommentSubCommentsLoading(),
        GetCommentSubCommentsSuccess(
          [
            SubCommentModel(
              id: 1,
            ),
            SubCommentModel(
              id: 2,
            ),
          ],
        ),
      ],
      verify: (subCommentsCubit) async {
        verify(mockCommentRepository.getCommentSubComments(commentId: 1))
            .called(1);
      },
    );

    blocTest(
      '''Expects [LoadingPostComments, GetPostCommentsSuccess] when GetPostComments failed''',
      build: () {
        when(mockCommentRepository.getCommentSubComments(
          commentId: 1,
        )).thenThrow(Exception());
        return subCommentsCubit;
      },
      act: (subCommentsCubit) async =>
          subCommentsCubit.getCommentSubComments(commentId: 1),
      expect: [
        CommentSubCommentsLoading(),
        GetCommentSubCommentsFailed(),
      ],
    );

    blocTest(
      '''Expects [AddedSubCommentSuccess] when AddSubComment called''',
      build: () {
        when(mockCommentRepository.saveSubComment(
          subComment: anyNamed('subComment'),
          commentId: 1,
        )).thenAnswer(
          (_) => Future.value(
            SubCommentModel(
              id: 1,
              texto: 'texto',
            ),
          ),
        );
        return subCommentsCubit;
      },
      act: (subCommentsCubit) async => subCommentsCubit.addSubComment(
        text: 'texto',
      ),
      expect: [
        AddedSubCommentSuccess(
          subCommentAdded: SubCommentModel(id: 1, texto: 'texto'),
          numberOfReplies: 1,
        ),
      ],
      verify: (subCommentsCubit) async {
        verify(
          mockCommentCubit.updateSubCommentsCount(
            updatedComment: CommentModel(
              id: 1,
            ),
            subComments: [
              SubCommentModel(
                id: 1,
                texto: 'texto',
              ),
            ],
          ),
        );
      },
    );

    blocTest(
      '''Expects [AddedSubCommentFailed] when AddSubComment failed''',
      build: () {
        when(mockCommentRepository.saveSubComment(
          subComment: anyNamed('subComment'),
          commentId: 1,
        )).thenThrow(Exception());
        return subCommentsCubit;
      },
      act: (subCommentsCubit) async => subCommentsCubit.addSubComment(
        text: 'texto',
      ),
      expect: [
        AddedSubCommentFailed(),
      ],
    );

    blocTest(
      '''Expects [DeletedSubCommentSuccess] when DeleteSubComment called''',
      build: () {
        when(mockCommentRepository.deleteSubComment(
          subComment: anyNamed('subComment'),
        )).thenAnswer(
          (_) => Future.value(),
        );
        return subCommentsCubit;
      },
      act: (subCommentsCubit) async => subCommentsCubit.deleteSubComment(
        subComment: SubCommentModel(
          id: 1,
        ),
      ),
      expect: [
        DeletedSubCommentSuccess(
          subCommentDeleted: SubCommentModel(
            id: 1,
          ),
          numberOfReplies: 0,
        ),
      ],
      verify: (subCommentsCubit) async {
        verify(
          mockCommentCubit.updateSubCommentsCount(
            updatedComment: CommentModel(
              id: 1,
            ),
            subComments: [],
          ),
        );
      },
    );

    blocTest(
      '''Expects [DeletedSubCommentFailed] when DeleteSubComment failed''',
      build: () {
        when(mockCommentRepository.deleteSubComment(
          subComment: anyNamed('subComment'),
        )).thenThrow(Exception());
        return subCommentsCubit;
      },
      act: (subCommentsCubit) async => subCommentsCubit.deleteSubComment(
        subComment: SubCommentModel(
          id: 1,
        ),
      ),
      expect: [
        DeletedSubCommentFailed(),
      ],
    );

    blocTest(
      '''Expects [EditingSubCommentStarted] when starting edition of  a sub comment''',
      build: () => subCommentsCubit,
      act: (subCommentsCubit) async => subCommentsCubit.startEditingSubComment(
        SubCommentModel(
          id: 1,
        ),
      ),
      expect: [
        EditingSubCommentStarted(
          SubCommentModel(
            id: 1,
          ),
        ),
      ],
    );

    blocTest(
      'Expects [InitialSubCommentsState] when stops editing',
      build: () => subCommentsCubit,
      act: (subCommentsCubit) async {
        subCommentsCubit.startEditingSubComment(
          SubCommentModel(
            id: 1,
          ),
        );
        subCommentsCubit.stopEditingSubComment();
      },
      expect: [
        EditingSubCommentStarted(
          SubCommentModel(
            id: 1,
          ),
        ),
        InitialSubCommentsState(),
      ],
    );

    blocTest(
      'Expects [SubCommentEditedSuccess] when EditSubComment added',
      build: () {
        subCommentsCubit.subComments = [
          SubCommentModel(
            id: 1,
          ),
          SubCommentModel(
            id: 2,
          ),
        ];
        when(mockCommentRepository.editSubComment(
                commentId: 1, subComment: anyNamed('subComment')))
            .thenAnswer((_) => Future.value());
        return subCommentsCubit;
      },
      act: (subCommentsCubit) async => subCommentsCubit.editSubComment(
        subComment: SubCommentModel(
          id: 1,
        ),
        newText: 'novo',
      ),
      expect: [
        SubCommentEditedSuccess(
          subComment: SubCommentModel(
            id: 1,
          ),
        ),
      ],
      verify: (subCommentsCubit) async {
        verify(
          mockCommentRepository.editSubComment(
            subComment: SubCommentModel(
              id: 1,
              texto: 'novo',
            ),
            commentId: 1,
          ),
        ).called(1);
      },
    );

    blocTest(
      'Expects [CommentEditedFailed] when fails',
      build: () {
        subCommentsCubit.subComments = [
          SubCommentModel(
            id: 1,
          ),
          SubCommentModel(
            id: 2,
          ),
        ];
        when(mockCommentRepository.editSubComment(
                commentId: 1, subComment: anyNamed('subComment')))
            .thenThrow(Exception());
        return subCommentsCubit;
      },
      act: (subCommentsCubit) async => subCommentsCubit.editSubComment(
        subComment: SubCommentModel(
          id: 1,
        ),
        newText: 'novo',
      ),
      expect: [
        SubCommentEditedFailed(),
      ],
    );
  });
}
