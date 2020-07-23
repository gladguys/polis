import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/model/models.dart';

void main() {
  group('PoliticSuggestionState tests', () {
    test('states', () {
      expect(InitialPoliticSuggestionState(), InitialPoliticSuggestionState());
      expect(
          FetchSuggestedPoliticsSuccess([]), FetchSuggestedPoliticsSuccess([]));
      expect(FetchSuggestedPoliticsFailed(), FetchSuggestedPoliticsFailed());
      expect(LoadingFetch(), LoadingFetch());
      expect(LoadingSaveFollowPolitics(), LoadingSaveFollowPolitics());
      expect(SavedSuggestedPolitics(), SavedSuggestedPolitics());
      expect(SaveSuggestedPoliticsFailed(), SaveSuggestedPoliticsFailed());
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
