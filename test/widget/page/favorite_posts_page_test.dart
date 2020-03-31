import 'package:flutter_test/flutter_test.dart';
import 'package:polis/page/pages.dart';

import '../utils.dart';

void main() {
  group('FavoritePostsPage tests', () {
    testWidgets('shoud build without exploding', (tester) async {
      await tester.pumpWidget(connectedWidget(FavoritePostsPage()));
    });
  });
}
