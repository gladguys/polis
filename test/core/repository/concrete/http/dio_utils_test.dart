import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/repository/concrete/http/dio_utils.dart';

void main() {
  group('Dio utils tests', () {
    test('get client', () {
      final dio = getMainApiDefaultClient();
      final dio2 = getScrapperApiDefaultClient();
      expect(dio == dio2, false);
    });
  });
}
