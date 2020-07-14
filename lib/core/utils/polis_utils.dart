import 'dart:io';

bool isTest() {
  return Platform.environment.containsKey('FLUTTER_TEST');
}

String sanitizeString(String stringToBeSanitized) {
  return stringToBeSanitized.replaceAll('.', '').replaceAll(',', '.');
}
