import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('CommentRepliesEvent tests', () {
    group('AddReplyComment', () {
      test('props', () {
        final ev1 = AddSubComment(
          text: 'a',
        );
        final ev2 = AddSubComment(
          text: 'a',
        );
        final ev3 = AddSubComment(
          text: 'b',
        );

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });
  });
}
