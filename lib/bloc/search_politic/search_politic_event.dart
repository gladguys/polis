part of 'search_politic_bloc.dart';

abstract class SearchPoliticEvent extends Equatable {
  const SearchPoliticEvent();
}

class FetchPolitics extends SearchPoliticEvent {
  FetchPolitics(this.userId);

  final String userId;

  @override
  List<Object> get props => [userId];
}

class ChangeSearchPoliticFilter extends SearchPoliticEvent {
  ChangeSearchPoliticFilter({this.estado, this.partido, this.term});

  final String estado;
  final String partido;
  final String term;

  @override
  List<Object> get props => [estado, partido, term];
}

class FollowUnfollowSearchPolitic extends SearchPoliticEvent {
  FollowUnfollowSearchPolitic({@required this.user, @required this.politico})
      : assert(user != null),
        assert(politico != null);

  final UserModel user;
  final PoliticoModel politico;

  @override
  List<Object> get props => [user, politico];
}

class ChangeFollowPoliticStatus extends SearchPoliticEvent {
  ChangeFollowPoliticStatus(
      {@required this.politico, @required this.isUserFollowingPolitic})
      : assert(politico != null),
        assert(isUserFollowingPolitic != null);

  final PoliticoModel politico;
  final bool isUserFollowingPolitic;

  @override
  List<Object> get props => [politico, isUserFollowingPolitic];
}
