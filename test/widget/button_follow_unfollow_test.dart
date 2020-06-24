import 'package:flutter_test/flutter_test.dart';
import 'package:polis/widget/general/button_follow_unfollow.dart';

void main() {
  group('ButtonFollowUnfollow tests', () {
    test('assert', () {
      expect(() => ButtonFollowUnfollow(isFollow: null, onPressed: () {}),
          throwsAssertionError);

      expect(() => ButtonFollowUnfollow(isFollow: true, onPressed: null),
          throwsAssertionError);
    });
  });
}
