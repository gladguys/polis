import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/model/models.dart';

import '../mock.dart';

void main() {
  group('EditProfileBloc tests', () {
    EditProfileCubit editProfileCubit;
    MockEditProfileRepository mockEditProfileRepository;
    MockUserCubit mockUserCubit;

    setUp(() {
      mockEditProfileRepository = MockEditProfileRepository();
      mockUserCubit = MockUserCubit();
      editProfileCubit = EditProfileCubit(
        repository: mockEditProfileRepository,
        userCubit: mockUserCubit,
      );
    });

    tearDown(() {
      editProfileCubit?.close();
    });

    test('asserts', () {
      expect(
          () => EditProfileCubit(
                repository: null,
                userCubit: mockUserCubit,
              ),
          throwsAssertionError);
      expect(
          () => EditProfileCubit(
                repository: mockEditProfileRepository,
                userCubit: null,
              ),
          throwsAssertionError);
    });

    test('''Expects InitialEditProfileState to be the initial state''', () {
      expect(editProfileCubit.state, equals(InitialEditProfileState()));
    });

    blocTest(
        'Expects [UpdatingUser, UserUpdateSuccess] when UpdateUserInfo called',
        build: () {
          when(
            mockEditProfileRepository.updateUserInfo(
              name: anyNamed('name'),
              email: anyNamed('email'),
              currentUser: anyNamed('currentUser'),
              pickedPhoto: anyNamed('pickedPhoto'),
            ),
          ).thenAnswer(
            (_) => Future.value(
              UserModel(),
            ),
          );
          return editProfileCubit;
        },
        act: (editProfileCubit) async => editProfileCubit.updateUserInfo(
              name: 'name',
              email: 'email',
              currentUser: UserModel(),
              pickedPhoto: null,
            ),
        expect: [
          UpdatingUser(),
          UserUpdateSuccess(),
        ],
        verify: (editProfileCubit) async {
          verify(
            mockEditProfileRepository.updateUserInfo(
              name: anyNamed('name'),
              email: anyNamed('email'),
              currentUser: anyNamed('currentUser'),
              pickedPhoto: anyNamed('pickedPhoto'),
            ),
          ).called(1);
          verify(mockUserCubit.updateCurrentUser(UserModel())).called(1);
        });

    blocTest(
        'Expects [UpdatingUser, UserUpdateFailed] when exceptions is thrown',
        build: () {
          when(
            mockEditProfileRepository.updateUserInfo(
              name: anyNamed('name'),
              email: anyNamed('email'),
              currentUser: anyNamed('currentUser'),
              pickedPhoto: anyNamed('pickedPhoto'),
            ),
          ).thenThrow(Exception());
          return editProfileCubit;
        },
        act: (editProfileCubit) async => editProfileCubit.updateUserInfo(
              name: 'name',
              email: 'email',
              currentUser: UserModel(),
              pickedPhoto: null,
            ),
        expect: [
          UpdatingUser(),
          UserUpdateFailed(),
        ],
        verify: (editProfileCubit) async {
          verify(
            mockEditProfileRepository.updateUserInfo(
              name: anyNamed('name'),
              email: anyNamed('email'),
              currentUser: anyNamed('currentUser'),
              pickedPhoto: anyNamed('pickedPhoto'),
            ),
          ).called(1);
          verifyNever(mockUserCubit.updateCurrentUser(UserModel()));
        });
  });
}
