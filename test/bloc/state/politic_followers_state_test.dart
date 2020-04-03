import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/politic_followers/bloc.dart';

void main() {
  group('PoliticFollowersState tests', () {
    test('states', () {
      expect(InitialPoliticFollowersState(), InitialPoliticFollowersState());
      expect(GetPoliticFollowersSuccess(followers: []),
          GetPoliticFollowersSuccess(followers: []));
      expect(GetPoliticFollowersFailed(), GetPoliticFollowersFailed());
      expect(LoadingPoliticFollowers(), LoadingPoliticFollowers());
    });
  });
}