import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class UrlLauncherService {
  Future<bool> canLaunchEmailUrl(String email) async {
    return await canLaunch('$kLaunchUrlEmail:$email');
  }

  Future<bool> launchEmailUrl(String email) {
    return launch('$kLaunchUrlEmail:$email');
  }

  Future<bool> launchUrl(String url) {
    try {
      return launch(url);
    } on Exception {
      rethrow;
    }
  }
}
