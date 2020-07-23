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
        return subCommentsBloc;
      },
      act: (subCommentsBloc) async => subCommentsBloc.add(
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
      verify: (subCommentsBloc) async {
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
        return subCommentsBloc;
      },
      act: (subCommentsBloc) async => subCommentsBloc.add(
        GetCommentSubComments(
          commentId: 1,
        ),
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
      verify: (subCommentsBloc) async {
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
        return subCommentsBloc;
      },
      act: (subCommentsBloc) async => subCommentsBloc.add(
        GetCommentSubComments(commentId: 1),
      ),
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
        return subCommentsBloc;
      },
      act: (subCommentsBloc) async => subCommentsBloc.add(
        AddSubComment(
          text: 'texto',
        ),
      ),
      expect: [
        AddedSubCommentSuccess(
          subCommentAdded: SubCommentModel(id: 1, texto: 'texto'),
          numberOfReplies: 1,
        ),
      ],
      verify: (subCommentsBloc) async {
        verify(
          mockCommentBloc.add(
            UpdateCommentReplies(
              comment: CommentModel(
                id: 1,
              ),
              subComments: [
                SubCommentModel(
                  id: 1,
                  texto: 'texto',
                ),
              ],
            ),
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
        return subCommentsBloc;
      },
      act: (subCommentsBloc) async => subCommentsBloc.add(
        AddSubComment(
          text: 'texto',
        ),
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
        return subCommentsBloc;
      },
      act: (subCommentsBloc) async => subCommentsBloc.add(
        DeleteSubComment(
          subComment: SubCommentModel(
            id: 1,
          ),
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
      verify: (subCommentsBloc) async {
        verify(
          mockCommentBloc.add(
            UpdateCommentReplies(
              comment: CommentModel(
                id: 1,
              ),
              subComments: [],
            ),
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
        return subCommentsBloc;
      },
      act: (subCommentsBloc) async => subCommentsBloc.add(
        DeleteSubComment(
          subComment: SubCommentModel(
            id: 1,
          ),
        ),
      ),
      expect: [
        DeletedSubCommentFailed(),
      ],
    );

    blocTest(
      '''Expects [EditingSubCommentStarted] when starting edition of  a sub comment''',
      build: () => subCommentsBloc,
      act: (subCommentsBloc) async => subCommentsBloc.add(
        StartEditingSubComment(
          SubCommentModel(
            id: 1,
          ),
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
      build: () => subCommentsBloc,
      act: (subCommentsBloc) async {
        subCommentsBloc.add(
          StartEditingSubComment(
            SubCommentModel(
              id: 1,
            ),
          ),
        );
        subCommentsBloc.add(
          StopEditingSubComment(),
        );
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
        subCommentsBloc.subComments = [
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
        return subCommentsBloc;
      },
      act: (subCommentsBloc) async => subCommentsBloc.add(
        EditSubComment(
          subComment: SubCommentModel(
            id: 1,
          ),
          newText: 'novo',
        ),
      ),
      expect: [
        SubCommentEditedSuccess(
          subComment: SubCommentModel(
            id: 1,
          ),
        ),
      ],
      verify: (subCommentsBloc) async {
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
        subCommentsBloc.subComments = [
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
        return subCommentsBloc;
      },
      act: (subCommentsBloc) async => subCommentsBloc.add(
        EditSubComment(
          subComment: SubCommentModel(
            id: 1,
          ),
          newText: 'novo',
        ),
      ),
      expect: [
        SubCommentEditedFailed(),
      ],
    );
  });
}
