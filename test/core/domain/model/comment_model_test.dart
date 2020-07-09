import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/domain/model/models.dart';

void main() {
  group('CommentModel tests', () {
    test('toString()', () {
      final modelToString = CommentModel(id: 1).toString();
      final result =
          '''CommentModel{id: 1, usuarioId: null, usuarioNome: null, postId: null, texto: null, diaHora: null, foiEditado: null, qntSubComentarios: null}''';
      expect(modelToString == result, true);
    });
  });
}
