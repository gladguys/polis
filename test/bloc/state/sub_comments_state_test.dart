import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('TimelineState tests', () {
    test('states', () {
      expect(
          GetCommentSubCommentsSuccess([]), GetCommentSubCommentsSuccess([]));
    });
  });
}
