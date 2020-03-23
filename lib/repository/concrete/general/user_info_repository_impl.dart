import 'package:geocoder/geocoder.dart';
import 'package:geocoder/services/base.dart';
import 'package:geolocator/geolocator.dart';

import '../../../model/user_position_info.dart';
import '../../abstract/user_info_repository.dart';

class UserInfoRepositoryImpl implements UserInfoRepository {
  UserInfoRepositoryImpl({this.geolocator, this.geocoding})
      : assert(geolocator != null),
        assert(geocoding != null);

  final Geolocator geolocator;
  final Geocoding geocoding;

  @override
  Future<UserPositionInfo> getUserPositionInfo() async {
    try {
      final position = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      final coordinates = Coordinates(position.latitude, position.longitude);

      final addresses =
          await geocoding.findAddressesFromCoordinates(coordinates);
      if (addresses.isNotEmpty) {
        final firstResult = addresses.first;
        final splitInfo = firstResult.addressLine.split(',');
        final isBrazil = splitInfo[5].trim() == 'Brazil';
        final cityStatePart = splitInfo[3].split('-');
        return UserPositionInfo(
          isBrazil: isBrazil,
          stateId: isBrazil ? cityStatePart[1].trim() : cityStatePart[0].trim(),
        );
      }
      return null;
    } on Exception {
      return null;
    }
  }
}
