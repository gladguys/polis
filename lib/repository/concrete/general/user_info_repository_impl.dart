import 'package:geocoder/geocoder.dart';
import 'package:geocoder/services/base.dart';
import 'package:geolocator/geolocator.dart';

import '../../../model/user_position_info.dart';
import '../../abstract/user_info_repository.dart';

class UserInfoRepositoryImpl implements UserInfoRepository {
  UserInfoRepositoryImpl({this.geolocator, this.geocoding});

  final Geolocator geolocator;
  final Geocoding geocoding;

  @override
  Future<UserPositionInfo> getUserPositionInfo() async {
    try {
      print('ccccc');
      final position = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print('1');
      final coordinates = Coordinates(position.latitude, position.longitude);

      print('2');
      final addresses =
          await geocoding.findAddressesFromCoordinates(coordinates);
      print('3');
      final firstResult = addresses.first;
      print(firstResult);
      if (firstResult != null) {
        print('4');
        final splitInfo = firstResult.addressLine.split(',');
        final isBrazil = splitInfo[3].trim() == 'Brazil';
        final cityStatePart = splitInfo[3].split('-');
        print(isBrazil);
        print(cityStatePart);
        return UserPositionInfo(
          isBrazil: isBrazil,
          stateId: isBrazil ? cityStatePart[1].trim() : cityStatePart[0].trim(),
        );
      }
      print('5');
      return null;
    } on Exception catch (e) {
      print(e);
      throw null;
    }
  }
}
