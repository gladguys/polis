import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/exception/exceptions.dart';

import '../mock.dart';

void main() {
  group('EditProfileBloc tests', () {
    ChangePasswordCubit changePasswordCubit;
    MockChangePasswordRepository mockChangePasswordRepository;

    setUp(() {
      mockChangePasswordRepository = MockChangePasswordRepository();
      changePasswordCubit = ChangePasswordCubit(
        repository: mockChangePasswordRepository,
      );
    });

    tearDown(() {
      changePasswordCubit?.close();
    });

    test('asserts', () {
      expect(() => ChangePasswordCubit(repository: null), throwsAssertionError);
    });

    test('''Expects InitialChangePasswordState to be the initial state''', () {
      expect(changePasswordCubit.state, equals(InitialChangePasswordState()));
    });

    blocTest(
      '''Expects [UserPasswordChanging, UserPasswordChangeSuccess] when ChangeUserPassword called''',
      build: () {
        when(
          mockChangePasswordRepository.changeUserPassword(
            currentPassword: 'current',
            newPassword: 'newOne',
          ),
        ).thenAnswer((_) async => {});
        return changePasswordCubit;
      },
      act: (changePasswordCubit) async =>
          changePasswordCubit.changeUserPassword(
        currentPassword: 'current',
        newPassword: 'newOne',
      ),
      expect: [
        UserPasswordChanging(),
        UserPasswordChangeSuccess(),
      ],
      verify: (changePasswordCubit) async {
        verify(
          mockChangePasswordRepository.changeUserPassword(
            currentPassword: 'current',
            newPassword: 'newOne',
          ),
        ).called(1);
      },
    );

    blocTest(
      '''Expects [UserPasswordChanging, UserWrongPasswordInformed] when current password is wrong''',
      build: () {
        when(
          mockChangePasswordRepository.changeUserPassword(
            currentPassword: 'current',
            newPassword: 'newOne',
          ),
        ).thenThrow(WrongPasswordException());
        return changePasswordCubit;
      },
      act: (changePasswordCubit) async =>
          changePasswordCubit.changeUserPassword(
        currentPassword: 'current',
        newPassword: 'newOne',
      ),
      expect: [
        UserPasswordChanging(),
        UserWrongPasswordInformed(),
      ],
      verify: (changePasswordCubit) async {
        verify(
          mockChangePasswordRepository.changeUserPassword(
            currentPassword: 'current',
            newPassword: 'newOne',
          ),
        ).called(1);
      },
    );

    blocTest(
      '''Expects [UserPasswordChanging, UserPasswordChangeFailed] when some exception is thrown''',
      build: () {
        when(
          mockChangePasswordRepository.changeUserPassword(
            currentPassword: 'current',
            newPassword: 'newOne',
          ),
        ).thenThrow(Exception());
        return changePasswordCubit;
      },
      act: (changePasswordCubit) async =>
          changePasswordCubit.changeUserPassword(
        currentPassword: 'current',
        newPassword: 'newOne',
      ),
      expect: [
        UserPasswordChanging(),
        UserPasswordChangeFailed(),
      ],
      verify: (changePasswordCubit) async {
        verify(mockChangePasswordRepository.changeUserPassword(
          currentPassword: 'current',
          newPassword: 'newOne',
        )).called(1);
      },
    );
  });
}
