import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/utils/date_utils.dart';

void main() {
  group('Date utils tests', () {
    test('getMonthNameByNumber', () {
      expect(getMonthNameByNumber(1), 'Janeiro');
      expect(getMonthNameByNumber(2), 'Fevereiro');
      expect(getMonthNameByNumber(3), 'Março');
      expect(getMonthNameByNumber(4), 'Abril');
      expect(getMonthNameByNumber(5), 'Maio');
      expect(getMonthNameByNumber(6), 'Junho');
      expect(getMonthNameByNumber(7), 'Julho');
      expect(getMonthNameByNumber(8), 'Agosto');
      expect(getMonthNameByNumber(9), 'Setembro');
      expect(getMonthNameByNumber(10), 'Outubro');
      expect(getMonthNameByNumber(11), 'Novembro');
      expect(getMonthNameByNumber(12), 'Dezembro');
    });
  });
}
