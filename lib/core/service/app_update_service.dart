import 'package:in_app_update/in_app_update.dart';

class AppUpdateService {
  Future<AppUpdateInfo> checkForUpdate() async {
    return InAppUpdate.checkForUpdate();
  }

  Future<void> startFlexibleUpdate() async {
    InAppUpdate.startFlexibleUpdate();
  }
}
