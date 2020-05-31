import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/extension/extensions.dart';

import '../../utils.dart';

void main() {
  group('MediaQueryExtension tests', () {
    testWidgets('', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          Builder(
            builder: (context) => GestureDetector(
              onTap: () => context.screenWidth,
              child: Container(
                key: const ValueKey('container'),
                height: 200,
                width: 200,
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const ValueKey('container')));
    });
  });
}
