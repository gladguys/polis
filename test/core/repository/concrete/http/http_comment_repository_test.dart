import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/repository/concrete/repositories.dart';

import '../../../../mock.dart';

void main() {
  group('HttpCommentRepository tests', () {
    HttpCommentRepository httpCommentRepository;
    MockDio mockDio;
    MockResponse mockResponse;

    setUp(() {
      mockDio = MockDio();
      mockResponse = MockResponse();
      httpCommentRepository = HttpCommentRepository(
        client: mockDio,
      );
    });

    test('asserts', () {
      expect(
          () => HttpCommentRepository(
                client: null,
              ),
          throwsAssertionError);
    });

    group('getPostComments', () {
      test('works', () async {
        when(mockDio.get(any, queryParameters: anyNamed('queryParameters')))
            .thenAnswer((_) => Future.value(mockResponse));
        when(mockResponse.statusCode).thenReturn(200);
        when(mockResponse.data).thenReturn(
          [
            CommentModel(id: 1).toJson(),
            CommentModel(id: 2).toJson(),
            CommentModel(id: 3).toJson(),
          ],
        );
        await httpCommentRepository.getPostComments(postId: '1');
      });

      test('throws exception', () async {
        when(mockDio.get(any, queryParameters: anyNamed('queryParameters')))
            .thenThrow(Exception());
        try {
          await httpCommentRepository.getPostComments(postId: '1');
        } on Exception {}
      });
    });

    group('getCommentSubComments', () {
      test('works', () async {
        when(mockDio.get(any)).thenAnswer((_) => Future.value(mockResponse));
        when(mockResponse.statusCode).thenReturn(200);
        when(mockResponse.data).thenReturn(
          [
            SubCommentModel(id: 1).toJson(),
            SubCommentModel(id: 2).toJson(),
            SubCommentModel(id: 3).toJson(),
          ],
        );
        await httpCommentRepository.getCommentSubComments(commentId: 1);
      });

      test('throws exception', () async {
        when(mockDio.get(any)).thenThrow(Exception());
        try {
          await httpCommentRepository.getCommentSubComments(commentId: 1);
        } on Exception {}
      });
    });

    group('saveComment', () {
      test('works', () async {
        when(mockDio.post(any, data: anyNamed('data')))
            .thenAnswer((_) => Future.value(mockResponse));
        when(mockResponse.statusCode).thenReturn(200);
        when(mockResponse.data).thenReturn(
          CommentModel(id: 1).toJson(),
        );
        await httpCommentRepository.saveComment(
          CommentModel(id: 1),
        );
      });

      test('throws exception', () async {
        when(mockDio.post(any, data: anyNamed('data'))).thenThrow(Exception());
        try {
          await httpCommentRepository.saveComment(CommentModel(id: 1));
        } on Exception {}
      });
    });

    group('saveSubComment', () {
      test('works', () async {
        when(mockDio.post(any, data: anyNamed('data')))
            .thenAnswer((_) => Future.value(mockResponse));
        when(mockResponse.statusCode).thenReturn(200);
        when(mockResponse.data).thenReturn(
          SubCommentModel(id: 1).toJson(),
        );
        await httpCommentRepository.saveSubComment(
          commentId: 1,
          subComment: SubCommentModel(id: 1),
        );
      });

      test('throws exception', () async {
        when(mockDio.post(any, data: anyNamed('data')))
            .thenAnswer((_) => Future.value(mockResponse));
        try {
          await httpCommentRepository.saveSubComment(
            commentId: 1,
            subComment: SubCommentModel(id: 1),
          );
        } on Exception {}
      });
    });

    group('deleteComment', () {
      test('works', () async {
        when(mockDio.delete(any)).thenAnswer((_) => Future.value(mockResponse));
        when(mockResponse.statusCode).thenReturn(200);
        await httpCommentRepository.deleteComment(
          comment: CommentModel(id: 1),
        );
      });

      test('throws exception', () async {
        when(mockDio.delete(any)).thenAnswer((_) => Future.value(mockResponse));
        try {
          await httpCommentRepository.deleteComment(
            comment: CommentModel(id: 1),
          );
        } on Exception {}
      });
    });

    group('editComment', () {
      test('works', () async {
        when(mockDio.put(any, data: anyNamed('data')))
            .thenAnswer((_) => Future.value(mockResponse));
        when(mockResponse.statusCode).thenReturn(200);
        when(mockResponse.data).thenReturn(CommentModel(id: 1).toJson());
        await httpCommentRepository.editComment(
          comment: CommentModel(id: 1),
        );
      });

      test('throws exception', () async {
        when(mockDio.put(any, data: anyNamed('data')))
            .thenAnswer((_) => Future.value(mockResponse));
        try {
          await httpCommentRepository.editComment(
            comment: CommentModel(id: 1),
          );
        } on Exception {}
      });
    });

    group('deleteSubComment', () {
      test('works', () async {
        when(mockDio.delete(any)).thenAnswer((_) => Future.value(mockResponse));
        when(mockResponse.statusCode).thenReturn(200);
        await httpCommentRepository.deleteSubComment(
          subComment: SubCommentModel(id: 1),
        );
      });

      test('throws exception', () async {
        when(mockDio.delete(any)).thenAnswer((_) => Future.value(mockResponse));
        try {
          await httpCommentRepository.deleteSubComment(
            subComment: SubCommentModel(id: 1),
          );
        } on Exception {}
      });
    });

    group('editSubComment', () {
      test('works', () async {
        when(mockDio.put(any, data: anyNamed('data')))
            .thenAnswer((_) => Future.value(mockResponse));
        when(mockResponse.statusCode).thenReturn(200);
        when(mockResponse.data).thenReturn(SubCommentModel(id: 1).toJson());
        await httpCommentRepository.editSubComment(
          subComment: SubCommentModel(id: 1),
        );
      });

      test('throws exception', () async {
        when(mockDio.put(any, data: anyNamed('data')))
            .thenAnswer((_) => Future.value(mockResponse));
        try {
          await httpCommentRepository.editSubComment(
            subComment: SubCommentModel(id: 1),
          );
        } on Exception {}
      });
    });
  });
}
