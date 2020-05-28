import 'package:flutter_test/flutter_test.dart';
import 'package:polis/widget/image/photo_image.dart';

void main() {
  group('PhotoImage tests', () {
    test('assert', () {
      expect(
          () => PhotoImage(
                url: null,
                size: 80,
              ),
          throwsAssertionError);
      expect(
          () => PhotoImage(
                url: '',
                size: null,
              ),
          throwsAssertionError);
      expect(
          () => PhotoImage(
                url: '',
                size: 0,
              ),
          throwsAssertionError);
    });
  });
}
