import 'package:flutter_test/flutter_test.dart';
import 'package:polis/widget/text_rich.dart';

void main() {
  group('TextRich tests', () {
    test('assert', () {
      expect(() => TextRich(children: null), throwsAssertionError);
      expect(() => TextRich(children: []), throwsAssertionError);
    });
  });
}
