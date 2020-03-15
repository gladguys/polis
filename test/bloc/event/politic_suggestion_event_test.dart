import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/politic_suggestion/bloc.dart';
import 'package:polis/model/politico_model.dart';

void main() {
  group('PoliticSuggestionEvent tests', () {
    group('FetchSuggestedPolitics tests', () {
      test('props', () {
        final ev1 = FetchSuggestedPolitics();
        final ev2 = FetchSuggestedPolitics();

        expect(ev1, ev2);
      });
    });

    group('FollowOrUnfollowPolitic tests', () {
      test('props', () {
        final ev1 = FollowOrUnfollowPolitic(PoliticoModel(id: '1'));
        final ev2 = FollowOrUnfollowPolitic(PoliticoModel(id: '1'));
        final ev3 = FollowOrUnfollowPolitic(PoliticoModel(id: '2'));

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });
  });
}