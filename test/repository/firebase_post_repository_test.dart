import 'package:flutter_test/flutter_test.dart';
import 'package:polis/repository/concrete/repositories.dart';

void main() {
  group('FirebaseFollowRepository tests', () {
    test('test asserts', () {
      expect(
          () => FirebasePostRepository(firestore: null), throwsAssertionError);
    });
  });
}
