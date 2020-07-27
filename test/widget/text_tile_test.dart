import 'package:flutter_test/flutter_test.dart';
import 'package:polis/widget/text_title.dart';

void main() {
  group('TextTitle tests', () {
    test('default font size', () {
      final textTile = TextTitle('text');
      expect(textTile.fontSize, 24.0);
    });

    test('customised font size', () {
      final textTile = TextTitle('text', fontSize: 22);
      expect(textTile.fontSize, 22);
    });
  });
}
