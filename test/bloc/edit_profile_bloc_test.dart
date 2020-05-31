import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';

import '../mock.dart';

void main() {
  group('EditProfileBloc tests', () {
    EditProfileBloc editProfileBloc;
    MockEditProfileRepository mockEditProfileRepository;
    MockUserBloc mockUserBloc;

    setUp(() {
      mockEditProfileRepository = MockEditProfileRepository();
      mockUserBloc = MockUserBloc();
      editProfileBloc = EditProfileBloc(
        repository: mockEditProfileRepository,
        userBloc: mockUserBloc,
      );
    });

    tearDown(() {
      editProfileBloc?.close();
    });

    test('asserts', () {
      expect(
          () => EditProfileBloc(
                repository: null,
                userBloc: mockUserBloc,
              ),
          throwsAssertionError);
      expect(
          () => EditProfileBloc(
                repository: mockEditProfileRepository,
                userBloc: null,
              ),
          throwsAssertionError);
    });

    test('''Expects InitialEditProfileState to be the initial state''', () {
      expect(editProfileBloc.state, equals(InitialEditProfileState()));
    });

    blocTest(
        'Expects [UpdatingUser, UserUpdateSuccess] when UpdateUserInfo called',
        build: () async {
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
          return editProfileBloc;
        },
        act: (editProfileBloc) async => editProfileBloc.add(
              UpdateUserInfo(
                name: 'name',
                email: 'email',
                currentUser: UserModel(),
                pickedPhoto: null,
              ),
            ),
        expect: [
          UpdatingUser(),
          UserUpdateSuccess(),
        ],
        verify: (editProfileBloc) async {
          verify(
            mockEditProfileRepository.updateUserInfo(
              name: anyNamed('name'),
              email: anyNamed('email'),
              currentUser: anyNamed('currentUser'),
              pickedPhoto: anyNamed('pickedPhoto'),
            ),
          ).called(1);
          verify(mockUserBloc.add(UpdateCurrentUser(UserModel()))).called(1);
        });

    blocTest(
        'Expects [UpdatingUser, UserUpdateFailed] when exceptions is thrown',
        build: () async {
          when(
            mockEditProfileRepository.updateUserInfo(
              name: anyNamed('name'),
              email: anyNamed('email'),
              currentUser: anyNamed('currentUser'),
              pickedPhoto: anyNamed('pickedPhoto'),
            ),
          ).thenThrow(Exception());
          return editProfileBloc;
        },
        act: (editProfileBloc) async => editProfileBloc.add(
              UpdateUserInfo(
                name: 'name',
                email: 'email',
                currentUser: UserModel(),
                pickedPhoto: null,
              ),
            ),
        expect: [
          UpdatingUser(),
          UserUpdateFailed(),
        ],
        verify: (editProfileBloc) async {
          verify(
            mockEditProfileRepository.updateUserInfo(
              name: anyNamed('name'),
              email: anyNamed('email'),
              currentUser: anyNamed('currentUser'),
              pickedPhoto: anyNamed('pickedPhoto'),
            ),
          ).called(1);
          verifyNever(mockUserBloc.add(UpdateCurrentUser(UserModel())));
        });
  });
}
