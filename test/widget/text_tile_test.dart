import 'package:flutter_test/flutter_test.dart';
import 'package:polis/widget/text_title.dart';

void main() {
  group('TextTitle tests', () {
    test('default font size', () {
      final textTile = TextTitle('text');
      expect(textTile.fontSize, 16);
    });

    test('customised font size', () {
      final textTile = TextTitle('text', fontSize: 18);
      expect(textTile.fontSize, 18);
    });
  });
}
