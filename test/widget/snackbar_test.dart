import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/widget/general/snackbar.dart';

import '../utils.dart';

void main() {
  group('Snackbar tests', () {
    testWidgets('should show default snackbar', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          Scaffold(body: Builder(builder: (_) => Container())),
        ),
      );
      final container = find.byType(Container);
      final context = tester.element(container);
      Snackbar(context, 'teste');
      await tester.pumpAndSettle();
      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('should show success snackbar with green color',
        (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          Scaffold(body: Builder(builder: (_) => Container())),
        ),
      );
      final container = find.byType(Container);
      final context = tester.element(container);
      Snackbar.success(context, 'teste');
      await tester.pumpAndSettle();
      expect(find.byWidgetPredicate((widget) {
        if (widget is SnackBar && widget.backgroundColor == Colors.green[700]) {
          return true;
        }
        return false;
      }), findsOneWidget);
    });

    testWidgets('should show error snackbar with red color', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          Scaffold(body: Builder(builder: (_) => Container())),
        ),
      );
      final container = find.byType(Container);
      final context = tester.element(container);
      Snackbar.error(context, 'teste');
      await tester.pumpAndSettle();
      expect(find.byWidgetPredicate((widget) {
        if (widget is SnackBar && widget.backgroundColor == Colors.red[900]) {
          return true;
        }
        return false;
      }), findsOneWidget);
    });

    testWidgets('should show warning snackbar with yellow color',
        (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          Scaffold(body: Builder(builder: (_) => Container())),
        ),
      );
      final container = find.byType(Container);
      final context = tester.element(container);
      Snackbar.warning(context, 'teste');
      await tester.pumpAndSettle();
      expect(find.byWidgetPredicate((widget) {
        if (widget is SnackBar &&
            widget.backgroundColor == Colors.yellow[700]) {
          return true;
        }
        return false;
      }), findsOneWidget);
    });
  });
}
