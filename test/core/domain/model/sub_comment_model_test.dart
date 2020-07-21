import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/domain/model/models.dart';

void main() {
  final now = DateTime.now();

  final jsonSubComment = {
    'id': 1,
    'texto': 'texto',
    'diaHora': now.toString(),
    'usuarioNome': 'nome',
    'postId': '1',
    'comentarioPaiId': 1,
    'usuarioId': '1',
  };

  final subCommentModel = SubCommentModel(
    id: 1,
    texto: 'texto',
    diaHora: now,
    usuarioNome: 'nome',
    postId: '1',
    comentarioPaiId: 1,
    usuarioId: '1',
  );

  group('SubCommentModel tests', () {
    test('toString()', () {
      final modelToString = SubCommentModel(id: 1).toString();
      final result =
          '''SubCommentModel{id: 1, usuarioId: null, usuarioNome: null, postId: null, texto: null, diaHora: null, comentarioPaiId: null}''';
      expect(modelToString == result, true);
    });

    test('fromJson()', () {
      expect(SubCommentModel.fromJson(jsonSubComment) == subCommentModel, true);
    });

    test('toJson()', () {
      final subCommentToJson = subCommentModel.toJson();
      expect(subCommentToJson['id'] == jsonSubComment['id'], true);
      expect(subCommentToJson['texto'] == jsonSubComment['texto'], true);
      expect(subCommentToJson['usuarioNome'] == jsonSubComment['usuarioNome'],
          true);
      expect(subCommentToJson['postId'] == jsonSubComment['postId'], true);
      expect(
          subCommentToJson['comentarioPaiId'] ==
              jsonSubComment['comentarioPaiId'],
          true);
      expect(
          subCommentToJson['usuarioId'] == jsonSubComment['usuarioId'], true);
    });

    test('copyWith()', () {
      final subComment = SubCommentModel(
        id: 1,
        texto: 'texto',
      );
      final subCommentCopyNotText = subComment.copyWith(id: 2);
      final subCommentCopyText = subComment.copyWith(texto: 'texto2');
      expect(subComment.texto, 'texto');
      expect(subCommentCopyNotText.texto, 'texto');
      expect(subCommentCopyText.texto, 'texto2');
      expect(subComment == subCommentCopyText, false);
    });
  });
}
