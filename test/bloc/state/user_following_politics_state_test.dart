import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/model/models.dart';

void main() {
  group('UserFollowingPoliticsState tests', () {
    test('states', () {
      expect(InitialUserFollowingPoliticsState(),
          InitialUserFollowingPoliticsState());
      expect(FetchPoliticsSuccess([]), FetchPoliticsSuccess([]));
      expect(FetchPoliticsFailed(), FetchPoliticsFailed());
      expect(FollowUnfollowFailed(), FollowUnfollowFailed());
      expect(LoadingPolitics(), LoadingPolitics());
      expect(
        UserFollowingPoliticChanged(
          politico: PoliticoModel(),
          isUserFollowingPolitic: true,
        ),
        UserFollowingPoliticChanged(
          politico: PoliticoModel(),
          isUserFollowingPolitic: true,
        ),
      );

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
      expect(
          () => UserFollowingPoliticChanged(
                politico: null,
                isUserFollowingPolitic: true,
              ),
          throwsAssertionError);
      expect(
          () => UserFollowingPoliticChanged(
                politico: PoliticoModel(),
                isUserFollowingPolitic: null,
              ),
          throwsAssertionError);
    });
  });
}
