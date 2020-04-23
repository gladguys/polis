import 'package:flutter_test/flutter_test.dart';
import 'package:polis/widget/timeline_tile.dart';

void main() {
  group('TimelineTile tests', () {
    test('assert', () {
      expect(() => TimelineTile(child: null), throwsAssertionError);
    });
  });
}
