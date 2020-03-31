import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/page/pages.dart';

void main() {
  group('Panel tests', () {
    testWidgets('asserts', (tester) async {
      expect(
        () async => await tester.pumpWidget(
          Panel(
            page: null,
            title: 'Title',
          ),
        ),
        throwsAssertionError,
      );

      expect(
        () async => await tester.pumpWidget(
          Panel(
            page: Container(),
            title: null,
          ),
        ),
        throwsAssertionError,
      );
    });
  });
}
