import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/page/crunching_data/widget/searching_info.dart';

void main() {
  group('SearchingInfo tests', () {
    test('assert', () {
      expect(
          () => SearchingInfo(
                icon: null,
                text: '',
              ),
          throwsAssertionError);

      expect(
          () => SearchingInfo(
                icon: Icons.add,
                text: null,
              ),
          throwsAssertionError);
    });
  });
}
