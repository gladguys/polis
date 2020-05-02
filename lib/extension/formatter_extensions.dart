import 'package:intl/intl.dart';

extension StringExtension on String {
  String capitalizeUpperCase() {
    return this[0] + substring(1).toLowerCase();
  }

  String removeDot() {
    return replaceAll('.', '');
  }
}

extension NumberExtension on String {
  String formatCurrency() {
    return NumberFormat.currency(
            locale: 'pt_BR', symbol: 'R\$', decimalDigits: 2)
        .format(double.parse(this));
  }
}

extension DoubleExtension on double {
  String formatCurrency() {
    return NumberFormat.currency(
            locale: 'pt_BR', symbol: 'R\$', decimalDigits: 2)
        .format(this);
  }
}

extension DateExtension on String {
  String formatDate() => DateFormat('d MMM y', 'pt_br')
      .format(DateFormat('yyyy-MM-dd').parse(this));
  
  String formatDateBig() => DateFormat("dd 'de' MMMM 'de' y", 'pt_br')
      .format(DateFormat('yyyy-MM-dd').parse(this));
}
