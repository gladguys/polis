import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/keys.dart';
import 'package:polis/widget/general/proposal_authors.dart';

import '../utils.dart';

void main() {
  group('ProposalAuthors', () {
    testWidgets('should render with empty list', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          Scaffold(
            body: ProposalAuthors([]),
          ),
        ),
      );
    });

    testWidgets('should render sublist', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          Scaffold(
            body: ProposalAuthors(
              ['a', 'b'],
              quantidadeAutores: 3,
            ),
          ),
        ),
      );
    });

    testWidgets('should show and hide all authors when click icon',
        (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          Scaffold(
            body: ProposalAuthors(
              ['a', 'b', 'c', 'd', 'e', 'f'],
              quantidadeAutores: 3,
            ),
          ),
        ),
      );
      final showIcon = find.byKey(doShowAllIconKey);
      await tester.tap(showIcon);
      await tester.pumpAndSettle();
      final hideIcon = find.byKey(dontShowAllIconKey);
      await tester.tap(hideIcon);
    });
  });
}
