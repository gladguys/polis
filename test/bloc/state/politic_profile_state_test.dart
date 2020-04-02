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
              ),
          throwsAssertionError);

      expect(
          () => GetPoliticInfoSuccess(
                politic: PoliticoModel(),
                lastActivities: null,
              ),
          throwsAssertionError);
    });

    test('states', () {
      expect(InitialPoliticProfileState(), InitialPoliticProfileState());
      expect(
        GetPoliticInfoSuccess(
          politic: PoliticoModel(),
          lastActivities: [],
        ),
        GetPoliticInfoSuccess(
          politic: PoliticoModel(),
          lastActivities: [],
        ),
      );
      expect(GetPoliticInfoFailed(), GetPoliticInfoFailed());
      expect(LoadingPoliticInfo(), LoadingPoliticInfo());
    });
  });
}
