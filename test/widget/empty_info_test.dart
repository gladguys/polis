import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/widget/empty_info.dart';

import 'utils.dart';

void main() {
  group('EmptyInfo tests', () {
    test('asserts', () {
      expect(
          () => EmptyInfo(
                text: null,
                imageName: '',
                icon: Icons.group,
              ),
          throwsAssertionError);

      expect(
          () => EmptyInfo(
                text: 'aaa',
                imageName: '',
                icon: Icons.group,
              ),
          throwsAssertionError);

      expect(
          () => EmptyInfo(
                text: 'aaa',
                imageName: null,
                icon: null,
              ),
          throwsAssertionError);
    });

    testWidgets('shows icon', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          EmptyInfo(
            text: 'aaaa',
            icon: Icons.group,
          ),
        ),
      );
      expect(find.byType(Icon), findsOneWidget);
    });

    testWidgets('shows image', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          EmptyInfo(
            text: 'aaaa',
            imageName: 'empty.png',
          ),
        ),
      );
      expect(find.byType(Image), findsOneWidget);
    });
  });
}
