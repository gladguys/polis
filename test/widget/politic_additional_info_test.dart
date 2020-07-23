import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/i18n/i18n.dart';
import 'package:polis/core/keys.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/politic_profile/widget/politic_additional_info.dart';

import '../mock.dart';
import '../utils.dart';

void main() {
  MockPoliticProfileCubit mockPoliticProfileCubit;

  group('PoliticAdditionalInfo tests', () {
    setUp(() {
      mockPoliticProfileCubit = MockPoliticProfileCubit();
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProfileCubit>(
            bloc: mockPoliticProfileCubit,
            page: Scaffold(
              body: PoliticAdditionalInfo(
                PoliticoModel(
                  id: '1',
                  quantidadeSeguidores: 8.0,
                ),
              ),
            ),
          ),
        ),
      );
    });

    testWidgets('should build dark mode without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProfileCubit>(
            bloc: mockPoliticProfileCubit,
            page: Scaffold(
              body: PoliticAdditionalInfo(
                PoliticoModel(
                  id: '1',
                  quantidadeSeguidores: 8.0,
                ),
              ),
            ),
          ),
          useDarkMode: true,
        ),
      );
    });

    testWidgets('should show tooltip when clicking on info expenses',
        (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProfileCubit>(
            bloc: mockPoliticProfileCubit,
            page: Scaffold(
              body: PoliticAdditionalInfo(
                PoliticoModel(
                  id: '1',
                  quantidadeSeguidores: 8.0,
                ),
              ),
            ),
          ),
        ),
      );
      final expenseTooltipButton = find.byKey(expensesTooltipKey);
      expect(expenseTooltipButton, findsOneWidget);
      await tester.tap(expenseTooltipButton);
      await tester.pump();
      expect(find.byType(Tooltip), findsOneWidget);
    });

    testWidgets('should go to followers page when clicking qtd',
        (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProfileCubit>(
            bloc: mockPoliticProfileCubit,
            page: Scaffold(
              body: PoliticAdditionalInfo(
                PoliticoModel(
                  id: '1',
                  quantidadeSeguidores: 8.0,
                ),
              ),
            ),
          ),
        ),
      );
      final followersCountButton = find.text(FOLLOWERS);
      expect(followersCountButton, findsOneWidget);
      await tester.ensureVisible(followersCountButton);
      await tester.tap(followersCountButton);
      verify(mockObserver.didPush(any, any));
    });

    testWidgets('should go to politic proposals page when clicking proposals',
        (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProfileCubit>(
            bloc: mockPoliticProfileCubit,
            page: Scaffold(
              body: PoliticAdditionalInfo(
                PoliticoModel(
                  id: '1',
                  quantidadeSeguidores: 8.0,
                  totalProposicoes: 30,
                ),
              ),
            ),
          ),
        ),
      );
      final proposalsCountButton = find.text(PROJECTS_PARTICIPATIONS);
      expect(proposalsCountButton, findsOneWidget);
      await tester.ensureVisible(proposalsCountButton);
      await tester.tap(proposalsCountButton);
      verify(mockObserver.didPush(any, any));
    });

    testWidgets(
        'should go to politic comparativo ranking page when clicking position',
        (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProfileCubit>(
            bloc: mockPoliticProfileCubit,
            page: Scaffold(
              body: PoliticAdditionalInfo(
                PoliticoModel(
                  id: '1',
                  quantidadeSeguidores: 8.0,
                  totalProposicoes: 30,
                ),
              ),
            ),
          ),
        ),
      );
      final positionButton = find.text(WITH_LESS_EXPENSES);
      expect(positionButton, findsOneWidget);
      await tester.ensureVisible(positionButton);
      await tester.tap(positionButton);
      verify(mockObserver.didPush(any, any));
    });

    testWidgets('should go to politic expenses page when clicking position',
        (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProfileCubit>(
            bloc: mockPoliticProfileCubit,
            page: Scaffold(
              body: PoliticAdditionalInfo(
                PoliticoModel(
                  id: '1',
                  quantidadeSeguidores: 8.0,
                  totalProposicoes: 30,
                ),
              ),
            ),
          ),
        ),
      );
      final expensesButton = find.text(EXPENSES);
      expect(expensesButton, findsOneWidget);
      await tester.ensureVisible(expensesButton);
      await tester.tap(expensesButton);
      verify(mockObserver.didPush(any, any));
    });
  });
}
