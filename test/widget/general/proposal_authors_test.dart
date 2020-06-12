import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/keys.dart';
import 'package:polis/widget/general/proposal_authors.dart';

import '../../utils.dart';

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
            ),
          ),
        ),
      );
      final proposalAuthorsButton = find.byKey(proposalAuthorsVisibilityKey);
      await tester.tap(proposalAuthorsButton);
      await tester.pumpAndSettle();
      await tester.tap(proposalAuthorsButton);
    });
  });
}
