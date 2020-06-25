import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';

void main() {
  group('SearchPoliticState tests', () {
    test('states', () {
      expect(InitialSearchPoliticState(), InitialSearchPoliticState());
      expect(FetchSearchPoliticsSuccess([]), FetchSearchPoliticsSuccess([]));
      expect(LoadingFetchPolitics(), LoadingFetchPolitics());
      expect(FetchSearchPoliticsFailed(), FetchSearchPoliticsFailed());
      expect(
        SearchPoliticFilterChanged(
          politics: [],
          partidoPicked: 'PT',
          statePicked: 'CE',
          searchTerm: 'Lu',
        ),
        SearchPoliticFilterChanged(
          politics: [],
          partidoPicked: 'PT',
          statePicked: 'CE',
          searchTerm: 'Lu',
        ),
      );

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
  });
}
