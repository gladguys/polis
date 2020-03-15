import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/politic_suggestion/bloc.dart';
import 'package:polis/model/politico_model.dart';

void main() {
  group('PoliticSuggestionState tests', () {
    test('states', () {
      expect(InitialPoliticSuggestionState(), InitialPoliticSuggestionState());
      expect(
          FetchSuggestedPoliticsSuccess([]), FetchSuggestedPoliticsSuccess([]));
      expect(FetchSuggestedPoliticsFailed(), FetchSuggestedPoliticsFailed());
      expect(LoadingFetch(), LoadingFetch());
      expect(ChangedPoliticsFollowingStatus(PoliticoModel()),
          ChangedPoliticsFollowingStatus(PoliticoModel()));
      expect(ChangedPoliticsFollowingStatus(PoliticoModel(), isFollowing: true),
          ChangedPoliticsFollowingStatus(PoliticoModel(), isFollowing: true));
      expect(
          ChangedPoliticsFollowingStatus(PoliticoModel(), isFollowing: true) ==
              ChangedPoliticsFollowingStatus(PoliticoModel(),
                  isFollowing: false),
          false);
    });
  });
}
