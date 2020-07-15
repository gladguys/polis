import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/domain/enum/acao_type.dart';

void main() {
  group('AcaoType tests', () {
    test('isActionFollowUnfollow', () {
      expect(isActionFollowUnfollow(AcaoType.follow), true);
      expect(isActionFollowUnfollow(AcaoType.unfollow), true);
      expect(isActionFollowUnfollow(AcaoType.like), false);
      expect(isActionFollowUnfollow(AcaoType.unlike), false);
    });

    test('isActionLikeUnlike', () {
      expect(isActionLikeUnlike(AcaoType.follow), false);
      expect(isActionLikeUnlike(AcaoType.unfollow), false);
      expect(isActionLikeUnlike(AcaoType.like), true);
      expect(isActionLikeUnlike(AcaoType.unlike), true);
    });
  });
}
