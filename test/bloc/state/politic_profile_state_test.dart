import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/model/models.dart';

void main() {
  group('PoliticProfileState tests', () {
    test('asserts', () {
      expect(
          () => GetPoliticInfoSuccess(
                politic: null,
                lastActivities: [],
                activitiesCount: 0,
                isBeingFollowedByUser: true,
              ),
          throwsAssertionError);

      expect(
          () => GetPoliticInfoSuccess(
                politic: PoliticoModel(),
                lastActivities: null,
                activitiesCount: 0,
                isBeingFollowedByUser: true,
              ),
          throwsAssertionError);

      expect(
          () => GetPoliticInfoSuccess(
                politic: PoliticoModel(),
                lastActivities: [],
                activitiesCount: null,
                isBeingFollowedByUser: true,
              ),
          throwsAssertionError);

      expect(
          () => GetPoliticInfoSuccess(
                politic: PoliticoModel(),
                lastActivities: [],
                activitiesCount: 0,
                isBeingFollowedByUser: null,
              ),
          throwsAssertionError);

      expect(() => PoliticMoreActivitiesSuccess(activities: null),
          throwsAssertionError);
    });

    test('states', () {
      expect(InitialPoliticProfileState(), InitialPoliticProfileState());
      expect(
        GetPoliticInfoSuccess(
          politic: PoliticoModel(),
          lastActivities: [],
          activitiesCount: 0,
          isBeingFollowedByUser: true,
        ),
        GetPoliticInfoSuccess(
          politic: PoliticoModel(),
          lastActivities: [],
          activitiesCount: 0,
          isBeingFollowedByUser: true,
        ),
      );
      expect(GetPoliticInfoFailed(), GetPoliticInfoFailed());
      expect(PoliticDontHaveValidEmail(), PoliticDontHaveValidEmail());
      expect(OpenEmailIntentFailed(), OpenEmailIntentFailed());
      expect(LoadingPoliticInfo(), LoadingPoliticInfo());
      expect(PoliticMoreActivitiesSuccess(activities: []),
          PoliticMoreActivitiesSuccess(activities: []));
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
    });
  });
}
