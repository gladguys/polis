import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/comment_model.dart';
import '../../../domain/model/models.dart';
import '../../abstract/comment_repository.dart';
import 'dio_main_api.dart';
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
      if (response.isOk) {
        final decodedResponse = response.data as List;
        return List.generate(
          decodedResponse.length,
          (i) => CommentModel.fromJson(decodedResponse[i]),
        );
      }
      throw Exception();
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<List<SubCommentModel>> getCommentSubComments({int commentId}) async {
    try {
      final response = await client.get('$COMENTARIOS/$commentId/$SUBS');
      if (response.isOk) {
        final decodedResponse = response.data as List;
        return List.generate(
          decodedResponse.length,
          (i) => SubCommentModel.fromJson(decodedResponse[i]),
        );
      }
      throw Exception();
    } on Exception {
      throw Exception();
    }
  }

  @override
  Future<CommentModel> saveComment(CommentModel comment) async {
    try {
      final response = await client.post(
        COMENTARIOS,
        data: comment.toJson(),
      );

      if (response.isOk) {
        final decodedResponse = response.data;
        return CommentModel.fromJson(decodedResponse);
      }
      throw Exception();
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<SubCommentModel> saveSubComment(
      {int commentId, SubCommentModel subComment}) async {
    try {
      final response = await client.post(
        '$COMENTARIOS/$commentId/$SUBS',
        data: subComment.toJson(),
      );
      if (response.isOk) {
        final decodedResponse = response.data;
        return SubCommentModel.fromJson(decodedResponse);
      }
      throw Exception();
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> deleteComment({CommentModel comment}) async {
    try {
      final response = await client.delete(
        '$COMENTARIOS/${comment.id}',
      );
      if (!response.isOk) {
        throw Exception();
      }
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<CommentModel> editComment({CommentModel comment}) async {
    try {
      final response = await client.put(
        COMENTARIOS,
        data: comment.toJson(),
      );
      if (response.isOk) {
        final decodedResponse = response.data;
        return CommentModel.fromJson(decodedResponse);
      }
      throw Exception();
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> deleteSubComment({SubCommentModel subComment}) async {
    try {
      final response = await client.delete(
        '$COMENTARIOS/$SUBS/${subComment.id}',
      );
      if (!response.isOk) {
        throw Exception();
      }
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<SubCommentModel> editSubComment(
      {int commentId, SubCommentModel subComment}) async {
    try {
      final response = await client.put(
        '$COMENTARIOS/$commentId/$SUBS',
        data: subComment.toJson(),
      );
      if (response.isOk) {
        final decodedResponse = response.data;
        return SubCommentModel.fromJson(decodedResponse);
      }
      throw Exception();
    } on Exception {
      rethrow;
    }
  }
}
