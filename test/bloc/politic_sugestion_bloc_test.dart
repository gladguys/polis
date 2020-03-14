import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/politic_suggestion/bloc.dart';
import 'package:polis/model/politico_model.dart';

import '../mock.dart';

void main() {
  group('PoliticSuggestionBloc tests', () {
    PoliticSuggestionBloc politicSuggestionBloc;
    MockPoliticSugestionRepository mockPoliticSugestionRepository;

    setUp(() {
      mockPoliticSugestionRepository = MockPoliticSugestionRepository();
      politicSuggestionBloc =
          PoliticSuggestionBloc(repository: mockPoliticSugestionRepository);
    });

    test('asserts', () {
      expect(
          () => PoliticSuggestionBloc(repository: null), throwsAssertionError);
    });

    test('Expects InitialSignin to be the initial state', () {
      expect(
          politicSuggestionBloc.state, equals(InitialPoliticSuggestionState()));
    });

    test('isPoliticBeenFollowed', () {
      expect(
        politicSuggestionBloc.isPoliticBeenFollowed(PoliticoModel(id: '1')),
        false,
      );
      politicSuggestionBloc.followedPolitics.add(PoliticoModel(id: '1'));
      expect(
        politicSuggestionBloc.isPoliticBeenFollowed(PoliticoModel(id: '1')),
        true,
      );
    });

    group('FetchSuggestedPolitics event', () {
      blocTest(
        'Expects [LoadingFetch, FetchSuggestedPoliticsSuccess] when success',
        build: () async {
          when(mockPoliticSugestionRepository.getSuggestedPolitics())
              .thenAnswer((_) => Future.value([]));
          return politicSuggestionBloc;
        },
        act: (politicSuggestionBloc) {
          politicSuggestionBloc.add(FetchSuggestedPolitics());
          return;
        },
        verify: (politicSuggestionBloc) async {
          verify(mockPoliticSugestionRepository.getSuggestedPolitics())
              .called(1);
        },
        expect: [
          LoadingFetch(),
          FetchSuggestedPoliticsSuccess([]),
        ],
      );

      blocTest(
        'Expects [LoadingFetch, FetchSuggestedPoliticsFailed] when fails',
        build: () async {
          when(mockPoliticSugestionRepository.getSuggestedPolitics())
              .thenThrow(Exception());
          return politicSuggestionBloc;
        },
        act: (politicSuggestionBloc) {
          politicSuggestionBloc.add(FetchSuggestedPolitics());
          return;
        },
        verify: (politicSuggestionBloc) async {
          verify(mockPoliticSugestionRepository.getSuggestedPolitics())
              .called(1);
        },
        expect: [
          LoadingFetch(),
          FetchSuggestedPoliticsFailed(),
        ],
      );
    });

    group('AddPoliticToFollowedPolitics event', () {
      blocTest(
        'Expects followedPolitics size to be 1 after adding 1',
        build: () async => politicSuggestionBloc,
        act: (politicSuggestionBloc) {
          politicSuggestionBloc
              .add(AddPoliticToFollowedPolitics(PoliticoModel(id: '1')));
          return;
        },
        verify: (politicSuggestionBloc) async {
          expect(politicSuggestionBloc.followedPolitics.length, 1);
        },
        expect: [
          ChangedPoliticsFollowingStatus(PoliticoModel(id: '1'),
              isFollowing: true),
        ],
      );
    });

    group('AddPoliticToFollowedPolitics event', () {
      blocTest(
        'Expects followedPolitics size to be 0 after removing 1',
        build: () async => politicSuggestionBloc,
        act: (politicSuggestionBloc) {
          politicSuggestionBloc
              .add(AddPoliticToFollowedPolitics(PoliticoModel(id: '1')));
          politicSuggestionBloc
              .add(RemovePoliticFromFollowedPolitics(PoliticoModel(id: '1')));
          return;
        },
        verify: (politicSuggestionBloc) async {
          expect(politicSuggestionBloc.followedPolitics.length, 0);
        },
        expect: [
          ChangedPoliticsFollowingStatus(PoliticoModel(id: '1'),
              isFollowing: true),
          ChangedPoliticsFollowingStatus(PoliticoModel(id: '1'),
              isFollowing: false),
        ],
      );
    });
  });
}
