import 'package:flutter_test/flutter_test.dart';
import 'package:polis/page/search_politic/widgets/search_politics.dart';

import '../mock.dart';

void main() {
  group('PopupFilterSearch tests', () {
    test('assert', () {
      expect(
          () => PopupFilterSearch(
                partidos: null,
                searchPoliticCubit: MockSearchPoliticCubit(),
              ),
          throwsAssertionError);
      expect(
          () => PopupFilterSearch(
                partidos: [],
                searchPoliticCubit: null,
              ),
          throwsAssertionError);
    });
  });
}
