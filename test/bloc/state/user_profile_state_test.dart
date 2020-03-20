import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/politico_model.dart';

void main() {
  group('UserProfileState tests', () {
    group('InitialUserProfileState', () {
      test('props', () {
        expect(InitialUserProfileState(), InitialUserProfileState());
      });
    });

    group('FetchUserRelatedInfoSuccess', () {
      test('props', () {
        final st1 = FetchUserRelatedInfoSuccess(
            politicsFollowing: [], userActivities: []);
        final st2 = FetchUserRelatedInfoSuccess(
            politicsFollowing: [], userActivities: []);
        final st3 = FetchUserRelatedInfoSuccess(
            politicsFollowing: [PoliticoModel()], userActivities: []);
        expect(st1, st2);
        expect(st1 == st3, false);
      });

      test('assert', () {
        expect(
            () => FetchUserRelatedInfoSuccess(
                politicsFollowing: null, userActivities: []),
            throwsAssertionError);
        expect(
            () => FetchUserRelatedInfoSuccess(
                politicsFollowing: [], userActivities: null),
            throwsAssertionError);
      });
    });

    group('FetchUserRelatedInfoFailed', () {
      test('props', () {
        expect(FetchUserRelatedInfoFailed(), FetchUserRelatedInfoFailed());
      });
    });

    group('LoadingFetchUserInfo', () {
      test('props', () {
        expect(LoadingFetchUserInfo(), LoadingFetchUserInfo());
      });
    });
  });
}
