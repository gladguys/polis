import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/extension/extensions.dart';

void main() {
  group('FormatterExtension tests', () {
    test('sanitizePercentageToDouble', () {
      expect('1%'.sanitizePercentageToDouble(), 1.0);
    });

    test('sanitizeToCleanDouble', () {
      expect('1.000,00'.sanitizeToCleanDouble(), 100000.0);
    });
  });
}
