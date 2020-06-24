import 'package:flutter_test/flutter_test.dart';
import 'package:polis/widget/general/error_container.dart';

void main() {
  group('ErrorContainer tests', () {
    test('const ', () {
      // ignore: prefer_const_constructors
      expect(ErrorContainer() == const ErrorContainer(), false);
    });
  });
}
