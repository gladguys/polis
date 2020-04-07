import 'package:flutter_test/flutter_test.dart';
import 'package:polis/page/search_politic/widgets/search_politics.dart';

import '../mock.dart';

void main() {
  group('PopupFilterSearch tests', () {
    test('assert', () {
      expect(
          () => PopupFilterSearch(
                partidos: null,
                searchPoliticBloc: MockSearchPoliticBloc(),
              ),
          throwsAssertionError);
      expect(
          () => PopupFilterSearch(
                partidos: [],
                searchPoliticBloc: null,
              ),
          throwsAssertionError);
    });
  });
}
