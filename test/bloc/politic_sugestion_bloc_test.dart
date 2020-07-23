import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/model/models.dart';

import '../mock.dart';

void main() {
  group('PoliticSuggestionBloc tests', () {
    PoliticSuggestionCubit politicSuggestionCubit;
    MockPoliticSugestionRepository mockPoliticSugestionRepository;
    MockUserRepository mockUserRepository;

    setUp(() {
      mockPoliticSugestionRepository = MockPoliticSugestionRepository();
      mockUserRepository = MockUserRepository();
      politicSuggestionCubit = PoliticSuggestionCubit(
        politicSuggestionRepository: mockPoliticSugestionRepository,
        userRepository: mockUserRepository,
      );
    });

    tearDown(() {
      politicSuggestionCubit?.close();
    });

    test('asserts', () {
      expect(
          () => PoliticSuggestionCubit(
                politicSuggestionRepository: null,
                userRepository: mockUserRepository,
              ),
          throwsAssertionError);

      expect(
          () => PoliticSuggestionCubit(
                politicSuggestionRepository: mockPoliticSugestionRepository,
                userRepository: null,
              ),
          throwsAssertionError);
    });

    test('Expects InitialSignin to be the initial state', () {
      expect(politicSuggestionCubit.state,
          equals(InitialPoliticSuggestionState()));
    });

    test('isPoliticBeenFollowed', () {
      expect(
        politicSuggestionCubit.isPoliticBeenFollowed(PoliticoModel(id: '1')),
        false,
      );
      politicSuggestionCubit.followedPolitics.add(PoliticoModel(id: '1'));
      expect(
        politicSuggestionCubit.isPoliticBeenFollowed(PoliticoModel(id: '1')),
        true,
      );
    });

    group('FetchSuggestedPolitics event', () {
      blocTest(
        'Expects [LoadingFetch, FetchSuggestedPoliticsSuccess] when success',
        build: () {
          when(mockPoliticSugestionRepository.getSuggestedPolitics(any))
              .thenAnswer((_) => Future.value([]));
          return politicSuggestionCubit;
        },
        act: (politicSuggestionCubit) {
          politicSuggestionCubit.fetchSuggestedPolitics('T');
          return;
        },
        verify: (politicSuggestionCubit) async {
          verify(mockPoliticSugestionRepository.getSuggestedPolitics('T'))
              .called(1);
        },
        expect: [
          LoadingFetch(),
          FetchSuggestedPoliticsSuccess([]),
        ],
      );

      blocTest(
        'Expects [LoadingFetch, FetchSuggestedPoliticsFailed] when fails',
        build: () {
          when(mockPoliticSugestionRepository.getSuggestedPolitics(any))
              .thenThrow(Exception());
          return politicSuggestionCubit;
        },
        act: (politicSuggestionCubit) {
          politicSuggestionCubit.fetchSuggestedPolitics('T');
          return;
        },
        verify: (politicSuggestionCubit) async {
          verify(mockPoliticSugestionRepository.getSuggestedPolitics('T'))
              .called(1);
        },
        expect: [
          LoadingFetch(),
          FetchSuggestedPoliticsFailed(),
        ],
      );
    });

    group('FollowOrUnfollowPolitic event', () {
      blocTest(
        'Expects followedPolitics size to be 1 after adding 1',
        build: () => politicSuggestionCubit,
        act: (politicSuggestionCubit) {
          politicSuggestionCubit
              .followOrUnfollowPolitic(PoliticoModel(id: '1'));
          return;
        },
        verify: (politicSuggestionCubit) async {
          expect(politicSuggestionCubit.followedPolitics.length, 1);
        },
        expect: [
          ChangedPoliticsFollowingStatus(PoliticoModel(id: '1'),
              isFollowing: true),
        ],
      );

      blocTest(
        'Expects followedPolitics size to be 0 after adding and removing',
        build: () => politicSuggestionCubit,
        act: (politicSuggestionCubit) {
          politicSuggestionCubit
              .followOrUnfollowPolitic(PoliticoModel(id: '1'));
          politicSuggestionCubit
              .followOrUnfollowPolitic(PoliticoModel(id: '1'));
          return;
        },
        verify: (politicSuggestionCubit) async {
          expect(politicSuggestionCubit.followedPolitics.length, 0);
        },
        expect: [
          ChangedPoliticsFollowingStatus(PoliticoModel(id: '1'),
              isFollowing: true),
          ChangedPoliticsFollowingStatus(PoliticoModel(id: '1'),
              isFollowing: false),
        ],
      );
    });

    group('SavePoliticsToFollow event', () {
      blocTest(
        '''Expects [LoadingSaveFollowPolitics, SavedSuggestedPolitics] when success''',
        build: () => politicSuggestionCubit,
        act: (politicSuggestionCubit) {
          politicSuggestionCubit.savePoliticsToFollow(
            user: UserModel(
              userId: '1',
            ),
          );
          return;
        },
        verify: (politicSuggestionCubit) async {
          verify(mockPoliticSugestionRepository
              .savePoliticsToFollow(userId: '1', politics: [])).called(1);
          verify(mockPoliticSugestionRepository.saveFollowerToPolitics(
              user: UserModel(userId: '1'), politics: [])).called(1);
          verify(mockUserRepository.setFirstLoginDone(UserModel(userId: '1')))
              .called(1);
        },
        expect: [
          LoadingSaveFollowPolitics(),
          SavedSuggestedPolitics(),
        ],
      );

      blocTest(
        '''Expects [LoadingSaveFollowPolitics, SaveSuggestedPoliticsFailed] when fails''',
        build: () {
          when(mockPoliticSugestionRepository.savePoliticsToFollow(
                  userId: anyNamed('userId'), politics: anyNamed('politics')))
              .thenThrow(Exception());
          return politicSuggestionCubit;
        },
        act: (politicSuggestionCubit) {
          politicSuggestionCubit.savePoliticsToFollow(
            user: UserModel(
              userId: '1',
            ),
          );
          return;
        },
        verify: (politicSuggestionCubit) async {
          verify(mockPoliticSugestionRepository
              .savePoliticsToFollow(userId: '1', politics: [])).called(1);
        },
        expect: [
          LoadingSaveFollowPolitics(),
          SaveSuggestedPoliticsFailed(),
        ],
      );
    });
  });
}
