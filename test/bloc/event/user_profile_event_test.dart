import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/enum/post_type.dart';

void main() {
  group('UserProfileEvent tests', () {
    group('FetchUserRelatedInfo tests', () {
      test('props', () {
        final ev1 = FetchUserRelatedInfo('1');
        final ev2 = FetchUserRelatedInfo('1');
        final ev3 = FetchUserRelatedInfo('2');

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });

    group('GetPostInfo tests', () {
      test('props', () {
        final ev1 = GetPostInfo(
          postId: '1',
          politicId: '1',
          postType: PostType.PROPOSICAO,
        );
        final ev2 = GetPostInfo(
          postId: '1',
          politicId: '1',
          postType: PostType.PROPOSICAO,
        );
        final ev3 = GetPostInfo(
          postId: '2',
          politicId: '2',
          postType: PostType.PROPOSICAO,
        );

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });
  });
}
