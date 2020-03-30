import 'package:flutter_test/flutter_test.dart';
import 'package:polis/page/search_politic/widgets/search_politics.dart';

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
  });
}
