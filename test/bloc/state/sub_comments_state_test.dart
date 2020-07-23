import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/cubits.dart';

void main() {
  group('TimelineState tests', () {
    test('states', () {
      expect(
          GetCommentSubCommentsSuccess([]), GetCommentSubCommentsSuccess([]));
    });
  });
}
