import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/models.dart';

void main() {
  group('PoliticProfileState tests', () {
    test('states', () {
      expect(InitialPoliticProfileState(), InitialPoliticProfileState());
      expect(GetPoliticInfoSuccess(politic: PoliticoModel()),
          GetPoliticInfoSuccess(politic: PoliticoModel()));
      expect(GetPoliticInfoFailed(), GetPoliticInfoFailed());
      expect(LoadingPoliticInfo(), LoadingPoliticInfo());
    });
  });
}
