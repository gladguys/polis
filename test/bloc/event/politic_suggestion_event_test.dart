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

    group('AddPoliticToFollowedPolitics tests', () {
      test('props', () {
        final ev1 = AddPoliticToFollowedPolitics(PoliticoModel(id: '1'));
        final ev2 = AddPoliticToFollowedPolitics(PoliticoModel(id: '1'));
        final ev3 = AddPoliticToFollowedPolitics(PoliticoModel(id: '2'));

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });

    group('RemovePoliticFromFollowedPolitics tests', () {
      test('props', () {
        final ev1 = RemovePoliticFromFollowedPolitics(PoliticoModel(id: '1'));
        final ev2 = RemovePoliticFromFollowedPolitics(PoliticoModel(id: '1'));
        final ev3 = RemovePoliticFromFollowedPolitics(PoliticoModel(id: '2'));

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });
  });
}
