import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/model/models.dart';

void main() {
  group('UserProfileState tests', () {
    group('InitialUserProfileState', () {
      test('props', () {
        expect(InitialUserProfileState(), InitialUserProfileState());
      });
    });

    group('FetchUserRelatedInfoSuccess', () {
      test('props', () {
        final st1 =
            FetchUserRelatedInfoSuccess(politicsFollowing: [], userActions: []);
        final st2 =
            FetchUserRelatedInfoSuccess(politicsFollowing: [], userActions: []);
        final st3 = FetchUserRelatedInfoSuccess(
            politicsFollowing: [PoliticoModel()], userActions: []);
        expect(st1, st2);
        expect(st1 == st3, false);
      });

      test('assert', () {
        expect(
            () => FetchUserRelatedInfoSuccess(
                politicsFollowing: null, userActions: []),
            throwsAssertionError);
        expect(
            () => FetchUserRelatedInfoSuccess(
                politicsFollowing: [], userActions: null),
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
