import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('DocumentState tests', () {
    test('states', () {
      expect(InitialDocumentState(), InitialDocumentState());
      expect(LaunchUrlFailed(), LaunchUrlFailed());
    });
  });
}
