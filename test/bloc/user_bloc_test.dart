import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/enum/configuracao.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/exception/exceptions.dart';

import '../mock.dart';

void main() {
  final user = UserModel(userId: '1');

  group('UserBloc tests', () {
    UserCubit userCubit;
    MockUserRepository mockUserRepository;
    MockAnalyticsService mockAnalyticsService;
    MockSharedPreferencesService mockSharedPreferencesService;

    setUp(() {
      mockUserRepository = MockUserRepository();
      mockAnalyticsService = MockAnalyticsService();
      mockSharedPreferencesService = MockSharedPreferencesService();
      mockUserRepository = MockUserRepository();
      userCubit = UserCubit(
        user: user,
        repository: mockUserRepository,
        analyticsService: mockAnalyticsService,
        sharedPreferencesService: mockSharedPreferencesService,
      );
    });

    tearDown(() {
      userCubit?.close();
    });

    test('test asserts', () {
      expect(
          () => UserCubit(
                user: UserModel(),
                repository: null,
                analyticsService: mockAnalyticsService,
                sharedPreferencesService: mockSharedPreferencesService,
              ),
          throwsAssertionError);
      expect(
          () => UserCubit(
                repository: mockUserRepository,
                user: null,
                analyticsService: mockAnalyticsService,
                sharedPreferencesService: mockSharedPreferencesService,
              ),
          throwsAssertionError);
      expect(
          () => UserCubit(
                repository: mockUserRepository,
                user: UserModel(),
                analyticsService: null,
                sharedPreferencesService: mockSharedPreferencesService,
              ),
          throwsAssertionError);
      expect(
          () => UserCubit(
                repository: mockUserRepository,
                user: UserModel(),
                analyticsService: mockAnalyticsService,
                sharedPreferencesService: null,
              ),
          throwsAssertionError);
    });

    test('Expects InitialUser to be the initial state', () {
      expect(userCubit.state, equals(InitialUser()));
    });

    blocTest(
      '''Expects to logout user, send analytics metrics and set shared preferences user to null when Logout added''',
      build: () {
        when(mockUserRepository.signOut()).thenAnswer((_) => Future.value());
        return userCubit;
      },
      act: (userCubit) {
        userCubit.logout();
        return;
      },
      expect: [
        SignoutLoading(),
        SignoutSucceded(),
        InitialUser(),
      ],
      verify: (userCubit) async {
        verify(mockUserRepository.signOut()).called(1);
        verify(mockAnalyticsService.logLogout(any)).called(1);
        verify(mockSharedPreferencesService.setUser(null)).called(1);
      },
    );

    blocTest(
      'Expects [CurrentUserUpdated] when UpdateCurrentUser added',
      build: () => userCubit,
      act: (userCubit) {
        userCubit.updateCurrentUser(UserModel());
        return;
      },
      expect: [
        CurrentUserUpdated(UserModel()),
      ],
      verify: (userCubit) async {
        verify(mockSharedPreferencesService.setUser(UserModel())).called(1);
      },
    );

    blocTest(
      'Expects [SignoutLoading, SignoutFailed] when Logout fails',
      build: () {
        when(mockUserRepository.signOut()).thenThrow(SignOutException());
        return userCubit;
      },
      act: (userCubit) {
        userCubit.logout();
        return;
      },
      verify: (userCubit) async {
        verify(mockUserRepository.signOut()).called(1);
      },
      expect: [
        SignoutLoading(),
        SignoutFailed(),
      ],
    );

    blocTest(
      'Expects [CurrentUserConfigUpdated] when updates config',
      build: () {
        when(mockSharedPreferencesService.setUser(any))
            .thenAnswer((_) => Future.value());
        when(mockUserRepository.updateUserConfigs(any))
            .thenAnswer((_) => Future.value());
        return userCubit;
      },
      act: (userCubit) {
        userCubit.changeUserConfig(
          config: Configuracao.isActivityInfoEnabled,
          configValue: true,
          currentUser: UserModel(userId: '1'),
        );
        return;
      },
      expect: [
        CurrentUserConfigUpdated(
          user: UserModel(userId: '1'),
          config: 'isActivityInfoEnabled',
          value: true,
        ),
      ],
    );

    blocTest(
      'Expects [CurrentUserConfigUpdated] when updates config',
      build: () {
        when(mockSharedPreferencesService.setUser(any))
            .thenAnswer((_) => Future.value());
        when(mockUserRepository.updateUserConfigs(any)).thenThrow(Exception());
        return userCubit;
      },
      act: (userCubit) {
        userCubit.changeUserConfig(
          config: Configuracao.isActivityInfoEnabled,
          configValue: true,
          currentUser: UserModel(userId: '1'),
        );
        return;
      },
      expect: [
        UpdateUserConfigFailed(),
      ],
    );

    blocTest(
      'Expects [CurrentUserConfigUpdated] when updates theme',
      build: () => userCubit,
      act: (userCubit) {
        userCubit.setUserPickedTheme(
          UserModel(
            userId: '1',
          ),
        );
        return;
      },
      expect: [
        CurrentUserConfigUpdated(
          user: UserModel(
            userId: '1',
          ),
        ),
      ],
    );
  });
}
