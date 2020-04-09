import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('DespesaImageState tests', () {
    test('states', () {
      expect(InitialDespesaImageState(), InitialDespesaImageState());
      expect(LaunchUrlFailed(), LaunchUrlFailed());
    });
  });
}
