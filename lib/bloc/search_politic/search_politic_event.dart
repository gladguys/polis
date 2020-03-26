import 'package:equatable/equatable.dart';

abstract class SearchPoliticEvent extends Equatable {
  const SearchPoliticEvent();
}

class FetchPolitics extends SearchPoliticEvent {
  @override
  List<Object> get props => [];
}

class ChangeSearchPoliticFilter extends SearchPoliticEvent {
  ChangeSearchPoliticFilter({this.estado, this.partido, this.term});

  final String estado;
  final String partido;
  final String term;

  @override
  List<Object> get props => [estado, partido, term];
}
