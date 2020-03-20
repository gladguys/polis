import 'package:flutter_test/flutter_test.dart';
import 'package:polis/page/favorite_posts/favorite_posts_page.dart';

import '../utils.dart';

void main() {
  group('FavoritePostsPage tests', () {
    testWidgets('shoud build without exploding', (tester) async {
      await tester.pumpWidget(connectedWidget(FavoritePostsPage()));
    });
  });
}
