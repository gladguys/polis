import 'package:flutter_test/flutter_test.dart';
import 'package:polis/page/user_configs/fancy_switcher.dart';

import '../utils.dart';

void main() {
  group('FancySwitcher tests', () {
    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          FancySwitcher(),
        ),
      );
    });
  });
}
