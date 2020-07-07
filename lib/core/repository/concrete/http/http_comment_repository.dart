import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/comment_model.dart';
import '../../abstract/comment_repository.dart';
import 'dio.dart';
import 'dio_utils.dart';

class HttpCommentRepository implements CommentRepository {
  HttpCommentRepository({@required this.client}) : assert(client != null);

  final Dio client;

  @override
  Future<List<CommentModel>> getPostComments({String postId}) async {
    try {
      final response = await client.get(
        COMENTARIOS,
        queryParameters: {
          POST_ID_PARAM: postId,
        },
      );
      if (response.statusCode == HTTP_STATUS_OK) {
        final decodedResponse = response.data as List;
        return List.generate(
          decodedResponse.length,
          (i) => CommentModel.fromJson(decodedResponse[i]),
        );
      } else {
        throw Exception();
      }
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<List<CommentModel>> getCommentSubComments({String commentId}) async {
    try {
      final response = await client.get('$COMENTARIOS/$commentId/$SUBS');
      if (response.statusCode == HTTP_STATUS_OK) {
        final decodedResponse = response.data as List<Map<String, dynamic>>;
        return List.generate(
          decodedResponse.length,
          (i) => CommentModel.fromJson(decodedResponse[i]),
        );
      } else {
        throw Exception();
      }
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<CommentModel> saveComment(CommentModel comment) async {
    try {
      final response = await client.post(
        COMENTARIOS,
        data: comment.toJson(),
      );
      if (response.statusCode == HTTP_STATUS_OK) {
        final decodedResponse = response.data;
        try {
          return CommentModel.fromJson(decodedResponse);
        } catch (e) {
          print(e);
          throw Exception();
        }
      } else {
        throw Exception();
      }
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<CommentModel> saveCommentReply(
      {String postId, CommentModel comment, CommentModel replyComment}) {
    throw UnimplementedError();
  }

  @override
  Future<CommentModel> deleteComment({String postId, CommentModel comment}) {
    // TODO: implement deleteComment
    throw UnimplementedError();
  }

  @override
  Future<CommentModel> editComment({String postId, CommentModel comment}) {
    // TODO: implement editComment
    throw UnimplementedError();
  }
}
