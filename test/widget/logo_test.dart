import 'package:flutter_test/flutter_test.dart';
import 'package:polis/widget/general/logo.dart';

void main() {
  group('Logo tests', () {
    test('const ', () {
      // ignore: prefer_const_constructors
      expect(Logo() == const Logo(), false);
    });
  });
}
