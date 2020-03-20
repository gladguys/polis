import 'package:flutter_test/flutter_test.dart';
import 'package:polis/page/pages.dart';

import '../utils.dart';

void main() {
  group('TimelinePage tests', () {
    testWidgets('shoud build without exploding', (tester) async {
      await tester.pumpWidget(connectedWidget(TimelinePage()));
    });
  });
}
