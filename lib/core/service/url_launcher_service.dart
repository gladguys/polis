import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class UrlLauncherService {
  Future<bool> canLaunchEmailUrl(String email) async {
    try {
      return await canLaunch('$kLaunchUrlEmail:$email');
    } on Exception {
      rethrow;
    }
  }

  Future<bool> launchEmailUrl(String email) {
    try {
      return launch('$kLaunchUrlEmail:$email');
    } on Exception {
      rethrow;
    }
  }

  Future<bool> launchUrl(String url) {
    try {
      return launch(url);
    } on Exception {
      rethrow;
    }
  }
}
