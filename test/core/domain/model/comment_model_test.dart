import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/domain/model/models.dart';

void main() {
  final now = DateTime.now();

  final jsonComment = {
    'id': 1,
    'texto': 'texto',
    'diaHora': now.toString(),
    'usuarioNome': 'nome',
    'postId': '1',
    'foiEditado': false,
    'qntSubComentarios': 1,
    'usuarioId': '1',
  };

  final commentModel = CommentModel(
    id: 1,
    texto: 'texto',
    diaHora: now,
    usuarioNome: 'nome',
    postId: '1',
    foiEditado: false,
    qntSubComentarios: 1,
    usuarioId: '1',
  );

  group('CommentModel tests', () {
    test('toString()', () {
      final modelToString = CommentModel(id: 1).toString();
      final result =
          '''CommentModel{id: 1, usuarioId: null, usuarioNome: null, postId: null, politicoId: null, texto: null, diaHora: null, foiEditado: null, qntSubComentarios: null}''';
      expect(modelToString == result, true);
    });

    test('fromJson()', () {
      expect(CommentModel.fromJson(jsonComment) == commentModel, true);
    });

    test('toJson()', () {
      final commentToJson = commentModel.toJson();
      expect(commentToJson['id'] == jsonComment['id'], true);
      expect(commentToJson['texto'] == jsonComment['texto'], true);
      expect(commentToJson['usuarioNome'] == jsonComment['usuarioNome'], true);
      expect(commentToJson['postId'] == jsonComment['postId'], true);
      expect(commentToJson['foiEditado'] == jsonComment['foiEditado'], true);
      expect(
          commentToJson['qntSubComentarios'] ==
              jsonComment['qntSubComentarios'],
          true);
      expect(commentToJson['usuarioId'] == jsonComment['usuarioId'], true);
    });
  });
}
