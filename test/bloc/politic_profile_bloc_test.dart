import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/models.dart';

import '../mock.dart';

void main() {
  group('PoliticProfileBloc tests', () {
    PoliticProfileBloc politicProfileBloc;
    MockPoliticProfileRepository mockPoliticProfileRepository;

    setUp(() {
      mockPoliticProfileRepository = MockPoliticProfileRepository();
      politicProfileBloc = PoliticProfileBloc(
        repository: mockPoliticProfileRepository,
      );
    });

    test('asserts', () {
      expect(
          () => PoliticProfileBloc(
                repository: null,
              ),
          throwsAssertionError);
    });

    test('Expects InitialPoliticProfileState to be the initial state', () {
      expect(politicProfileBloc.state, equals(InitialPoliticProfileState()));
    });

    group('GetPoliticInfo event', () {
      blocTest(
        '''Expects [LoadingPoliticInfo, GetPoliticInfoSuccess] when success''',
        build: () async {
          when(mockPoliticProfileRepository.getInfoPolitic('1')).thenAnswer(
            (_) => Future.value(
              PoliticoModel(
                id: '1',
              ),
            ),
          );
          return politicProfileBloc;
        },
        act: (politicProfileBloc) {
          politicProfileBloc.add(GetPoliticInfo('1'));
          return;
        },
        verify: (politicProfileBloc) async {
          verify(mockPoliticProfileRepository.getInfoPolitic('1')).called(1);
        },
        expect: [
          LoadingPoliticInfo(),
          GetPoliticInfoSuccess(
            politic: PoliticoModel(
              id: '1',
            ),
          ),
        ],
      );

      blocTest(
        '''Expects [LoadingPoliticInfo, GetPoliticInfoFailed] when fails''',
        build: () async {
          when(mockPoliticProfileRepository.getInfoPolitic('1'))
              .thenThrow(Exception());
          return politicProfileBloc;
        },
        act: (politicProfileBloc) {
          politicProfileBloc.add(GetPoliticInfo('1'));
          return;
        },
        verify: (politicProfileBloc) async {
          verify(mockPoliticProfileRepository.getInfoPolitic('1')).called(1);
        },
        expect: [
          LoadingPoliticInfo(),
          GetPoliticInfoFailed(),
        ],
      );
    });
  });
}
