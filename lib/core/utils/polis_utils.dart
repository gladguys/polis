import 'dart:io';

bool isTest() {
  return Platform.environment.containsKey('FLUTTER_TEST');
}
