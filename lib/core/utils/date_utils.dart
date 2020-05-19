String getLastDayOfLastMonth() {
  final now = DateTime.now();
  final firstDayOfCurrentMonth = DateTime(now.year, now.month);
  final lastDayOfLastMonth =
      firstDayOfCurrentMonth.subtract(const Duration(days: 1)).day;
  return lastDayOfLastMonth.toString();
}

String getLastMonthName() {
  final now = DateTime.now();
  final currentMonthNumber = now.month;
  return getMonthNameByNumber(currentMonthNumber - 1);
}

String getMonthNameByNumber(int monthNumber) {
  assert(monthNumber >= 1 && monthNumber <= 12);
  switch (monthNumber) {
    case 1:
      return 'Janeiro';
    case 2:
      return 'Fevereiro';
    case 3:
      return 'Março';
    case 4:
      return 'Abril';
    case 5:
      return 'Maio';
    case 6:
      return 'Junho';
    case 7:
      return 'Julho';
    case 8:
      return 'Agosto';
    case 9:
      return 'Setembro';
    case 10:
      return 'Outubro';
    case 11:
      return 'Novembro';
    case 12:
      return 'Dezembro';
  }
  return null;
}
