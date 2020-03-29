import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/politico_model.dart';

void main() {
  group('SearchPoliticState tests', () {
    test('states', () {
      expect(InitialSearchPoliticState(), InitialSearchPoliticState());
      expect(FetchSearchPoliticsSuccess([]), FetchSearchPoliticsSuccess([]));
      expect(LoadingFetchPolitics(), LoadingFetchPolitics());
      expect(FetchSearchPoliticsFailed(), FetchSearchPoliticsFailed());
      expect(SearchPoliticFilterChanged([]), SearchPoliticFilterChanged([]));

      expect(
          FollowedSearchPoliticsUpdated(
              isFollowing: true,
              followedPolitics: [PoliticoModel()],
              politicoUpdated: PoliticoModel()),
          FollowedSearchPoliticsUpdated(
              isFollowing: true,
              followedPolitics: [PoliticoModel()],
              politicoUpdated: PoliticoModel()));

      expect(FollowUnfollowPoliticsFailed(), FollowUnfollowPoliticsFailed());
    });

    test('asserts', () {
      expect(
          () => FollowedSearchPoliticsUpdated(
                politicoUpdated: null,
                followedPolitics: [],
                isFollowing: true,
              ),
          throwsAssertionError);
      expect(
          () => FollowedSearchPoliticsUpdated(
                politicoUpdated: PoliticoModel(),
                followedPolitics: null,
                isFollowing: true,
              ),
          throwsAssertionError);
      expect(
          () => FollowedSearchPoliticsUpdated(
                politicoUpdated: PoliticoModel(),
                followedPolitics: [],
                isFollowing: null,
              ),
          throwsAssertionError);
    });
  });
}
