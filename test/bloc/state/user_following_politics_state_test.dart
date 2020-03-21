import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/politico_model.dart';

void main() {
  group('UserFollowingPoliticsState tests', () {
    test('states', () {
      expect(InitialUserFollowingPoliticsState(),
          InitialUserFollowingPoliticsState());
      expect(FetchPoliticsSuccess([]), FetchPoliticsSuccess([]));
      expect(LoadingPolitics(), LoadingPolitics());

      expect(
          FollowedPoliticsUpdated(
              isFollowing: true,
              followedPolitics: [PoliticoModel()],
              politicoUpdated: PoliticoModel()),
          FollowedPoliticsUpdated(
              isFollowing: true,
              followedPolitics: [PoliticoModel()],
              politicoUpdated: PoliticoModel()));

      expect(PoliticsFilteredByTerm(filteredPolitics: []),
          PoliticsFilteredByTerm(filteredPolitics: []));
    });

    test('asserts', () {
      expect(
          () => FollowedPoliticsUpdated(
                politicoUpdated: null,
                followedPolitics: [],
                isFollowing: true,
              ),
          throwsAssertionError);
      expect(
          () => FollowedPoliticsUpdated(
                politicoUpdated: PoliticoModel(),
                followedPolitics: null,
                isFollowing: true,
              ),
          throwsAssertionError);
      expect(
          () => FollowedPoliticsUpdated(
                politicoUpdated: PoliticoModel(),
                followedPolitics: [],
                isFollowing: null,
              ),
          throwsAssertionError);
      expect(() => PoliticsFilteredByTerm(filteredPolitics: null),
          throwsAssertionError);
    });
  });
}
