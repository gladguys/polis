import 'package:equatable/equatable.dart';

import '../../model/politico_model.dart';

abstract class SearchPoliticState extends Equatable {
  const SearchPoliticState();
}

class InitialSearchPoliticState extends SearchPoliticState {
  @override
  List<Object> get props => [];
}

class FetchSearchPoliticsSuccess extends SearchPoliticState {
  FetchSearchPoliticsSuccess(this.politics);

  final List<PoliticoModel> politics;

  @override
  List<Object> get props => [politics];
}

class LoadingFetchPolitics extends SearchPoliticState {
  @override
  List<Object> get props => [];
}

class FetchSearchPoliticsFailed extends SearchPoliticState {
  @override
  List<Object> get props => [];
}

class SearchPoliticFilterChanged extends SearchPoliticState {
  SearchPoliticFilterChanged(this.politics);

  final List<PoliticoModel> politics;

  @override
  List<Object> get props => [politics];
}
