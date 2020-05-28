import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/extension/extensions.dart';
import 'package:polis/page/crunching_data/widget/all_set_button.dart';
import 'package:polis/page/pages.dart';

import '../../mock.dart';
import '../utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    const channel = MethodChannel('plugins.flutter.io/firebase_performance');
    channel.setMockMethodCallHandler((methodCall) async => true);
    initLocator(MockSharedPreferences());
    initializeDateFormatting('pt_BR', null);
  });

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
      await tester.pump(5.seconds);
    });

    testWidgets('should animate the page', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          CrunchingDataPage(),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 12));
      final button = find.byType(RaisedButton);
      await tester.tap(button);
      await tester.pump();
      verify(mockObserver.didPush(any, any));
    });

    testWidgets('should go to timeline when click button', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          AllSetButton(),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 12));
      final button = find.byType(RaisedButton);
      await tester.tap(button);
      await tester.pump();
      verify(mockObserver.didPush(any, any));
    });
  });
}
