import 'package:polis/i18n/i18n.dart';

class Validators {
  static bool validateEmail(String email) {
    if (email == null || email.isEmpty) {
      return false;
    }
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
  }

  static String emailValidator(String email) {
    if (email == null || email.isEmpty) {
      return REQUIRED_FIELD;
    }
    if (!validateEmail(email)) {
      return EMAIL_IS_INVALID;
    }
    return null;
  }
}
