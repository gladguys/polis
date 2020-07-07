import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/domain/model/models.dart';

void main() {
  group('CommentModel tests', () {
    test('toString()', () {
      final modelToString = CommentModel(id: '1').toString();
      final result =
          '''CommentModel{id: 1, userId: null, username: null, userPhoto: null, texto: null, data: null, respostas: null}''';
      expect(modelToString == result, true);
    });
  });
}
