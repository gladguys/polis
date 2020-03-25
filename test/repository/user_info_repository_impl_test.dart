import 'package:flutter_test/flutter_test.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/repository/concrete/general/user_info_repository_impl.dart';

import '../mock.dart';

void main() {
  group('UserInfoRepositoryImpl tests', () {
    UserInfoRepositoryImpl userInfoRepositoryImpl;
    MockGeolocator mockGeolocator;
    MockGeocoding mockGeocoding;

    setUp(() {
      mockGeolocator = MockGeolocator();
      mockGeocoding = MockGeocoding();
      userInfoRepositoryImpl = UserInfoRepositoryImpl(
        geolocator: mockGeolocator,
        geocoding: mockGeocoding,
      );
    });

    test('test asserts', () {
      expect(
          () => UserInfoRepositoryImpl(
                geolocator: null,
                geocoding: mockGeocoding,
              ),
          throwsAssertionError);

      expect(
          () => UserInfoRepositoryImpl(
                geolocator: mockGeolocator,
                geocoding: null,
              ),
          throwsAssertionError);
    });

    group('getUserPositionInfo', () {
      test('''should return UserPositionInfo when user on Brazil''', () async {
        final position = Position(latitude: 0.0, longitude: 0.0);
        final address = Address(
            addressLine:
                '''Shopping Aldeota ,500 Sala, 2023 - Aldeota, Fortaleza - CE, 60120-024, Brazil''');
        when(mockGeolocator.getCurrentPosition(
                desiredAccuracy: anyNamed('desiredAccuracy')))
            .thenAnswer(
          (_) => Future.value(position),
        );
        when(mockGeocoding.findAddressesFromCoordinates(any)).thenAnswer(
          (_) => Future.value([address]),
        );
        final userInfo = await userInfoRepositoryImpl.getUserPositionInfo();
        expect(userInfo.isBrazil, true);
        expect(userInfo.stateId, 'CE');
      });

      test('''should return null when no address found''', () async {
        final position = Position(latitude: 0.0, longitude: 0.0);
        when(mockGeolocator.getCurrentPosition(
                desiredAccuracy: anyNamed('desiredAccuracy')))
            .thenAnswer(
          (_) => Future.value(position),
        );
        when(mockGeocoding.findAddressesFromCoordinates(any)).thenAnswer(
          (_) => Future.value([]),
        );
        final userInfo = await userInfoRepositoryImpl.getUserPositionInfo();
        expect(userInfo, isNull);
      });

      test('should return null when exception occurs', () async {
        when(mockGeolocator.getCurrentPosition(
                desiredAccuracy: anyNamed('desiredAccuracy')))
            .thenThrow(Exception());
        final userInfo = await userInfoRepositoryImpl.getUserPositionInfo();
        expect(userInfo, isNull);
      });
    });
  });
}
