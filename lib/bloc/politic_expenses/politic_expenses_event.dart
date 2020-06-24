import 'package:freezed_annotation/freezed_annotation.dart';

part 'politic_expenses_event.freezed.dart';

@freezed
abstract class PoliticExpensesEvent with _$PoliticExpensesEvent {
  factory PoliticExpensesEvent.getPoliticExpenses(String politicoId) =
      GetPoliticExpenses;
}
