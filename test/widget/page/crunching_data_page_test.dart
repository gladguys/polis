import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/page/pages.dart';

import '../utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('CrunchingDataPage tests', () {
    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        TickerMode(
          child: connectedWidget(
            CrunchingDataPage(),
          ),
          enabled: false,
        ),
      );
      await tester.pump(const Duration(seconds: 5));
    });

    testWidgets('should go to timeline when click button', (tester) async {
      await tester.pumpWidget(
        TickerMode(
          child: connectedWidget(
            CrunchingDataPage(),
          ),
          enabled: false,
        ),
      );
      await tester.pump(const Duration(seconds: 5));
      final button = find.byType(RaisedButton);
      await tester.tap(button);
      await tester.pump();
      verify(mockObserver.didPush(any, any));
    });
  });
}
