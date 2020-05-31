import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/domain/model/models.dart';

void main() {
  group('UserPositionInfo tests', () {
    test('asserts', () {
      expect(
        () => UserPositionInfo(
          isBrazil: null,
          stateId: 'CE',
        ),
        throwsAssertionError,
      );

      expect(
        () => UserPositionInfo(
          isBrazil: true,
          stateId: null,
        ),
        throwsAssertionError,
      );
    });

    test('props', () {
      final user1 = UserPositionInfo(
        isBrazil: true,
        stateId: 'CE',
      );
      final user2 = UserPositionInfo(
        isBrazil: true,
        stateId: 'CE',
      );
      final user3 = UserPositionInfo(
        isBrazil: false,
        stateId: 'PR',
      );
      expect(user1, user2);
      expect(user1 == user3, false);
    });
  });
}
