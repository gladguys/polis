import 'package:intl/intl.dart';

extension StringExtension on String {
  String capitalizeUpperCase() {
    return this[0] + substring(1).toLowerCase();
  }
}

extension NumberExtension on String {
  String formatCurrency() {
    return NumberFormat
      .currency(
        locale: 'pt_BR',
        symbol: 'R\$',
        decimalDigits: 2
      )
      .format(double.parse(this));
  }
}

extension DateExtension on String {
  String formatDate() {
    return DateFormat('d MMM y', 'pt_br')
      .format(DateFormat('yyyy-MM-dd').parse(this));
  }
}