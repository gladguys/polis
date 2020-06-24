import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/keys.dart';
import 'package:polis/page/search_politic/widgets/search_politics.dart';

import '../mock.dart';
import '../utils.dart';

void main() {
  group('SearchPolitics tests', () {
    test('assert', () {
      expect(
          () => SearchPolitics(
                partidos: null,
                politics: [],
              ),
          throwsAssertionError);

      expect(
          () => SearchPolitics(
                partidos: [],
                politics: null,
              ),
          throwsAssertionError);
    });

    testWidgets('clicking on button should rebuild the component',
        (tester) async {
      final mockSearchPoliticBloc = MockSearchPoliticBloc();
      await tester.pumpWidget(
        connectedWidget(
          PopupFilterSearch(
            partidos: [],
            searchPoliticBloc: mockSearchPoliticBloc,
          ),
          withScaffold: true,
        ),
      );
      final btn = find.byKey(searchPoliticsSlidersIconKey);
      await tester.tap(btn);
      await tester.pump();
    });

    testWidgets('should pick another partido from the select', (tester) async {
      final mockSearchPoliticBloc = MockSearchPoliticBloc();
      await tester.pumpWidget(
        connectedWidget(
          PopupFilterSearch(
            partidos: [],
            searchPoliticBloc: mockSearchPoliticBloc,
          ),
          withScaffold: true,
        ),
      );
      final btn = find.byKey(searchPoliticsSlidersIconKey);
      await tester.tap(btn);
      await tester.pumpAndSettle();
      final partido = find.text('Partido');
      expect(partido, findsOneWidget);
      await tester.tap(partido);
      await tester.pumpAndSettle();
      final todos = find.text('Todos');
      expect(todos, findsOneWidget);
      await tester.tap(todos);
    });

    testWidgets('should pick another estado from the select', (tester) async {
      final mockSearchPoliticBloc = MockSearchPoliticBloc();
      await tester.pumpWidget(
        connectedWidget(
          PopupFilterSearch(
            partidos: [],
            searchPoliticBloc: mockSearchPoliticBloc,
          ),
          withScaffold: true,
        ),
      );
      final btn = find.byKey(searchPoliticsSlidersIconKey);
      await tester.tap(btn);
      await tester.pumpAndSettle();
      final partido = find.text('Estado');
      expect(partido, findsOneWidget);
      await tester.tap(partido);
      await tester.pumpAndSettle();
      final todos = find.text('Todos');
      expect(todos, findsOneWidget);
      await tester.tap(todos);
    });
  });
}
