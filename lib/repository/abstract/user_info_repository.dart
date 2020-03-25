import '../../model/user_position_info.dart';

abstract class UserInfoRepository {
  Future<UserPositionInfo> getUserPositionInfo();
}
