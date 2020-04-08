import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/models.dart';

void main() {
  group('PoliticProfileState tests', () {
    test('asserts', () {
      expect(
          () => GetPoliticInfoSuccess(
                politic: null,
                lastActivities: [],
                isBeingFollowedByUser: true,
              ),
          throwsAssertionError);

      expect(
          () => GetPoliticInfoSuccess(
                politic: PoliticoModel(),
                lastActivities: null,
                isBeingFollowedByUser: true,
              ),
          throwsAssertionError);

      expect(
          () => GetPoliticInfoSuccess(
                politic: PoliticoModel(),
                lastActivities: [],
                isBeingFollowedByUser: null,
              ),
          throwsAssertionError);
    });

    test('states', () {
      expect(InitialPoliticProfileState(), InitialPoliticProfileState());
      expect(
        GetPoliticInfoSuccess(
          politic: PoliticoModel(),
          lastActivities: [],
          isBeingFollowedByUser: true,
        ),
        GetPoliticInfoSuccess(
          politic: PoliticoModel(),
          lastActivities: [],
          isBeingFollowedByUser: true,
        ),
      );
      expect(GetPoliticInfoFailed(), GetPoliticInfoFailed());
      expect(LoadingPoliticInfo(), LoadingPoliticInfo());
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
