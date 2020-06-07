import 'package:flutter_test/flutter_test.dart';
import 'package:polis/page/politic_proposals/widget/politic_proposals_skeleton.dart';

void main() {
  group('PoliticProposalsSkeleton tests', () {
    test('const ', () {
      // ignore: prefer_const_constructors
      expect(PoliticProposalsSkeleton() == const PoliticProposalsSkeleton(),
          false);
    });
  });
}
